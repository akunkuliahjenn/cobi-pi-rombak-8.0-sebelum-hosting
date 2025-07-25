// bahan_baku.js
// JavaScript functions for bahan baku management with AJAX search

const unitOptions = ['kg', 'gram', 'liter', 'ml', 'pcs', 'buah', 'roll', 'meter', 'box', 'botol', 'lembar'];
const typeOptions = ['bahan', 'kemasan'];
const validLimits = [5, 10, 15, 20, 25];
const defaultLimit = 5;

// Variables untuk menyimpan posisi scroll
let currentScrollPosition = 0;

// Function to scroll to form
function scrollToForm() {
    const formElement = document.querySelector('form[action="../process/simpan_bahan_baku.php"]');
    if (formElement) {
        formElement.scrollIntoView({ 
            behavior: 'smooth', 
            block: 'start' 
        });
    }
}

// Currency formatting for price input
document.addEventListener('DOMContentLoaded', function() {
    // Restore limit states on page load
    restoreLimitStates();

    const priceInput = document.getElementById('purchase_price_per_unit');

    if (priceInput) {
        // Format input saat user mengetik
        priceInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/[^\d]/g, '');
            if (value) {
                e.target.value = formatNumber(value);
            }
        });

        // Convert ke number saat submit
        const form = priceInput.closest('form');
        if (form) {
            form.addEventListener('submit', function(e) {
                // Save current limit states before form submission
                saveLimitStates();

                // Update hidden fields with current limit values
                const bahanLimit = document.getElementById('bahan_limit');
                const kemasanLimit = document.getElementById('kemasan_limit');
                const hiddenBahanLimit = document.getElementById('hidden_bahan_limit');
                const hiddenKemasanLimit = document.getElementById('hidden_kemasan_limit');

                if (bahanLimit && hiddenBahanLimit) {
                    hiddenBahanLimit.value = bahanLimit.value;
                }
                if (kemasanLimit && hiddenKemasanLimit) {
                    hiddenKemasanLimit.value = kemasanLimit.value;
                }

                // Convert formatted price back to number
                const currentValue = priceInput.value.replace(/[^\d]/g, '');
                priceInput.value = currentValue;

                // Let the form submit normally
                return true;
            });
        }
    }

    // Dynamic label and button update based on type selection
    const typeSelect = document.getElementById('type');
    const purchaseSizeLabel = document.getElementById('purchase_size_label');
    const purchasePriceLabel = document.getElementById('purchase_price_label');
    const purchaseSizeHelp = document.getElementById('purchase_size_help');
    const purchasePriceHelp = document.getElementById('purchase_price_help');
    const submitButton = document.getElementById('submit_button');

    function updateLabelsBasedOnType(type) {
        if (type === 'bahan') {
            purchaseSizeLabel.textContent = 'Ukuran Beli Kemasan Bahan';
            purchasePriceLabel.textContent = 'Harga Beli Per Kemasan Bahan';
            purchaseSizeHelp.textContent = 'Isi per kemasan bahan yang Anda beli (sesuai satuan yang tertera di plastik kemasan yang anda beli)';
            purchasePriceHelp.textContent = 'Harga per kemasan bahan saat pembelian';
            submitButton.innerHTML = `
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
                Tambah Bahan
            `;
        } else {
            purchaseSizeLabel.textContent = 'Ukuran Beli Kemasan';
            purchasePriceLabel.textContent = 'Harga Beli Per Kemasan';
            purchaseSizeHelp.textContent = 'Isi per kemasan yang Anda beli (sesuai satuan yang tertera di kemasan yang anda beli)';
            purchasePriceHelp.textContent = 'Harga per kemasan saat pembelian';
            submitButton.innerHTML = `
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
                Tambah Kemasan
            `;
        }
    }

    if (typeSelect && purchaseSizeLabel && submitButton) {
        typeSelect.addEventListener('change', function() {
            updateLabelsBasedOnType(this.value);
        });

        // Set initial labels
        updateLabelsBasedOnType(typeSelect.value);
    }

    // Cancel edit button event
    const cancelButton = document.getElementById('cancel_edit_button');
    if (cancelButton) {
        cancelButton.addEventListener('click', resetForm);
    }

    // AJAX search implementation
    setupAjaxSearch();

    // Tambahkan event listener untuk menyimpan posisi scroll saat user berinteraksi
    const searchInputs = document.querySelectorAll('#search_raw, #search_kemasan');
    const limitSelects = document.querySelectorAll('#bahan_limit, #kemasan_limit');

    searchInputs.forEach(input => {
        input.addEventListener('focus', saveScrollPosition);
        input.addEventListener('input', saveScrollPosition);
    });

    limitSelects.forEach(select => {
        select.addEventListener('change', function() {
            saveScrollPosition();
            // Langsung trigger pencarian dengan limit baru
            const searchType = this.id === 'bahan_limit' ? 'raw' : 'kemasan';
            const searchInput = document.getElementById(searchType === 'raw' ? 'search_raw' : 'search_kemasan');
            const searchTerm = searchInput ? searchInput.value : '';

            // Clear current results immediately to show loading
            const containerId = searchType === 'raw' ? 'raw-materials-container' : 'packaging-materials-container';
            const container = document.getElementById(containerId);
            if (container) {
                container.innerHTML = `
                    <div class="col-span-full flex justify-center items-center py-12">
                        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                        <span class="ml-2 text-gray-600">Memperbarui tampilan...</span>
                    </div>
                `;
            }

            performAjaxSearch(searchType, searchTerm, this.value);
        });
    });
});

