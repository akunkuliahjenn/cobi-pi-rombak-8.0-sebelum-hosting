<?php
// pages/bahan_baku.php
// Halaman manajemen data bahan baku (CRUD) dengan pagination dan pencarian

require_once __DIR__ . '/../includes/secure_auth_check.php';
require_once __DIR__ . '/../includes/user_middleware.php';
require_once __DIR__ . '/../config/db.php';

// Handle AJAX request
if (isset($_GET['ajax']) && $_GET['ajax'] == '1') {
    ob_start();
    $ajaxType = $_GET['ajax_type'] ?? '';

    if ($ajaxType === 'raw') {
        // Handle raw materials AJAX
        $searchQueryRaw = $_GET['search_raw'] ?? '';
        $rawMaterialsLimit = isset($_GET['bahan_limit']) && in_array((int)$_GET['bahan_limit'], [5, 10, 15, 20, 25]) ? (int)$_GET['bahan_limit'] : 5;

        try {
            $conn = $db;

            // Count total for pagination logic dengan user isolation
            $totalRawCount = countWithUserId($conn, 'raw_materials', "type = 'bahan'" . (!empty($searchQueryRaw) ? " AND name LIKE :search" : ""), 
                !empty($searchQueryRaw) ? [':search' => '%' . $searchQueryRaw . '%'] : []);

            // Get raw materials dengan user isolation
            $whereClause = "type = 'bahan'";
            $whereParams = [];
            if (!empty($searchQueryRaw)) {
                $whereClause .= " AND name LIKE :search";
                $whereParams[':search'] = '%' . $searchQueryRaw . '%';
            }

            $rawMaterials = selectWithUserId($conn, 'raw_materials', '*', $whereClause, $whereParams, 'name ASC', "$rawMaterialsLimit OFFSET " . (isset($_GET['raw_page']) ? max((int)$_GET['raw_page'] - 1, 0) * $rawMaterialsLimit : 0));

            // Output raw materials table
            if (!empty($rawMaterials)): ?>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Bahan</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Merek</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ukuran Kemasan</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Harga (Rp)</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <?php foreach ($rawMaterials as $material): ?>
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($material['name']); ?></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-500"><?php echo !empty($material['brand']) ? htmlspecialchars($material['brand']) : '-'; ?></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-900"><?php echo number_format($material['default_package_quantity'], ($material['default_package_quantity'] == floor($material['default_package_quantity'])) ? 0 : 1, ',', '.'); ?> <?php echo htmlspecialchars($material['unit']); ?></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm font-semibold text-green-600">
                                            Rp <?php echo number_format($material['purchase_price_per_unit'], 0, ',', '.'); ?>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <div class="flex items-center space-x-2">
                                            <button onclick="editBahanBaku(<?php echo htmlspecialchars(json_encode($material)); ?>); scrollToForm()"
                                                    class="inline-flex items-center px-3 py-1 border border-indigo-300 text-xs font-medium rounded-md text-indigo-700 bg-indigo-50 hover:bg-indigo-100 transition duration-200">
                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                                </svg>
                                                Edit
                                            </button>
                                            <button onclick="showDeleteModal('<?php echo htmlspecialchars($material['id']); ?>', '<?php echo htmlspecialchars($material['name']); ?>', 'bahan')" 
                                                    class="inline-flex items-center px-3 py-1 border border-red-300 text-xs font-medium rounded-md text-red-700 bg-red-50 hover:bg-red-100 transition duration-200">
                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                                </svg>
                                                Hapus
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <div class="text-center py-12 text-gray-500">
                    <svg class="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                    </svg>
                    <p class="text-lg font-medium">Belum ada bahan baku tercatat</p>
                    <p class="text-sm">Tambahkan bahan baku pertama Anda di atas</p>
                </div>
            <?php endif;

            // Add pagination controls
            $currentPage = isset($_GET['raw_page']) ? max((int)$_GET['raw_page'], 1) : 1;
            $totalPages = ceil($totalRawCount / $rawMaterialsLimit);
            
            if ($totalPages > 1): ?>
                <!-- Info pagination di bawah -->
                <div class="mt-4 text-sm text-gray-600">
                    Menampilkan <?php echo (($currentPage - 1) * $rawMaterialsLimit) + 1; ?> sampai <?php echo min($currentPage * $rawMaterialsLimit, $totalRawCount); ?> dari <?php echo $totalRawCount; ?> hasil
                </div>

                <!-- Pagination for Raw Materials -->
                <div class="flex items-center justify-end mt-4 space-x-2">
                    <?php if ($currentPage > 1): ?>
                        <a href="javascript:void(0)" onclick="loadRawData(<?php echo $currentPage - 1; ?>)"
                           class="px-3 py-2 text-sm bg-white border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors">
                            Prev
                        </a>
                    <?php endif; ?>

                    <?php 
                    $startPage = max(1, $currentPage - 2);
                    $endPage = min($totalPages, $currentPage + 2);
                    for ($i = $startPage; $i <= $endPage; $i++): 
                    ?>
                        <a href="javascript:void(0)" onclick="loadRawData(<?php echo $i; ?>)"
                           class="px-3 py-2 text-sm <?php echo ($i == $currentPage) ? 'bg-blue-600 text-white' : 'bg-white border border-gray-300 text-gray-700 hover:bg-gray-50'; ?> rounded-md transition-colors">
                            <?php echo $i; ?>
                        </a>
                    <?php endfor; ?>

                    <?php if ($currentPage < $totalPages): ?>
                        <a href="javascript:void(0)" onclick="loadRawData(<?php echo $currentPage + 1; ?>)"
                           class="px-3 py-2 text-sm bg-white border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors">
                            Next
                        </a>
                    <?php endif; ?>
                </div>
            <?php endif;

            // Add pagination info for AJAX
            echo '<script>updateRawPaginationInfo(' . $totalRawCount . ', ' . $rawMaterialsLimit . ');</script>';
            echo '<script>updateTotalCount("total-raw-count", ' . $totalRawCount . ');</script>';

            // Update tab badge for bahan
            $totalBahanForBadge = countWithUserId($conn, 'raw_materials', "type = 'bahan'");
            echo '<script>document.getElementById("badge-bahan").textContent = ' . $totalBahanForBadge . ';</script>';

        } catch (PDOException $e) {
            echo '<div class="col-span-full text-center py-12 text-red-600">Terjadi kesalahan saat memuat data bahan baku: ' . htmlspecialchars($e->getMessage()) . '</div>';
        }
    } elseif ($ajaxType === 'kemasan') {
        // Handle packaging materials AJAX
        $searchQueryPackaging = $_GET['search_kemasan'] ?? '';
        $packagingMaterialsLimit = isset($_GET['kemasan_limit']) && in_array((int)$_GET['kemasan_limit'], [5, 10, 15, 20, 25]) ? (int)$_GET['kemasan_limit'] : 5;

        try {
            $conn = $db;

            // Count total for pagination logic dengan user isolation
            $totalKemasanCount = countWithUserId($conn, 'raw_materials', "type = 'kemasan'" . (!empty($searchQueryPackaging) ? " AND name LIKE :search" : ""), 
                !empty($searchQueryPackaging) ? [':search' => '%' . $searchQueryPackaging . '%'] : []);

            // Get packaging materials dengan user isolation
            $whereClause = "type = 'kemasan'";
            $whereParams = [];
            if (!empty($searchQueryPackaging)) {
                $whereClause .= " AND name LIKE :search";
                $whereParams[':search'] = '%' . $searchQueryPackaging . '%';
            }

            $packagingMaterials = selectWithUserId($conn, 'raw_materials', '*', $whereClause, $whereParams, 'name ASC', "$packagingMaterialsLimit OFFSET " . (isset($_GET['kemasan_page']) ? max((int)$_GET['kemasan_page'] - 1, 0) * $packagingMaterialsLimit : 0));

            // Output packaging materials table
            if (!empty($packagingMaterials)): ?>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Kemasan</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Merek</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ukuran Kemasan</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Harga (Rp)</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <?php foreach ($packagingMaterials as $material): ?>
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($material['name']); ?></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-500"><?php echo !empty($material['brand']) ? htmlspecialchars($material['brand']) : '-'; ?></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-900"><?php echo number_format($material['default_package_quantity'], ($material['default_package_quantity'] == floor($material['default_package_quantity'])) ? 0 : 1, ',', '.'); ?> <?php echo htmlspecialchars($material['unit']); ?></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm font-semibold text-green-600">
                                            Rp <?php echo number_format($material['purchase_price_per_unit'], 0, ',', '.'); ?>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <div class="flex items-center space-x-2">
                                            <button onclick="editBahanBaku(<?php echo htmlspecialchars(json_encode($material)); ?>); scrollToForm()"
                                                    class="inline-flex items-center px-3 py-1 border border-indigo-300 text-xs font-medium rounded-md text-indigo-700 bg-indigo-50 hover:bg-indigo-100 transition duration-200">
                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                                </svg>
                                                Edit
                                            </button>
                                            <button onclick="showDeleteModal('<?php echo htmlspecialchars($material['id']); ?>', '<?php echo htmlspecialchars($material['name']); ?>', 'kemasan')" 
                                                    class="inline-flex items-center px-3 py-1 border border-red-300 text-xs font-medium rounded-md text-red-700 bg-red-50 hover:bg-red-100 transition duration-200">
                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                                </svg>
                                                Hapus
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <div class="text-center py-12 text-gray-500">
                    <svg class="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                    </svg>
                    <p class="text-lg font-medium">Belum ada kemasan tercatat</p>
                    <p class="text-sm">Tambahkan kemasan pertama Anda di atas</p>
                </div>
            <?php endif;

            // Add pagination controls
            $currentPage = isset($_GET['kemasan_page']) ? max((int)$_GET['kemasan_page'], 1) : 1;
            $totalPages = ceil($totalKemasanCount / $packagingMaterialsLimit);
            
            if ($totalPages > 1): ?>
                <!-- Info pagination di bawah -->
                <div class="mt-4 text-sm text-gray-600">
                    Menampilkan <?php echo (($currentPage - 1) * $packagingMaterialsLimit) + 1; ?> sampai <?php echo min($currentPage * $packagingMaterialsLimit, $totalKemasanCount); ?> dari <?php echo $totalKemasanCount; ?> hasil
                </div>

                <!-- Pagination for Packaging Materials -->
                <div class="flex items-center justify-end mt-4 space-x-2">
                    <?php if ($currentPage > 1): ?>
                        <a href="javascript:void(0)" onclick="loadKemasanData(<?php echo $currentPage - 1; ?>)"
                           class="px-3 py-2 text-sm bg-white border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors">
                            <?php echo $currentPage - 1; ?>
                        </a>
                    <?php endif; ?>

                    <a href="javascript:void(0)" onclick="loadKemasanData(<?php echo $currentPage; ?>)"
                       class="px-3 py-2 text-sm bg-blue-600 text-white rounded-md">
                        <?php echo $currentPage; ?>
                    </a>

                    <?php if ($currentPage < $totalPages): ?>
                        <a href="javascript:void(0)" onclick="loadKemasanData(<?php echo $currentPage + 1; ?>)"
                           class="px-3 py-2 text-sm bg-white border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors">
                            <?php echo $currentPage + 1; ?>
                        </a>
                    <?php endif; ?>

                    <?php if ($currentPage < $totalPages): ?>
                        <a href="javascript:void(0)" onclick="loadKemasanData(<?php echo $currentPage + 1; ?>)"
                           class="px-3 py-2 text-sm bg-white border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                            </svg>
                        </a>
                    <?php endif; ?>
                </div>
            <?php endif;

            // Add pagination info for AJAX
            echo '<script>updateKemasanPaginationInfo(' . $totalKemasanCount . ', ' . $packagingMaterialsLimit . ');</script>';
            echo '<script>updateTotalCount("total-kemasan-count", ' . $totalKemasanCount . ');</script>';

            // Update tab badge for kemasan
            $totalKemasanForBadge = countWithUserId($conn, 'raw_materials', "type = 'kemasan'");
            echo '<script>document.getElementById("badge-kemasan").textContent = ' . $totalKemasanForBadge . ';</script>';
        } catch (PDOException $e) {
            echo '<div class="col-span-full text-center py-12 text-red-600">Terjadi kesalahan saat memuat data kemasan: ' . htmlspecialchars($e->getMessage()) . '</div>';
        }
    }

    $content = ob_get_clean();
    echo $content;
    exit;
}

