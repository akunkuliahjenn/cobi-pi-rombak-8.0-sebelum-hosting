<?php // Removing stock-related features from the backend process.
// process/simpan_bahan_baku.php
// File ini menangani logika penyimpanan/pembaruan/penghapusan bahan baku.

ini_set('display_errors', 1);
error_reporting(E_ALL);

if (session_status() === PHP_SESSION_NONE) session_start();

require_once __DIR__ . '/../includes/auth_check.php'; // Pastikan user sudah login
require_once __DIR__ . '/../includes/user_middleware.php'; // Sertakan middleware untuk isolasi data
require_once __DIR__ . '/../config/db.php'; // Sertakan file koneksi database

try {
    $conn = $db; // Menggunakan koneksi $db dari db.php

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // --- Proses Tambah/Edit Bahan Baku ---
        $bahan_baku_id = $_POST['bahan_baku_id'] ?? null;
        $name = trim($_POST['name'] ?? '');
        $brand = trim($_POST['brand'] ?? '');
        $type = trim($_POST['type'] ?? 'bahan');
        $unit = trim($_POST['unit'] ?? '');
        $purchase_size = (float) ($_POST['purchase_size'] ?? 0);
        // Clean up price input (remove Indonesian number formatting)
        $purchase_price_input = trim($_POST['purchase_price_per_unit'] ?? '');
        $purchase_price_per_unit = (float) str_replace(['.', ','], ['', '.'], $purchase_price_input);

        // Validasi dasar
        if (empty($name) || empty($unit) || $purchase_size <= 0 || $purchase_price_per_unit <= 0) {
            $_SESSION['bahan_baku_message'] = ['text' => 'Nama, satuan, ukuran beli, dan harga beli per unit (harus > 0) tidak boleh kosong.', 'type' => 'error'];
            header("Location: /cornerbites-sia/pages/bahan_baku.php");
            exit();
        }

        if ($bahan_baku_id) {
            // Update Bahan Baku menggunakan middleware
            // Cek duplikasi nama, brand, dan unit untuk user yang sama (exclude current record)
            $duplicateCount = countWithUserId($conn, 'raw_materials', 'name = :name AND brand = :brand AND unit = :unit AND id != :id', [':name' => $name, ':brand' => $brand, ':unit' => $unit, ':id' => $bahan_baku_id]);
            if ($duplicateCount > 0) {
                $itemType = ($type === 'kemasan') ? 'Kemasan' : 'Bahan baku';
                $_SESSION['bahan_baku_message'] = ['text' => $itemType . ' dengan nama "' . $name . '", merek "' . $brand . '", dan satuan "' . $unit . '" sudah ada. Silakan gunakan kombinasi yang berbeda.', 'type' => 'error'];
                header("Location: /cornerbites-sia/pages/bahan_baku.php");
                exit();
            }

            $dataToUpdate = [
                'name' => $name,
                'brand' => $brand,
                'type' => $type,
                'unit' => $unit,
                'default_package_quantity' => $purchase_size,
                'purchase_price_per_unit' => $purchase_price_per_unit,
                'updated_at' => date('Y-m-d H:i:s')
            ];
            $whereClause = 'id = :id';
            $whereParams = [':id' => $bahan_baku_id];

            try {
                if (updateWithUserId($conn, 'raw_materials', $dataToUpdate, $whereClause, $whereParams)) {
                    $itemType = ($type === 'kemasan') ? 'kemasan' : 'bahan baku';
                    $_SESSION['bahan_baku_message'] = ['text' => ucfirst($itemType) . ' berhasil diperbarui!', 'type' => 'success'];
                } else {
                    $_SESSION['bahan_baku_message'] = ['text' => 'Gagal memperbarui data. Silakan coba lagi.', 'type' => 'error'];
                }
            } catch (PDOException $e) {
                // Handle constraint errors untuk update
                if (strpos($e->getMessage(), 'Duplicate entry') !== false || strpos($e->getMessage(), 'UNIQUE constraint') !== false) {
                    $itemType = ($type === 'kemasan') ? 'Kemasan' : 'Bahan baku';
                    $_SESSION['bahan_baku_message'] = ['text' => $itemType . ' dengan kombinasi nama, merek, dan satuan tersebut sudah ada. Silakan gunakan kombinasi yang berbeda.', 'type' => 'error'];
                } else {
                    $_SESSION['bahan_baku_message'] = ['text' => 'Terjadi kesalahan saat memperbarui data. Silakan coba lagi atau hubungi administrator jika masalah berlanjut.', 'type' => 'error'];
                }
                header("Location: /cornerbites-sia/pages/bahan_baku.php");
                exit();
            }
        } else {
            // Tambah Bahan Baku Baru
            // Cek duplikasi nama, brand, dan unit untuk user yang sama menggunakan middleware
            $duplicateCount = countWithUserId($conn, 'raw_materials', 'name = :name AND brand = :brand AND unit = :unit', [':name' => $name, ':brand' => $brand, ':unit' => $unit]);
            if ($duplicateCount > 0) {
                $itemType = ($type === 'kemasan') ? 'Kemasan' : 'Bahan baku';
                $_SESSION['bahan_baku_message'] = ['text' => $itemType . ' dengan nama "' . $name . '", merek "' . $brand . '", dan satuan "' . $unit . '" sudah ada. Silakan gunakan kombinasi yang berbeda.', 'type' => 'error'];
                header("Location: /cornerbites-sia/pages/bahan_baku.php");
                exit();
            }

            $dataToInsert = [
                'name' => $name,
                'brand' => $brand,
                'type' => $type,
                'unit' => $unit,
                'default_package_quantity' => $purchase_size,
                'purchase_price_per_unit' => $purchase_price_per_unit
                // user_id akan ditambahkan secara otomatis oleh fungsi insertWithUserId
            ];

            try {
                if (insertWithUserId($conn, 'raw_materials', $dataToInsert)) {
                    $itemType = ($type === 'kemasan') ? 'kemasan' : 'bahan baku';
                    $_SESSION['bahan_baku_message'] = ['text' => ucfirst($itemType) . ' baru berhasil ditambahkan!', 'type' => 'success'];
                } else {
                    $itemType = ($type === 'kemasan') ? 'kemasan' : 'bahan baku';
                    $_SESSION['bahan_baku_message'] = ['text' => 'Gagal menambahkan ' . $itemType . ' baru. Silakan coba lagi.', 'type' => 'error'];
                }
            } catch (PDOException $e) {
                // Handle constraint errors dengan pesan yang lebih user-friendly
                if (strpos($e->getMessage(), 'Duplicate entry') !== false || strpos($e->getMessage(), 'UNIQUE constraint') !== false) {
                    $itemType = ($type === 'kemasan') ? 'Kemasan' : 'Bahan baku';
                    $_SESSION['bahan_baku_message'] = ['text' => $itemType . ' dengan kombinasi nama, merek, dan satuan tersebut sudah ada. Silakan gunakan kombinasi yang berbeda.', 'type' => 'error'];
                } else {
                    $_SESSION['bahan_baku_message'] = ['text' => 'Terjadi kesalahan saat menyimpan data. Silakan coba lagi atau hubungi administrator jika masalah berlanjut.', 'type' => 'error'];
                }
                header("Location: /cornerbites-sia/pages/bahan_baku.php");
                exit();
            }
        }

        // Build redirect URL with preserved limit parameters
        $redirectUrl = "../pages/bahan_baku.php";
        $params = [];

        // Preserve limit parameters if they exist in previous request
        if (isset($_POST['bahan_limit']) && !empty($_POST['bahan_limit'])) {
            $params['bahan_limit'] = $_POST['bahan_limit'];
        }
        if (isset($_POST['kemasan_limit']) && !empty($_POST['kemasan_limit'])) {
            $params['kemasan_limit'] = $_POST['kemasan_limit'];
        }

        if (!empty($params)) {
            $redirectUrl .= '?' . http_build_query($params);
        }

        header("Location: $redirectUrl");
        exit();

    } elseif ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['action']) && $_GET['action'] == 'check_recipes') {
        // Endpoint untuk mengecek resep yang menggunakan bahan baku/kemasan
        $material_id = $_GET['id'] ?? null;

        if (empty($material_id)) {
            echo json_encode(['error' => 'ID bahan baku/kemasan tidak ditemukan']);
            exit();
        }

        // Get material details
        $stmt = selectWithUserId($conn, 'raw_materials', 'name, brand, unit, type', 'id = :id', [':id' => $material_id]);
        $material = $stmt->fetch();

        if (!$material) {
            echo json_encode(['error' => 'Bahan baku/kemasan tidak ditemukan']);
            exit();
        }

        // Get products that use this material
        $sql = "SELECT p.name as product_name, p.unit as product_unit, pr.quantity
                FROM product_recipes pr 
                JOIN products p ON pr.product_id = p.id 
                WHERE pr.raw_material_id = :material_id AND pr.user_id = :user_id";

        $stmt = $conn->prepare($sql);
        $stmt->execute([':material_id' => $material_id, ':user_id' => $_SESSION['user_id']]);
        $recipes = $stmt->fetchAll();

        echo json_encode([
            'material' => $material,
            'recipes' => $recipes,
            'count' => count($recipes)
        ]);
        exit();

    } elseif ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'delete' && isset($_GET['id'])) {
        // --- Proses Hapus Bahan Baku ---
        $bahan_baku_id = (int) $_GET['id'];

        if (empty($bahan_baku_id)) {
            $_SESSION['bahan_baku_message'] = ['text' => 'ID bahan baku tidak ditemukan untuk dihapus.', 'type' => 'error'];
            header("Location: /cornerbites-sia/pages/bahan_baku.php");
            exit();
        }

        // Cek apakah ini force delete
        $force_delete = isset($_GET['force']) && $_GET['force'] == '1';

        if ($force_delete) {
            // Force delete - hapus semua relasi dan bahan baku
            try {
                $conn->beginTransaction();

                // Hapus dari product_recipes terlebih dahulu
                $whereClauseRecipe = 'raw_material_id = :raw_material_id';
                $whereParamsRecipe = [':raw_material_id' => $bahan_baku_id];
                deleteWithUserId($conn, 'product_recipes', $whereClauseRecipe, $whereParamsRecipe);

                // Kemudian hapus bahan baku/kemasan
                $whereClause = 'id = :id';
                $whereParams = [':id' => $bahan_baku_id];
                if (deleteWithUserId($conn, 'raw_materials', $whereClause, $whereParams)) {
                    $conn->commit();
                    $_SESSION['bahan_baku_message'] = ['text' => 'Bahan baku/kemasan dan semua resep terkait berhasil dihapus!', 'type' => 'success'];
                } else {
                    $conn->rollBack();
                    $_SESSION['bahan_baku_message'] = ['text' => 'Gagal menghapus bahan baku/kemasan.', 'type' => 'error'];
                }
            } catch (Exception $e) {
                $conn->rollBack();
                $_SESSION['bahan_baku_message'] = ['text' => 'Terjadi kesalahan saat menghapus: ' . $e->getMessage(), 'type' => 'error'];
            }
            header("Location: /cornerbites-sia/pages/bahan_baku.php");
            exit();
        } else {
            // Cek apakah bahan baku terkait dengan resep (milik user ini)
            $recipeCount = countWithUserId($conn, 'product_recipes', 'raw_material_id = :raw_material_id', [':raw_material_id' => $bahan_baku_id]);
            if ($recipeCount > 0) {
                $_SESSION['bahan_baku_message'] = ['text' => 'Tidak bisa menghapus bahan baku/kemasan karena sudah digunakan dalam resep. Hapus resep terkait terlebih dahulu.', 'type' => 'error'];
                header("Location: /cornerbites-sia/pages/bahan_baku.php");
                exit();
            }
        }

        $whereClause = 'id = :id';
        $whereParams = [':id' => $bahan_baku_id];
        if (deleteWithUserId($conn, 'raw_materials', $whereClause, $whereParams)) {
            $_SESSION['bahan_baku_message'] = ['text' => 'Bahan baku/kemasan berhasil dihapus!', 'type' => 'success'];
        } else {
            $_SESSION['bahan_baku_message'] = ['text' => 'Gagal menghapus bahan baku/kemasan.', 'type' => 'error'];
        }
        header("Location: /cornerbites-sia/pages/bahan_baku.php");
        exit();

    } else {
        // Jika diakses langsung tanpa POST/GET yang valid, redirect
        header("Location: /cornerbites-sia/pages/bahan_baku.php");
        exit();
    }

} catch (PDOException $e) {
    error_log("Error simpan/hapus bahan baku: " . $e->getMessage());
    $_SESSION['bahan_baku_message'] = ['text' => 'Terjadi kesalahan sistem: ' . $e->getMessage(), 'type' => 'error'];
    header("Location: /cornerbites-sia/pages/bahan_baku.php");
    exit();
}