function formatNumber(num) {
    return parseInt(num).toLocaleString('id-ID');
}

function saveScrollPosition() {
    currentScrollPosition = window.pageYOffset;
}

function restoreScrollPosition() {
    window.scrollTo(0, currentScrollPosition);
}

function editBahanBaku(material) {
    // Save current limit states before editing
    saveLimitStates();

    // Scroll to form first
    const formTitle = document.getElementById('form-title');
    if (formTitle) {
        formTitle.scrollIntoView({ 
            behavior: 'smooth',
            block: 'start'
        });
    }

    // Fill form data
    document.getElementById('bahan_baku_id').value = material.id;
    document.getElementById('name').value = material.name;
    document.getElementById('brand').value = material.brand || '';
    document.getElementById('type').value = material.type;
    document.getElementById('unit').value = material.unit;

    // Format numbers without .00 for display - clean integer display
    const purchaseSize = parseFloat(material.default_package_quantity);
    document.getElementById('purchase_size').value = purchaseSize % 1 === 0 ? Math.round(purchaseSize).toString() : purchaseSize.toString();

    // Format price as integer and remove any decimal places for display
    const priceAsInt = Math.round(parseFloat(material.purchase_price_per_unit));
    document.getElementById('purchase_price_per_unit').value = priceAsInt.toLocaleString('id-ID');

    // Update labels and button based on type
    const purchaseSizeLabel = document.getElementById('purchase_size_label');
    const purchasePriceLabel = document.getElementById('purchase_price_label');
    const purchaseSizeHelp = document.getElementById('purchase_size_help');
    const purchasePriceHelp = document.getElementById('purchase_price_help');
    const submitButton = document.getElementById('submit_button');
    const cancelButton = document.getElementById('cancel_edit_button');

    if (material.type === 'bahan') {
        purchaseSizeLabel.textContent = 'Ukuran Beli Kemasan Bahan';
        purchasePriceLabel.textContent = 'Harga Beli Per Kemasan Bahan';
        purchaseSizeHelp.textContent = 'Isi per kemasan bahan yang Anda beli (sesuai satuan yang tertera di plastik kemasan yang anda beli)';
        purchasePriceHelp.textContent = 'Harga per kemasan bahan saat pembelian';
        document.getElementById('form-title').textContent = 'Edit Bahan';
        submitButton.innerHTML = `
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
            </svg>
            Update Bahan
        `;
    } else {
        purchaseSizeLabel.textContent = 'Ukuran Beli Kemasan';
        purchasePriceLabel.textContent = 'Harga Beli Per Kemasan';
        purchaseSizeHelp.textContent = 'Isi per kemasan yang Anda beli (sesuai satuan yang tertera di kemasan yang anda beli)';
        purchasePriceHelp.textContent = 'Harga per kemasan saat pembelian';
        document.getElementById('form-title').textContent = 'Edit Kemasan';
        submitButton.innerHTML = `
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
            </svg>
            Update Kemasan
        `;
    }

    submitButton.classList.remove('bg-blue-600', 'hover:bg-blue-700');
    submitButton.classList.add('bg-indigo-600', 'hover:bg-indigo-700');
    cancelButton.classList.remove('hidden');

    // Focus pada nama field dengan delay minimal
    setTimeout(() => {
        const nameField = document.getElementById('name');
        if (nameField) {
            nameField.focus();
            nameField.select(); // Select text untuk editing yang lebih mudah
        }
    }, 300);
}