// Pesan sukses atau error setelah proses
$message = '';
$message_type = ''; // 'success' or 'error'
if (isset($_SESSION['bahan_baku_message'])) {
    $message = $_SESSION['bahan_baku_message']['text'];
    $message_type = $_SESSION['bahan_baku_message']['type'];
    unset($_SESSION['bahan_baku_message']);
}

// Pilihan unit dan jenis (type)
$unitOptions = ['kg', 'gram', 'liter', 'ml', 'pcs', 'buah', 'roll', 'meter', 'box', 'botol', 'lembar'];
$typeOptions = ['bahan', 'kemasan'];

// Inisialisasi variabel pencarian
$searchQueryRaw = $_GET['search_raw'] ?? '';
$searchQueryPackaging = $_GET['search_kemasan'] ?? '';

// --- Logika Pagination dan Pengambilan Data untuk BAHAN BAKU ---
$rawMaterials = [];
$totalRawMaterialsRows = 0;
$totalRawMaterialsPages = 1;
$rawMaterialsLimitOptions = [5, 10, 15, 20, 25];
$rawMaterialsLimit = isset($_GET['bahan_limit']) && in_array((int)$_GET['bahan_limit'], $rawMaterialsLimitOptions) ? (int)$_GET['bahan_limit'] : 5;
$rawMaterialsPage = isset($_GET['bahan_page']) ? max((int)$_GET['bahan_page'], 1) : 1;
$rawMaterialsOffset = ($rawMaterialsPage - 1) * $rawMaterialsLimit;

