<?php
// process/simpan_produk.php
// File ini menangani logika penyimpanan/pembaruan/penghapusan produk.

// Memulai session jika belum dimulai
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../includes/auth_check.php';       // Pastikan user sudah login
require_once __DIR__ . '/../includes/user_middleware.php'; // (PERUBAHAN) Sertakan middleware untuk isolasi data
require_once __DIR__ . '/../config/db.php';                // Sertakan file koneksi database

try {
    $conn = $db; // Menggunakan koneksi $db dari db.php

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // --- Proses Tambah/Edit Produk ---
        $product_id = $_POST['product_id'] ?? null;
        $name = trim($_POST['name'] ?? '');
        $unit_select = trim($_POST['unit'] ?? '');
        $unit_custom = trim($_POST['unit_custom'] ?? '');
        $unit = ($unit_select === 'custom') ? $unit_custom : $unit_select;
        
        // Harga jual default 0, akan diatur di halaman HPP
        $sale_price = 0;

        // Validasi dasar
        if (empty($name) || empty($unit)) {
            $_SESSION['product_message'] = ['text' => 'Nama produk dan satuan harus diisi.', 'type' => 'error'];
            header("Location: /cornerbites-sia/pages/produk.php");
            exit();
        }

        if ($product_id) {
            // Cek apakah ada produk lain dengan nama dan satuan yang sama (exclude current product)
            $duplicateCount = countWithUserId($conn, 'products', 'name = :name AND unit = :unit AND id != :id', [':name' => $name, ':unit' => $unit, ':id' => $product_id]);
            if ($duplicateCount > 0) {
                $_SESSION['product_message'] = ['text' => "Produk lain dengan nama '$name' dan satuan '$unit' sudah ada. Silakan gunakan kombinasi nama dan satuan yang berbeda.", 'type' => 'error'];
                header("Location: /cornerbites-sia/pages/produk.php");
                exit();
            }

            // --- (PERUBAHAN) Update Produk menggunakan fungsi middleware ---
            $dataToUpdate = ['name' => $name, 'unit' => $unit];
            $whereClause = 'id = :id';
            $whereParams = [':id' => $product_id];

            if (updateWithUserId($conn, 'products', $dataToUpdate, $whereClause, $whereParams)) {
                $_SESSION['product_message'] = ['text' => 'Produk berhasil diperbarui!', 'type' => 'success'];
            } else {
                $_SESSION['product_message'] = ['text' => 'Gagal memperbarui produk atau tidak ada perubahan.', 'type' => 'error'];
            }
        } else {
            // Cek apakah produk dengan nama dan satuan yang sama sudah ada untuk user ini
            $duplicateCount = countWithUserId($conn, 'products', 'name = :name AND unit = :unit', [':name' => $name, ':unit' => $unit]);
            if ($duplicateCount > 0) {
                $_SESSION['product_message'] = ['text' => "Produk dengan nama '$name' dan satuan '$unit' sudah ada. Silakan gunakan kombinasi nama dan satuan yang berbeda.", 'type' => 'error'];
                header("Location: /cornerbites-sia/pages/produk.php");
                exit();
            }

            // --- (PERUBAHAN) Tambah Produk Baru menggunakan fungsi middleware ---
            $dataToInsert = [
                'name' => $name,
                'unit' => $unit,
                'sale_price' => $sale_price
                // user_id akan ditambahkan secara otomatis oleh fungsi insertWithUserId
            ];

            if (insertWithUserId($conn, 'products', $dataToInsert)) {
                $_SESSION['product_message'] = ['text' => 'Produk baru berhasil ditambahkan! Anda dapat menambahkan bahan baku & kemasan di halaman Manajemen Bahan Baku & Kemasan.', 'type' => 'success'];
            } else {
                $_SESSION['product_message'] = ['text' => 'Gagal menambahkan produk baru.', 'type' => 'error'];
            }
        }

        header("Location: /cornerbites-sia/pages/produk.php");
        exit();

    } elseif ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['action']) && $_GET['action'] == 'check_recipes') {
        // Endpoint untuk mengecek resep yang menggunakan produk
        $product_id = $_GET['id'] ?? null;
        
        if (empty($product_id)) {
            echo json_encode(['error' => 'ID produk tidak ditemukan']);
            exit();
        }
        
        // Get product details
        $stmt = selectWithUserId($conn, 'products', 'name, unit', 'id = :id', [':id' => $product_id]);
        $product = $stmt->fetch();
        
        if (!$product) {
            echo json_encode(['error' => 'Produk tidak ditemukan']);
            exit();
        }
        
        // Get recipes that use this product
        $stmt = $conn->prepare("
            SELECT pr.id as recipe_id, p.name as product_name, p.unit as product_unit
            FROM product_recipes pr 
            JOIN products p ON pr.product_id = p.id 
            WHERE pr.product_id = :product_id AND p.user_id = :user_id
        ");
        $stmt->execute([':product_id' => $product_id, ':user_id' => $_SESSION['user_id']]);
        $recipes = $stmt->fetchAll();
        
        echo json_encode([
            'product' => $product,
            'recipes' => $recipes,
            'count' => count($recipes)
        ]);
        exit();
        
    } elseif ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['action']) && $_GET['action'] == 'delete') {
        // --- (PERUBAHAN) Proses Hapus Produk menggunakan fungsi middleware ---
        $product_id = $_GET['id'] ?? null;

        if (empty($product_id)) {
            $_SESSION['product_message'] = ['text' => 'ID produk tidak ditemukan untuk dihapus.', 'type' => 'error'];
            header("Location: /cornerbites-sia/pages/produk.php");
            exit();
        }

        // Cek apakah ini force delete
        $force_delete = isset($_GET['force']) && $_GET['force'] == '1';
        
        if ($force_delete) {
            // Force delete - hapus semua relasi dan produk
            // Hapus dari product_recipes terlebih dahulu
            deleteWithUserId($conn, 'product_recipes', 'product_id = :product_id', [':product_id' => $product_id]);
            
            // Kemudian hapus produk
            $whereClause = 'id = :id';
            $whereParams = [':id' => $product_id];
            if (deleteWithUserId($conn, 'products', $whereClause, $whereParams)) {
                $_SESSION['product_message'] = ['text' => 'Produk dan semua resep terkait berhasil dihapus!', 'type' => 'success'];
            } else {
                $_SESSION['product_message'] = ['text' => 'Gagal menghapus produk.', 'type' => 'error'];
            }
            header("Location: /cornerbites-sia/pages/produk.php");
            exit();
        } else {
            // Cek apakah produk terkait dengan resep (milik user ini)
            $recipeCount = countWithUserId($conn, 'product_recipes', 'product_id = :product_id', [':product_id' => $product_id]);
            if ($recipeCount > 0) {
                $_SESSION['product_message'] = ['text' => 'Tidak bisa menghapus produk karena sudah memiliki resep. Hapus resep terkait terlebih dahulu.', 'type' => 'error'];
                header("Location: /cornerbites-sia/pages/produk.php");
                exit();
            }
        }
        
        $whereClause = 'id = :id';
        $whereParams = [':id' => $product_id];
        if (deleteWithUserId($conn, 'products', $whereClause, $whereParams)) {
            $_SESSION['product_message'] = ['text' => 'Produk berhasil dihapus!', 'type' => 'success'];
        } else {
            $_SESSION['product_message'] = ['text' => 'Gagal menghapus produk.', 'type' => 'error'];
        }
        header("Location: /cornerbites-sia/pages/produk.php");
        exit();

    } else {
        // Jika diakses langsung tanpa POST/GET yang valid, redirect
        header("Location: /cornerbites-sia/pages/produk.php");
        exit();
    }

} catch (PDOException $e) {
    error_log("Error simpan/hapus produk: " . $e->getMessage());
    
    // Handle specific database errors with user-friendly messages
    if ($e->getCode() == 23000) {
        // Integrity constraint violation (duplicate entry)
        if (strpos($e->getMessage(), 'unique_product_per_user') !== false) {
            $_SESSION['product_message'] = ['text' => 'Produk dengan nama dan satuan yang sama sudah ada untuk akun Anda. Gunakan nama atau satuan yang berbeda.', 'type' => 'error'];
        } else {
            $_SESSION['product_message'] = ['text' => 'Data yang dimasukkan tidak valid atau sudah ada.', 'type' => 'error'];
        }
    } else {
        $_SESSION['product_message'] = ['text' => 'Terjadi kesalahan sistem. Silakan coba lagi.', 'type' => 'error'];
    }
    
    header("Location: /cornerbites-sia/pages/produk.php");
    exit();
}
?>