function resetForm() {
    // Save current limit states before reset
    saveLimitStates();

    document.getElementById('bahan_baku_id').value = '';
    document.getElementById('name').value = '';
    document.getElementById('brand').value = '';
    document.getElementById('type').value = typeOptions[0];
    document.getElementById('unit').value = unitOptions[0];
    document.getElementById('purchase_size').value = '';
    document.getElementById('purchase_price_per_unit').value = '';

    // Reset labels to default (bahan)
    const purchaseSizeLabel = document.getElementById('purchase_size_label');
    const purchasePriceLabel = document.getElementById('purchase_price_label');
    const purchaseSizeHelp = document.getElementById('purchase_size_help');
    const purchasePriceHelp = document.getElementById('purchase_price_help');

    purchaseSizeLabel.textContent = 'Ukuran Beli Kemasan Bahan';
    purchasePriceLabel.textContent = 'Harga Beli Per Kemasan Bahan';
    purchaseSizeHelp.textContent = 'Isi per kemasan bahan yang Anda beli (sesuai satuan yang tertera di plastik kemasan yang anda beli)';
    purchasePriceHelp.textContent = 'Harga per kemasan bahan saat pembelian';

    document.getElementById('form-title').textContent = 'Tambah Bahan Baku/Kemasan Baru';

    const submitButton = document.getElementById('submit_button');
    const cancelButton = document.getElementById('cancel_edit_button');

    submitButton.innerHTML = `
        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
        </svg>
        Tambah Bahan
    `;
    submitButton.classList.remove('bg-indigo-600', 'hover:bg-indigo-700');
    submitButton.classList.add('bg-blue-600', 'hover:bg-blue-700');
    cancelButton.classList.add('hidden');
}

// AJAX search setup
function setupAjaxSearch() {
    let searchTimeoutRaw;
    let searchTimeoutKemasan;

    // Search for raw materials
    const searchRaw = document.getElementById('search_raw');
    const bahanLimit = document.getElementById('bahan_limit');

    if (searchRaw) {
        searchRaw.addEventListener('input', function() {
            const searchTerm = this.value;
            clearTimeout(searchTimeoutRaw);
            searchTimeoutRaw = setTimeout(() => {
                performAjaxSearch('raw', searchTerm, bahanLimit ? bahanLimit.value : defaultLimit);
            }, 300); // Reduced timeout for faster response
        });
    }

    // Search for packaging materials
    const searchKemasan = document.getElementById('search_kemasan');
    const kemasanLimit = document.getElementById('kemasan_limit');

    if (searchKemasan) {
        searchKemasan.addEventListener('input', function() {
            const searchTerm = this.value;
            clearTimeout(searchTimeoutKemasan);
            searchTimeoutKemasan = setTimeout(() => {
                performAjaxSearch('kemasan', searchTerm, kemasanLimit ? kemasanLimit.value : defaultLimit);
            }, 300); // Reduced timeout for faster response
        });
    }
}