try {
    $conn = $db;

    // Count total bahan baku dengan user isolation
    $whereClauseCount = "type = 'bahan'";
    $whereParamsCount = [];
    if (!empty($searchQueryRaw)) {
        $whereClauseCount .= " AND name LIKE :search";
        $whereParamsCount[':search'] = '%' . $searchQueryRaw . '%';
    }
    $totalRawMaterialsRows = countWithUserId($conn, 'raw_materials', $whereClauseCount, $whereParamsCount);
    $totalRawMaterialsPages = ceil($totalRawMaterialsRows / $rawMaterialsLimit);

    // Pastikan halaman tidak melebihi total halaman yang ada untuk bahan baku
    if ($rawMaterialsPage > $totalRawMaterialsPages && $totalRawMaterialsPages > 0) {
        $rawMaterialsPage = $totalRawMaterialsPages;
        $rawMaterialsOffset = ($rawMaterialsPage - 1) * $rawMaterialsLimit;
    }

    // Get bahan baku dengan user isolation
    $whereClause = "type = 'bahan'";
    $whereParams = [];
    if (!empty($searchQueryRaw)) {
        $whereClause .= " AND name LIKE :search";
        $whereParams[':search'] = '%' . $searchQueryRaw . '%';
    }
    $rawMaterials = selectWithUserId($conn, 'raw_materials', '*', $whereClause, $whereParams, 'name ASC', $rawMaterialsLimit, $rawMaterialsOffset);

} catch (PDOException $e) {
    error_log("Error di halaman Bahan Baku (fetch bahan): " . $e->getMessage());
    $message = "Terjadi kesalahan saat memuat data bahan baku: " . $e->getMessage();
    $message_type = "error";
}

// --- Logika Pagination dan Pengambilan Data untuk KEMASAN ---
$packagingMaterials = [];
$totalPackagingMaterialsRows = 0;
$totalPackagingMaterialsPages = 1;
$packagingMaterialsLimitOptions = [5, 10, 15, 20, 25];
$packagingMaterialsLimit = isset($_GET['kemasan_limit']) && in_array((int)$_GET['kemasan_limit'], $packagingMaterialsLimitOptions) ? (int)$_GET['kemasan_limit'] : 5;
$packagingMaterialsPage = isset($_GET['kemasan_page']) ? max((int)$_GET['kemasan_page'], 1) : 1;
$packagingMaterialsOffset = ($packagingMaterialsPage - 1) * $packagingMaterialsLimit;

try {
    // Count total kemasan dengan user isolation
    $whereClauseCount = "type = 'kemasan'";
    $whereParamsCount = [];
    if (!empty($searchQueryPackaging)) {
        $whereClauseCount .= " AND name LIKE :search";
        $whereParamsCount[':search'] = '%' . $searchQueryPackaging . '%';
    }
    $totalPackagingMaterialsRows = countWithUserId($conn, 'raw_materials', $whereClauseCount, $whereParamsCount);
    $totalPackagingMaterialsPages = ceil($totalPackagingMaterialsRows / $packagingMaterialsLimit);

    // Pastikan halaman tidak melebihi total halaman yang ada untuk kemasan
    if ($packagingMaterialsPage > $totalPackagingMaterialsPages && $totalPackagingMaterialsPages > 0) {
        $packagingMaterialsPage = $totalPackagingMaterialsPages;
        $packagingMaterialsOffset = ($packagingMaterialsPage - 1) * $packagingMaterialsLimit;
    }

    // Get kemasan dengan user isolation
    $whereClause = "type = 'kemasan'";
    $whereParams = [];
    if (!empty($searchQueryPackaging)) {
        $whereClause .= " AND name LIKE :search";
        $whereParams[':search'] = '%' . $searchQueryPackaging . '%';
    }
    $packagingMaterials = selectWithUserId($conn, 'raw_materials', '*', $whereClause, $whereParams, 'name ASC', $packagingMaterialsLimit, $packagingMaterialsOffset);

} catch (PDOException $e) {
    error_log("Error di halaman Bahan Baku (fetch kemasan): " . $e->getMessage());
}

// Fungsi helper untuk membangun URL pagination dengan mempertahankan parameter lain
function buildPaginationUrl($baseUrl, $paramsToUpdate) {
    $queryParams = $_GET;
    foreach ($paramsToUpdate as $key => $value) {
        $queryParams[$key] = $value;
    }
    return $baseUrl . '?' . http_build_query($queryParams);
}

?>