function performAjaxSearch(type, searchTerm, limit) {
    const containerId = type === 'raw' ? 'raw-materials-container' : 'packaging-materials-container';
    const container = document.getElementById(containerId);

    if (!container) return;

    // Simpan posisi scroll sebelum AJAX
    saveScrollPosition();

    // Show loading dengan pesan yang lebih spesifik
    const loadingMessage = searchTerm ? 'Mencari...' : 'Memuat data...';
    if (container.innerHTML.indexOf('animate-spin') === -1) {
        container.innerHTML = `
            <div class="flex justify-center items-center py-12">
                <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                <span class="ml-2 text-gray-600">${loadingMessage}</span>
            </div>
        `;
    }

    // Build URL parameters
    const params = new URLSearchParams();
    if (type === 'raw') {
        params.set('search_raw', searchTerm);
        params.set('bahan_limit', limit);
        params.set('ajax_type', 'raw');
    } else {
        params.set('search_kemasan', searchTerm);
        params.set('kemasan_limit', limit);
        params.set('ajax_type', 'kemasan');
    }
    params.set('ajax', '1');

    // Perform AJAX request
    fetch(`/cornerbites-sia/pages/bahan_baku.php?${params.toString()}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.text();
        })
        .then(data => {
            container.innerHTML = data;

            // Wait a bit for DOM to update, then check pagination
            setTimeout(() => {
                checkAndHidePagination(type, limit);
            }, 100);

            // Restore scroll position
            restoreScrollPosition();
        })
        .catch(error => {
            console.error('AJAX Error:', error);
            container.innerHTML = `
                <div class="text-center py-12 text-red-600">
                    <svg class="w-16 h-16 mx-auto mb-4 text-red-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.732-.833-2.5 0L4.268 15.5c-.77.833.192 2.5 1.732 2.5z"></path>
                    </svg>
                    <p class="text-lg font-medium">Terjadi kesalahan saat memuat data</p>
                    <p class="text-sm">Silakan refresh halaman atau coba lagi nanti</p>
                </div>
            `;
        });
}

function hidePaginationIfNotNeeded(tabType, limit) {
    const totalCountElement = document.getElementById(`total-${tabType}-count`);
    if (!totalCountElement) return;

    const totalCount = parseInt(totalCountElement.textContent) || 0;
    const currentTab = document.getElementById(`content-${tabType}`);
    if (!currentTab) return;

    // Find pagination container in current tab
    const paginationContainer = currentTab.querySelector('.flex.items-center.justify-between.border-t');

    if (paginationContainer) {
        if (totalCount <= limit) {
            paginationContainer.style.display = 'none';
        } else {
            paginationContainer.style.display = 'flex';
        }
    }
}

function checkAndHidePagination(type, limit) {
    // Map type to the correct element ID
    const tabType = type === 'raw' ? 'raw' : 'kemasan';
    const totalCountElement = document.getElementById(`total-${tabType}-count`);

    if (!totalCountElement) {
        console.log('Total count element not found for:', tabType);
        return;
    }

    const totalCount = parseInt(totalCountElement.textContent) || 0;
    const limitInt = parseInt(limit);

    console.log(`Checking pagination for ${tabType}: total=${totalCount}, limit=${limitInt}`);

    // Find the correct content area
    const contentArea = document.getElementById(`content-${tabType === 'raw' ? 'bahan' : 'kemasan'}`);
    if (!contentArea) {
        console.log('Content area not found for:', tabType);
        return;
    }

    // Find pagination container
    const paginationContainer = contentArea.querySelector('.flex.items-center.justify-between.border-t');

    if (paginationContainer) {
        if (totalCount <= limitInt) {
            console.log(`Hiding pagination: ${totalCount} <= ${limitInt}`);
            paginationContainer.style.display = 'none';
        } else {
            console.log(`Showing pagination: ${totalCount} > ${limitInt}`);
            paginationContainer.style.display = 'flex';
        }
    } else {
        console.log('Pagination container not found');
    }
}

// Update pagination info for raw materials
function updateRawPaginationInfo(totalCount, limit) {
    // Use the centralized function to check and hide pagination
    setTimeout(() => {
        checkAndHidePagination('raw', limit);
    }, 50);
    console.log('Raw materials pagination updated:', { totalCount, limit });
}

// Update pagination info for kemasan
function updateKemasanPaginationInfo(totalCount, limit) {
    // Use the centralized function to check and hide pagination
    setTimeout(() => {
        checkAndHidePagination('kemasan', limit);
    }, 50);
    console.log('Kemasan pagination updated:', { totalCount, limit });
}

// Function to update total count display
function updateTotalCount(elementId, count) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = count;
    }
}

// Global variables
let currentActiveTab = 'bahan';
let searchTimeout = null;

// Tab switching functionality
function switchTab(tabName) {
    currentActiveTab = tabName;

    // Update tab buttons
    const tabs = ['bahan', 'kemasan'];
    tabs.forEach(tab => {
        const tabButton = document.getElementById(`tab-${tab}`);
        const tabContent = document.getElementById(`content-${tab}`);
        const badgeBahan = document.getElementById('badge-bahan');
        const badgeKemasan = document.getElementById('badge-kemasan');

        if (tab === tabName) {
            // Active tab styling
            tabButton.classList.remove('text-gray-500', 'hover:text-gray-700');
            tabButton.classList.add('bg-white', 'text-blue-600', 'shadow-sm');
            tabButton.setAttribute('aria-selected', 'true');
            tabContent.classList.remove('hidden');

            if (tabName === 'bahan') {
                badgeBahan.classList.remove('bg-gray-100', 'text-gray-600');
                badgeBahan.classList.add('bg-blue-100', 'text-blue-800');
                badgeKemasan.classList.remove('bg-green-100', 'text-green-800');
                badgeKemasan.classList.add('bg-gray-100', 'text-gray-600');
            } else {
                badgeKemasan.classList.remove('bg-gray-100', 'text-gray-600');
                badgeKemasan.classList.add('bg-green-100', 'text-green-800');
                badgeBahan.classList.remove('bg-blue-100', 'text-blue-800');
                badgeBahan.classList.add('bg-gray-100', 'text-gray-600');
            }
        } else {
            // Inactive tab styling
            tabButton.classList.remove('bg-white', 'text-blue-600', 'shadow-sm');
            tabButton.classList.add('text-gray-500', 'hover:text-gray-700');
            tabButton.setAttribute('aria-selected', 'false');
            tabContent.classList.add('hidden');
        }
    });

    // Trigger search for the active tab
    if (tabName === 'bahan') {
        handleSearchRaw();
    } else if (tabName === 'kemasan') {
        handleSearchKemasan();
    }
}

// Search handling functions with debouncing
function handleSearchRaw() {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
        const searchTerm = document.getElementById('search_raw').value;
        const limit = document.getElementById('bahan_limit').value;
        loadRawMaterials(searchTerm, limit);
    }, 300);
}

function handleSearchKemasan() {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
        const searchTerm = document.getElementById('search_kemasan').value;
        const limit = document.getElementById('kemasan_limit').value;
        loadPackagingMaterials(searchTerm, limit);
    }, 300);
}

// AJAX loading functions
function loadRawMaterials(searchTerm = '', limit = 5) {
    const container = document.getElementById('raw-materials-container');
    container.innerHTML = '<div class="text-center py-8"><div class="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div><p class="mt-2 text-gray-600">Memuat data...</p></div>';

    const xhr = new XMLHttpRequest();
    xhr.open('GET', `bahan_baku.php?ajax=1&ajax_type=raw&search_raw=${encodeURIComponent(searchTerm)}&bahan_limit=${limit}`, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            container.innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}

function loadPackagingMaterials(searchTerm = '', limit = 5) {
    const container = document.getElementById('packaging-materials-container');
    container.innerHTML = '<div class="text-center py-8"><div class="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div><p class="mt-2 text-gray-600">Memuat data...</p></div>';

    const xhr = new XMLHttpRequest();
    xhr.open('GET', `bahan_baku.php?ajax=1&ajax_type=kemasan&search_kemasan=${encodeURIComponent(searchTerm)}&kemasan_limit=${limit}`, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            container.innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}

// Helper functions for pagination updates (called from AJAX responses)

// Form handling functions
function cancelEdit() {
    // Reset form
    document.querySelector('form').reset();
    document.getElementById('bahan_baku_id').value = '';

    // Reset form UI
    document.getElementById('form-title').textContent = 'Tambah Bahan Baku/Kemasan Baru';
    document.getElementById('submit_button').innerHTML = `
        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
        </svg>
        Tambah Bahan
    `;
    document.getElementById('cancel_edit_button').classList.add('hidden');

    // Reset to default type
    updateFormLabels('bahan');
}

function updateFormLabels(type) {
    const isKemasan = type === 'kemasan';
    const sizeLabel = document.getElementById('purchase_size_label');
    const sizeHelp = document.getElementById('purchase_size_help');
    const priceLabel = document.getElementById('purchase_price_label');
    const priceHelp = document.getElementById('purchase_price_help');

    if (isKemasan) {
        sizeLabel.textContent = 'Ukuran/Jumlah Per Kemasan';
        sizeHelp.textContent = 'Jumlah per kemasan yang Anda beli (sesuai satuan di atas)';
        priceLabel.textContent = 'Harga Beli Per Kemasan';
        priceHelp.textContent = 'Harga per kemasan saat pembelian';
    } else {
        sizeLabel.textContent = 'Ukuran Beli Kemasan Bahan';
        sizeHelp.textContent = 'Isi per kemasan yang Anda beli (sesuai satuan di atas)';
        priceLabel.textContent = 'Harga Beli Per Kemasan';
        priceHelp.textContent = 'Harga per kemasan saat pembelian';
    }
}

// Delete modal functions
function showDeleteModal(id, name, type) {
    // First check if material is used in recipes
    checkRecipeUsage(id, name, type);
}

function showNormalDeleteModal(itemId, itemName, itemType) {
    document.getElementById('deleteModal').classList.remove('hidden');

    const modalTitle = document.getElementById('modal-title');
    const deleteMessage = document.getElementById('delete-message');
    const deleteConfirmButton = document.getElementById('deleteConfirmButton');

    if (itemType === 'bahan') {
        modalTitle.textContent = 'Hapus Bahan Baku';
        deleteMessage.textContent = `Apakah Anda yakin ingin menghapus bahan baku "${itemName}"?`;
    } else {
        modalTitle.textContent = 'Hapus Kemasan';
        deleteMessage.textContent = `Apakah Anda yakin ingin menghapus kemasan "${itemName}"?`;
    }

    deleteConfirmButton.href = '/cornerbites-sia/process/simpan_bahan_baku.php?action=delete&id=' + itemId;
}

function checkRecipeUsage(id, name, type) {
    fetch(`../process/simpan_bahan_baku.php?action=check_recipes&id=${id}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (data.error) {
                console.error('Server error:', data.error);
                // If there's an error checking recipes, show regular delete modal
                showNormalDeleteModal(id, name, type);
                return;
            }

            if (data.count > 0) {
                // Show info modal with recipe details (no force delete option)
                showRecipeUsageInfoModal(id, name, type, data);
            } else {
                // Show regular delete modal
                showNormalDeleteModal(id, name, type);
            }
        })
        .catch(error => {
            console.error('Error checking recipe usage:', error);
            // If there's an error, show regular delete modal
            showNormalDeleteModal(id, name, type);
        });
}