<?php include_once __DIR__ . '/../includes/header.php'; ?>
<div class="flex h-screen bg-gray-50 font-sans">
    <?php include_once __DIR__ . '/../includes/sidebar.php'; ?>

    <div class="flex-1 flex flex-col overflow-hidden">
        <main class="flex-1 overflow-x-hidden overflow-y-auto bg-gradient-to-br from-gray-50 to-gray-100 p-6">
            <div class="max-w-7xl mx-auto">
                <!-- Header Section -->
                <div class="mb-8">
                    <h1 class="text-3xl font-bold text-gray-900 mb-2">Manajemen Bahan Baku & Kemasan</h1>
                    <p class="text-gray-600">Kelola stok dan harga bahan baku serta kemasan produk Anda</p>
                </div>

                <?php if (!empty($message)): ?>
                    <div class="mb-6 p-4 rounded-lg border-l-4 <?php echo ($message_type === 'success' ? 'bg-green-50 border-green-400 text-green-700' : 'bg-red-50 border-red-400 text-red-700'); ?>" role="alert">
                        <div class="flex">
                            <div class="flex-shrink-0">
                                <?php if ($message_type === 'success'): ?>
                                    <svg class="h-5 w-5 text-green-400" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                    </svg>
                                <?php else: ?>
                                    <svg class="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                    </svg>
                                <?php endif; ?>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm font-medium"><?php echo htmlspecialchars($message); ?></p>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>

                <!-- Form Tambah/Edit Bahan Baku/Kemasan -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 mb-8">
                    <div class="flex items-center mb-6">
                        <div class="p-2 bg-blue-100 rounded-lg mr-3">
                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                        </div>
                        <div>
                            <h2 class="text-xl font-semibold text-gray-800" id="form-title">Tambah Bahan Baku/Kemasan Baru</h2>
                            <p class="text-sm text-gray-600 mt-1">Isi detail bahan baku atau kemasan baru Anda atau gunakan form ini untuk mengedit yang sudah ada.</p>
                        </div>
                    </div>

                    <p class="text-sm text-gray-600 mb-4 bg-blue-50 border border-blue-200 rounded-lg p-3">
                        <svg class="w-4 h-4 inline mr-1 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0016 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
                        </svg>
                        <strong>Catatan:</strong> Form ini untuk menambah bahan/kemasan yang benar-benar baru. Jika bahan sudah ada dan hanya ingin mengubah harga/lainnya, gunakan tombol "Edit" pada daftar di bawah.
                    </p>

                    <form action="../process/simpan_bahan_baku.php" method="POST">
                        <input type="hidden" name="bahan_baku_id" id="bahan_baku_id">
                        <input type="hidden" name="bahan_limit" id="hidden_bahan_limit">
                        <input type="hidden" name="kemasan_limit" id="hidden_kemasan_limit">

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="name" class="block text-gray-700 text-sm font-semibold mb-2">Nama Bahan/Kemasan</label>
                                <input type="text" id="name" name="name" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" placeholder="Contoh: Gula Halus, Plastik Cup, Kemasan Box" required>
                                <p class="text-xs text-gray-500 mt-1">Nama yang jelas dan spesifik untuk identifikasi</p>
                            </div>

                            <div>
                                <label for="brand" class="block text-gray-700 text-sm font-semibold mb-2">Merek</label>
                                <input type="text" id="brand" name="brand" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" placeholder="Contoh: Gulaku, Indosalt, Rose Brand">
                                <p class="text-xs text-gray-500 mt-1">Opsional - untuk membedakan produk sejenis</p>
                            </div>

                            <div>
                                <label for="type" class="block text-gray-700 text-sm font-semibold mb-2">Kategori</label>
                                <select id="type" name="type" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" required>
                                    <option value="bahan">Bahan Baku (untuk produksi)</option>
                                    <option value="kemasan">Kemasan (untuk pembungkus)</option>
                                </select>
                                <p class="text-xs text-gray-500 mt-1">Pilih kategori yang sesuai</p>
                            </div>

                            <div>
                                <label for="unit" class="block text-gray-700 text-sm font-semibold mb-2">Satuan</label>
                                <select id="unit" name="unit" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" required>
                                    <?php foreach ($unitOptions as $unitOption): ?>
                                        <option value="<?php echo htmlspecialchars($unitOption); ?>"><?php echo htmlspecialchars($unitOption); ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <p class="text-xs text-gray-500 mt-1">Satuan yang digunakan dalam resep</p>
                            </div>

                            <div>
                                <label for="purchase_size" class="block text-gray-700 text-sm font-semibold mb-2" id="purchase_size_label">Ukuran Beli Kemasan Bahan</label>
                                <input type="number" step="0.01" id="purchase_size" name="purchase_size" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" placeholder="Contoh: 1000 (untuk 1 kg), 250 (untuk 250 gram)" min="0" required>
                                <p class="text-xs text-gray-500 mt-1" id="purchase_size_help">Isi per kemasan yang Anda beli (sesuai satuan di atas)</p>
                            </div>

                            <div>
                                <label for="purchase_price_per_unit" class="block text-gray-700 text-sm font-semibold mb-2" id="purchase_price_label">Harga Beli Per Kemasan</label>
                                <div class="relative">
                                    <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500 font-medium">Rp</span>
                                    <input type="text" id="purchase_price_per_unit" name="purchase_price_per_unit" class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" placeholder="15000" required>
                                </div>
                                <p class="text-xs text-gray-500 mt-1" id="purchase_price_help">Harga per kemasan saat pembelian</p>
                            </div>
                        </div>

                        <div class="flex items-center mt-8">
                            <button type="submit" id="submit_button" class="flex items-center px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                </svg>
                                Tambah Bahan
                            </button>
                            <button type="button" id="cancel_edit_button" class="hidden flex items-center px-6 py-3 bg-white hover:bg-gray-50 text-gray-600 hover:text-gray-800 font-semibold rounded-lg border border-gray-300 transition-colors focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 ml-3">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                </svg>
                                Batal Edit
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Daftar Bahan Baku & Kemasan dengan Tab Navigation -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                    <div class="flex items-center mb-6">
                        <div class="p-2 bg-indigo-100 rounded-lg mr-3">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                            </svg>
                        </div>
                        <div>
                            <h2 class="text-xl font-semibold text-gray-800">Daftar Inventori</h2>
                            <p class="text-sm text-gray-600">Kelola dan pantau semua bahan baku dan kemasan dalam inventori</p>
                        </div>
                    </div>

                    <!-- Tab Navigation -->
                    <div class="flex space-x-1 mb-6 bg-gray-100 p-1 rounded-lg" role="tablist">
                        <button id="tab-bahan" 
                                class="flex-1 px-4 py-2 text-sm font-medium rounded-md transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 bg-white text-blue-600 shadow-sm" 
                                role="tab" 
                                aria-selected="true"
                                onclick="switchTab('bahan')">
                            <div class="flex items-center justify-center space-x-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                                </svg>
                                <span>Bahan Baku</span>
                                <span id="badge-bahan" class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800"><?php echo $totalRawMaterialsRows; ?></span>
                            </div>
                        </button>
                        <button id="tab-kemasan" 
                                class="flex-1 px-4 py-2 text-sm font-medium rounded-md transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 text-gray-500 hover:text-gray-700" 
                                role="tab" 
                                aria-selected="false"
                                onclick="switchTab('kemasan')">
                            <div class="flex items-center justify-center space-x-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0H4m0 0l4-4m0 0l4 4m-4-4v4"></path>
                                </svg>
                                <span>Kemasan</span>
                                <span id="badge-kemasan" class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-600"><?php echo $totalPackagingMaterialsRows; ?></span>
                            </div>
                        </button>
                    </div>

                    <!-- Tab Content: Bahan Baku -->
                    <div id="content-bahan" class="tab-content" role="tabpanel">
                        <!-- Filter & Pencarian Bahan Baku -->
                        <div class="bg-gray-50 rounded-lg p-4 mb-6">
                            <div class="flex items-center mb-4">
                                <svg class="w-5 h-5 text-gray-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"></path>
                                </svg>
                                <h3 class="text-lg font-semibold text-gray-800">Filter & Pencarian Bahan Baku</h3>
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label for="search_raw" class="block text-sm font-medium text-gray-700 mb-2">Pencarian</label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                            </svg>
                                        </div>
                                        <input type="text" id="search_raw" name="search_raw" value="<?php echo htmlspecialchars($searchQueryRaw); ?>" 
                                               class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" 
                                               placeholder="Cari nama bahan...">
                                    </div>
                                </div>

                                <div>
                                    <label for="bahan_limit" class="block text-sm font-medium text-gray-700 mb-2">Per Halaman</label>
                                    <select id="bahan_limit" name="bahan_limit" 
                                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors">
                                        <?php foreach ($rawMaterialsLimitOptions as $option): ?>
                                            <option value="<?php echo $option; ?>" <?php echo $rawMaterialsLimit == $option ? 'selected' : ''; ?>>
                                                <?php echo $option; ?> Data
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Info Total Bahan Baku -->
                        <div class="mb-4">
                            <div class="flex justify-between items-center">
                                <p class="text-sm text-gray-600">
                                    Total: <span id="total-raw-count" class="font-semibold"><?php echo $totalRawMaterialsRows; ?></span> bahan baku
                                </p>
                            </div>
                        </div>

                        <!-- Table Bahan Baku -->
                        <div id="raw-materials-container">
                            <?php if (!empty($rawMaterials)): ?>
                                <div class="overflow-x-auto">
                                    <table class="min-w-full divide-y divide-gray-200">
                                        <thead class="bg-gray-50">
                                            <tr>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Bahan</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Merek</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ukuran Kemasan</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Harga (Rp)</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody class="bg-white divide-y divide-gray-200">
                                            <?php foreach ($rawMaterials as $material): ?>
                                                <tr class="hover:bg-gray-50">
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($material['name']); ?></div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm text-gray-500"><?php echo !empty($material['brand']) ? htmlspecialchars($material['brand']) : '-'; ?></div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm text-gray-900"><?php echo number_format($material['default_package_quantity'], ($material['default_package_quantity'] == floor($material['default_package_quantity'])) ? 0 : 1, ',', '.'); ?> <?php echo htmlspecialchars($material['unit']); ?></div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-semibold text-green-600">
                                                            Rp <?php echo number_format($material['purchase_price_per_unit'], 0, ',', '.'); ?>
                                                        </div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                                        <div class="flex items-center space-x-2">
                                                            <button onclick="editBahanBaku(<?php echo htmlspecialchars(json_encode($material)); ?>); scrollToForm()"
                                                                    class="inline-flex items-center px-3 py-1 border border-indigo-300 text-xs font-medium rounded-md text-indigo-700 bg-indigo-50 hover:bg-indigo-100 transition duration-200">
                                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                                                </svg>
                                                                Edit
                                                            </button>
                                                            <button onclick="showDeleteModal('<?php echo htmlspecialchars($material['id']); ?>', '<?php echo htmlspecialchars($material['name']); ?>', 'bahan')" 
                                                                    class="inline-flex items-center px-3 py-1 border border-red-300 text-xs font-medium rounded-md text-red-700 bg-red-50 hover:bg-red-100 transition duration-200">
                                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                                                </svg>
                                                                Hapus
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php else: ?>
                                <div class="text-center py-12 text-gray-500">
                                    <svg class="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                                    </svg>
                                    <p class="text-lg font-medium">Belum ada bahan baku tercatat</p>
                                    <p class="text-sm">Tambahkan bahan baku pertama Anda di atas</p>
                                </div>
                            <?php endif; ?>
                        </div>

                        <!-- Pagination will be loaded via AJAX -->
                    </div>

                    <!-- Tab Content: Kemasan -->
                    <div id="content-kemasan" class="tab-content hidden" role="tabpanel">
                        <!-- Filter & Pencarian Kemasan -->
                        <div class="bg-gray-50 rounded-lg p-4 mb-6">
                            <div class="flex items-center mb-4">
                                <svg class="w-5 h-5 text-gray-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"></path>
                                </svg>
                                <h3 class="text-lg font-semibold text-gray-800">Filter & Pencarian Kemasan</h3>
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label for="search_kemasan" class="block text-sm font-medium text-gray-700 mb-2">Pencarian</label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                            </svg>
                                        </div>
                                        <input type="text" id="search_kemasan" name="search_kemasan" value="<?php echo htmlspecialchars($searchQueryPackaging); ?>" 
                                               class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors" 
                                               placeholder="Cari nama kemasan...">
                                    </div>
                                </div>

                                <div>
                                    <label for="kemasan_limit" class="block text-sm font-medium text-gray-700 mb-2">Data per Halaman</label>
                                    <select id="kemasan_limit" name="kemasan_limit" 
                                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors">
                                        <?php foreach ($packagingMaterialsLimitOptions as $option): ?>
                                            <option value="<?php echo $option; ?>" <?php echo $packagingMaterialsLimit == $option ? 'selected' : ''; ?>>
                                                <?php echo $option; ?> Data
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Info Total Kemasan -->
                        <div class="mb-4">
                            <div class="flex justify-between items-center">
                                <p class="text-sm text-gray-600">
                                    Total: <span id="total-kemasan-count" class="font-semibold"><?php echo $totalPackagingMaterialsRows; ?></span> kemasan
                                </p>
                            </div>
                        </div>

                        <!-- Table Kemasan -->
                        <div id="packaging-materials-container">
                            <?php if (!empty($packagingMaterials)): ?>
                                <div class="overflow-x-auto">
                                    <table class="min-w-full divide-y divide-gray-200">
                                        <thead class="bg-gray-50">
                                            <tr>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Kemasan</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Merek</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ukuran Kemasan</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Harga (Rp)</th>
                                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody class="bg-white divide-y divide-gray-200">
                                            <?php foreach ($packagingMaterials as $material): ?>
                                                <tr class="hover:bg-gray-50">
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($material['name']); ?></div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm text-gray-500"><?php echo !empty($material['brand']) ? htmlspecialchars($material['brand']) : '-'; ?></div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm text-gray-900"><?php echo number_format($material['default_package_quantity'], ($material['default_package_quantity'] == floor($material['default_package_quantity'])) ? 0 : 1, ',', '.'); ?> <?php echo htmlspecialchars($material['unit']); ?></div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-semibold text-green-600">
                                                            Rp <?php echo number_format($material['purchase_price_per_unit'], 0, ',', '.'); ?>
                                                        </div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                                        <div class="flex items-center space-x-2">
                                                            <button onclick="editBahanBaku(<?php echo htmlspecialchars(json_encode($material)); ?>); scrollToForm()"
                                                                    class="inline-flex items-center px-3 py-1 border border-indigo-300 text-xs font-medium rounded-md text-indigo-700 bg-indigo-50 hover:bg-indigo-100 transition duration-200">
                                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                                                </svg>
                                                                Edit
                                                            </button>
                                                            <button onclick="showDeleteModal('<?php echo htmlspecialchars($material['id']); ?>', '<?php echo htmlspecialchars($material['name']); ?>', 'kemasan')" 
                                                                    class="inline-flex items-center px-3 py-1 border border-red-300 text-xs font-medium rounded-md text-red-700 bg-red-50 hover:bg-red-100 transition duration-200">
                                                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                                                </svg>
                                                                Hapus
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php else: ?>
                                <div class="text-center py-12 text-gray-500">
                                    <svg class="w-16 h-16 mx-auto mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                                    </svg>
                                    <p class="text-lg font-medium">Belum ada kemasan tercatat</p>
                                    <p class="text-sm">Tambahkan kemasan pertama Anda di atas</p>
                                </div>
                            <?php endif; ?>
                        </div>

                        <!-- Pagination will be loaded via AJAX -->
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Delete Modal -->
<div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-[9999] hidden">
    <div class="bg-white rounded-xl shadow-2xl max-w-md w-full mx-4 transform scale-95 transition-all duration-300" id="deleteModalContent">
        <div class="p-6">
            <div class="flex items-center mb-6">
                <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-4 flex-shrink-0">
                    <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                    </svg>
                </div>
                <div>
                    <h3 class="text-lg font-semibold text-gray-900" id="modal-title">Hapus Bahan Baku/Kemasan</h3>
                    <p class="text-sm text-gray-600">Tindakan ini tidak dapat dibatalkan</p>
                </div>
            </div>
            
            <div class="mb-6">
                <p class="text-gray-700 leading-relaxed">
                    Apakah Anda yakin ingin menghapus <span id="deleteItemName" class="font-semibold text-red-600">nama item</span>?
                </p>
                <div class="mt-3 p-3 bg-red-50 rounded-lg border border-red-200">
                    <p class="text-sm text-red-700">
                        <span class="font-medium">Peringatan:</span> Resep yang menggunakan bahan/kemasan ini akan ikut terhapus secara permanen!
                    </p>
                </div>
            </div>
            
            <div class="flex space-x-3">
                <button type="button" onclick="closeDeleteModal()" class="flex-1 px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition duration-200 font-medium">
                    Batal
                </button>
                <button id="confirmDelete" type="button" class="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition duration-200 font-medium">
                    Hapus
                </button>
            </div>
        </div>
    </div>
</div></div>

<script src="../assets/js/bahan_baku.js"></script>
<script>
// Initialize the page
document.addEventListener('DOMContentLoaded', function() {
    // Load initial data
    loadRawData(1);
    loadKemasanData(1);

    // Set up search handlers
    setupSearchHandlers();

    // Set up limit change handlers
    setupLimitHandlers();
});

function setupSearchHandlers() {
    const rawSearch = document.getElementById('search_raw');
    const kemasanSearch = document.getElementById('search_kemasan');

    let rawTimeout;
    let kemasanTimeout;

    if (rawSearch) {
        rawSearch.addEventListener('input', function() {
            clearTimeout(rawTimeout);
            rawTimeout = setTimeout(() => {
                loadRawData(1);
            }, 500);
        });
    }

    if (kemasanSearch) {
        kemasanSearch.addEventListener('input', function() {
            clearTimeout(kemasanTimeout);
            kemasanTimeout = setTimeout(() => {
                loadKemasanData(1);
            }, 500);
        });
    }
}

function setupLimitHandlers() {
    const rawLimit = document.getElementById('bahan_limit');
    const kemasanLimit = document.getElementById('kemasan_limit');

    if (rawLimit) {
        rawLimit.addEventListener('change', function() {
            loadRawData(1);
        });
    }

    if (kemasanLimit) {
        kemasanLimit.addEventListener('change', function() {
            loadKemasanData(1);
        });
    }
}