function showRecipeUsageInfoModal(itemId, itemName, itemType, data) {
    const modal = document.getElementById('recipeUsageInfoModal');
    if (!modal) {
        console.error('Recipe usage info modal not found');
        return;
    }

    modal.classList.remove('hidden');

    // Update modal content
    const materialTypeLabel = itemType === 'bahan' ? 'Bahan Baku' : 'Kemasan';
    const materialName = data.material.brand && data.material.brand.trim() !== '' 
        ? `${data.material.name} - ${data.material.brand}` 
        : data.material.name;

    document.getElementById('info-material-type').textContent = materialTypeLabel;
    document.getElementById('info-material-name').textContent = materialName;
    document.getElementById('info-recipe-count').textContent = data.count;
    
    // Update subtitle
    const subtitle = document.getElementById('recipe-usage-subtitle');
    subtitle.textContent = `${materialTypeLabel} ini sedang digunakan dalam ${data.count} resep dan tidak dapat dihapus.`;

    // Clear and populate recipe details
    const recipeDetails = document.getElementById('info-recipe-details');
    recipeDetails.innerHTML = '';

    if (data.recipes && data.recipes.length > 0) {
        data.recipes.forEach((recipe, index) => {
            const recipeItem = document.createElement('div');
            recipeItem.className = 'text-xs px-2 py-1 rounded bg-blue-50 border border-blue-200 flex items-center';
            recipeItem.innerHTML = `
                <svg class="w-3 h-3 text-blue-600 mr-2 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                </svg>
                <span class="font-medium text-blue-700">${recipe.product_name}</span>
                <span class="text-blue-500 ml-1">(${recipe.product_unit})</span>
            `;
            recipeDetails.appendChild(recipeItem);
        });
    }

    // Add animation effect
    setTimeout(() => {
        modal.querySelector('.bg-white').classList.remove('scale-95');
        modal.querySelector('.bg-white').classList.add('scale-100');
    }, 10);
}

function closeDeleteModal() {
    const modal = document.getElementById('deleteModal');
    modal.querySelector('.bg-white').classList.remove('scale-100');
    modal.querySelector('.bg-white').classList.add('scale-95');
    setTimeout(() => {
        modal.classList.add('hidden');
    }, 200);
}

function closeRecipeUsageInfoModal() {
    const modal = document.getElementById('recipeUsageInfoModal');
    if (modal) {
        const modalContent = modal.querySelector('.bg-white');
        if (modalContent) {
            modalContent.classList.remove('scale-100');
            modalContent.classList.add('scale-95');
        }
        setTimeout(() => {
            modal.classList.add('hidden');
        }, 200);
    }
}

// Price formatting function
function formatRupiah(value) {
    let number = parseInt(value.replace(/\D/g, ''));
    if (isNaN(number)) number = 0;
    return number.toLocaleString('id-ID');
}

// Event listeners
document.addEventListener('DOMContentLoaded', function() {
    // Set up search event listeners
    const searchRaw = document.getElementById('search_raw');
    const searchKemasan = document.getElementById('search_kemasan');
    const bahanLimit = document.getElementById('bahan_limit');
    const kemasanLimit = document.getElementById('kemasan_limit');

    if (searchRaw) {
        searchRaw.addEventListener('input', handleSearchRaw);
    }

    if (searchKemasan) {
        searchKemasan.addEventListener('input', handleSearchKemasan);
    }

    if (bahanLimit) {
        bahanLimit.addEventListener('change', handleSearchRaw);
    }

    if (kemasanLimit) {
kemasanLimit.addEventListener('change', handleSearchKemasan);
    }

    // Set up price formatting
    const priceInput = document.getElementById('purchase_price_per_unit');
    if (priceInput) {
        priceInput.addEventListener('input', function() {
            this.value = formatRupiah(this.value);
        });
    }

    // Set up type change listener
    const typeSelect = document.getElementById('type');
    if (typeSelect) {
        typeSelect.addEventListener('change', function() {
            updateFormLabels(this.value);
        });
    }

    // Set up cancel edit button
    const cancelButton = document.getElementById('cancel_edit_button');
    if (cancelButton){
        cancelButton.addEventListener('click', cancelEdit);
    }

    // Close modals when clicking outside
    document.getElementById('deleteModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeDeleteModal();
        }
    });

    const recipeUsageInfoModal = document.getElementById('recipeUsageInfoModal');
    if (recipeUsageInfoModal) {
        recipeUsageInfoModal.addEventListener('click', function(e) {
            if (e.target === this) {
                closeRecipeUsageInfoModal();
            }
        });
    }

    // Close modals with Escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            const deleteModal = document.getElementById('deleteModal');
            const recipeUsageInfoModal = document.getElementById('recipeUsageInfoModal');
            
            if (!deleteModal.classList.contains('hidden')) {
                closeDeleteModal();
            }
            if (recipeUsageInfoModal && !recipeUsageInfoModal.classList.contains('hidden')) {
                closeRecipeUsageInfoModal();
            }
        }
    });

    // Initial form label setup
    updateFormLabels('bahan');

	// Restore limit states on page load
    restoreLimitStates();
});