function loadRawData(page = 1) {
    const search = document.getElementById('search_raw')?.value || '';
    const limit = document.getElementById('bahan_limit')?.value || 5;

    const params = new URLSearchParams({
        ajax: '1',
        ajax_type: 'raw',
        raw_page: page,
        search_raw: search,
        bahan_limit: limit
    });

    fetch(`${window.location.pathname}?${params.toString()}`)
        .then(response => response.text())
        .then(html => {
            document.getElementById('raw-materials-container').innerHTML = html;
        })
        .catch(error => {
            console.error('Error loading raw materials data:', error);
            document.getElementById('raw-materials-container').innerHTML = '<div class="text-center text-red-500 py-4">Error loading data</div>';
        });
}

function loadKemasanData(page = 1) {
    const search = document.getElementById('search_kemasan')?.value || '';
    const limit = document.getElementById('kemasan_limit')?.value || 5;

    const params = new URLSearchParams({
        ajax: '1',
        ajax_type: 'kemasan',
        kemasan_page: page,
        search_kemasan: search,
        kemasan_limit: limit
    });

    fetch(`${window.location.pathname}?${params.toString()}`)
        .then(response => response.text())
        .then(html => {
            document.getElementById('packaging-materials-container').innerHTML = html;
        })
        .catch(error => {
            console.error('Error loading packaging materials data:', error);
            document.getElementById('packaging-materials-container').innerHTML = '<div class="text-center text-red-500 py-4">Error loading data</div>';
        });
}
</script>
<?php include_once __DIR__ . '/../includes/footer.php'; ?>