// Functions to save and restore limit states
function saveLimitStates() {
    const bahanLimit = document.getElementById('bahan_limit');
    const kemasanLimit = document.getElementById('kemasan_limit');

    if (bahanLimit) {
        localStorage.setItem('bahan_limit_state', bahanLimit.value);
    }
    if (kemasanLimit) {
        localStorage.setItem('kemasan_limit_state', kemasanLimit.value);
    }

    // Also save current active tab
    localStorage.setItem('active_tab_state', currentActiveTab);
}

function restoreLimitStates() {
    const bahanLimit = document.getElementById('bahan_limit');
    const kemasanLimit = document.getElementById('kemasan_limit');

    if (bahanLimit && localStorage.getItem('bahan_limit_state')) {
        bahanLimit.value = localStorage.getItem('bahan_limit_state');
    }
    if (kemasanLimit && localStorage.getItem('kemasan_limit_state')) {
        kemasanLimit.value = localStorage.getItem('kemasan_limit_state');
    }

    // Restore active tab
    const activeTabState = localStorage.getItem('active_tab_state');
    if (activeTabState) {
        switchTab(activeTabState);
    } else {
		switchTab('bahan');
	}

	// Load data for the active tab on restore
	if (currentActiveTab === 'bahan') {
		handleSearchRaw();
	} else if (currentActiveTab === 'kemasan') {
		handleSearchKemasan();
	}
}

function clearLimitStates() {
    localStorage.removeItem('bahan_limit_state');
    localStorage.removeItem('kemasan_limit_state');
    localStorage.removeItem('active_tab_state');
}

// Make functions global
window.editBahanBaku = editBahanBaku;
window.resetForm = cancelEdit;
window.updateTotalCount = updateTotalCount;
window.switchTab = switchTab;
window.updateTabBadges = () => {}; // Placeholder, functionality is now within switchTab
window.saveLimitStates = saveLimitStates;
window.restoreLimitStates = restoreLimitStates;
window.clearLimitStates = clearLimitStates;
window.showDeleteModal = showDeleteModal;
window.showNormalDeleteModal = showNormalDeleteModal;
window.closeDeleteModal = closeDeleteModal;
window.showRecipeUsageInfoModal = showRecipeUsageInfoModal;
window.closeRecipeUsageInfoModal = closeRecipeUsageInfoModal;