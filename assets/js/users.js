// Users Management JavaScript
document.addEventListener('DOMContentLoaded', function() {
    initializeUserManagement();
});

function initializeUserManagement() {
    // Initialize current values from page state
    const searchInput = document.getElementById('searchUser');
    const roleFilter = document.getElementById('filterRole');
    const limitSelect = document.getElementById('limitSelect');
    
    if (searchInput) {
        currentSearch = searchInput.value || '';
        searchInput.addEventListener('input', debounce(handleSearch, 300));
    }
    
    if (roleFilter) {
        currentRoleFilter = roleFilter.value || '';
        roleFilter.addEventListener('change', handleRoleFilter);
    }
    
    if (limitSelect) {
        currentLimit = parseInt(limitSelect.value) || 10;
        limitSelect.addEventListener('change', handleLimitChange);
    }

    // Auto-hide alerts after 5 seconds
    const alerts = document.querySelectorAll('.alert-auto-hide');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.opacity = '0';
            setTimeout(() => alert.remove(), 300);
        }, 5000);
    });
}

// Debounce function for search
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Global variables for AJAX
let currentPage = 1;
let currentLimit = 10;
let currentSearch = '';
let currentRoleFilter = '';

// Handle search functionality with AJAX
function handleSearch() {
    const searchTerm = document.getElementById('searchUser').value;
    currentSearch = searchTerm;
    currentPage = 1; // Reset to first page
    loadUsersData();
}

// Handle role filter with AJAX
function handleRoleFilter() {
    const roleFilter = document.getElementById('filterRole').value;
    currentRoleFilter = roleFilter;
    currentPage = 1; // Reset to first page
    loadUsersData();
}

// Handle limit change
function handleLimitChange() {
    const limit = document.getElementById('limitSelect').value;
    currentLimit = parseInt(limit);
    currentPage = 1; // Reset to first page
    loadUsersData();
}

// Handle pagination click
function goToPage(page) {
    currentPage = page;
    loadUsersData();
}

// Load users data with AJAX
function loadUsersData() {
    const container = document.getElementById('usersContainer');
    const paginationContainer = document.getElementById('paginationContainer');
    
    if (!container) return;
    
    // Show loading
    container.innerHTML = `
        <div class="flex justify-center items-center py-12">
            <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
            <span class="ml-2 text-gray-600">Memuat data pengguna...</span>
        </div>
    `;
    
    // Build parameters
    const params = new URLSearchParams({
        ajax: '1',
        search: currentSearch,
        role: currentRoleFilter,
        limit: currentLimit,
        page: currentPage
    });
    
    // Make AJAX request
    fetch(`/cornerbites-sia/admin/users.php?${params.toString()}`)
        .then(response => response.text())
        .then(data => {
            try {
                const jsonData = JSON.parse(data);
                if (jsonData.success) {
                    container.innerHTML = jsonData.html;
                    if (paginationContainer) {
                        paginationContainer.innerHTML = jsonData.pagination;
                    }
                } else {
                    throw new Error(jsonData.message || 'Error loading data');
                }
            } catch (e) {
                console.error('Error parsing response:', e);
                container.innerHTML = `
                    <div class="text-center py-12">
                        <div class="text-red-600 mb-4">
                            <svg class="w-12 h-12 mx-auto mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <p>Terjadi kesalahan saat memuat data</p>
                        </div>
                        <button onclick="loadUsersData()" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                            Coba Lagi
                        </button>
                    </div>
                `;
            }
        })
        .catch(error => {
            console.error('Network error:', error);
            container.innerHTML = `
                <div class="text-center py-12">
                    <div class="text-red-600 mb-4">
                        <svg class="w-12 h-12 mx-auto mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                        <p>Koneksi bermasalah</p>
                    </div>
                    <button onclick="loadUsersData()" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                        Coba Lagi
                    </button>
                </div>
            `;
        });
}

// Show add user modal
function showAddUserModal() {
    document.getElementById('modalTitle').textContent = 'Tambah Pengguna';
    document.getElementById('user_id_to_edit').value = '';
    document.getElementById('username').value = '';
    document.getElementById('password').value = '';
    document.getElementById('role').value = 'user';
    document.getElementById('passwordHelp').textContent = 'Minimal 6 karakter.';
    document.getElementById('password').required = true;
    document.getElementById('userModal').classList.remove('hidden');
}

// Show edit user modal
function editUser(userId, username, role) {
    document.getElementById('modalTitle').textContent = 'Edit Pengguna';
    document.getElementById('user_id_to_edit').value = userId;
    document.getElementById('username').value = username;
    document.getElementById('role').value = role;
    document.getElementById('userModal').classList.remove('hidden');
}

// Hide user modal
function hideUserModal() {
    document.getElementById('userModal').classList.add('hidden');
}

// Hide reset password modal - removed since feature is deprecated
function hideResetPasswordModal() {
    const modal = document.getElementById('resetPasswordModal');
    if (modal) {
        modal.classList.add('hidden');
        // Reset form
        document.querySelector('#resetPasswordModal form').reset();
    }
}

// Reset password function (updated)
function resetPassword(userId, username) {
    showResetPasswordModal(userId, username);
}

// Delete user function
function deleteUser(userId, username) {
    showDeleteModal(userId, username);
}

// Show delete modal
function showDeleteModal(userId, username) {
    const modalHTML = `
        <div id="deleteUserModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-[9999]">
            <div class="bg-white rounded-xl shadow-2xl max-w-md w-full mx-4 transform transition-all duration-300 scale-95 opacity-0" id="deleteModalContent">
                <div class="p-6">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-4 flex-shrink-0">
                            <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-900">Hapus Pengguna</h3>
                            <p class="text-sm text-gray-600">Tindakan ini tidak dapat dibatalkan</p>
                        </div>
                    </div>
                    
                    <div class="mb-6">
                        <p class="text-gray-700 leading-relaxed">
                            Apakah Anda yakin ingin menghapus pengguna <span class="font-semibold text-red-600">"${username}"</span>?
                        </p>
                        <div class="mt-3 p-3 bg-red-50 rounded-lg border border-red-200">
                            <p class="text-sm text-red-700">
                                <span class="font-medium">Peringatan:</span> Semua data terkait pengguna ini akan ikut terhapus secara permanen!
                            </p>
                        </div>
                    </div>
                    
                    <div class="flex space-x-3">
                        <button type="button" onclick="hideDeleteModal()" class="flex-1 px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition duration-200 font-medium">
                            Batal
                        </button>
                        <button type="button" onclick="confirmDeleteUser(${userId})" class="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition duration-200 font-medium">
                            Hapus Pengguna
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    document.body.insertAdjacentHTML('beforeend', modalHTML);
    
    // Animate modal in
    setTimeout(() => {
        const modal = document.getElementById('deleteModalContent');
        if (modal) {
            modal.classList.remove('scale-95', 'opacity-0');
            modal.classList.add('scale-100', 'opacity-100');
        }
    }, 10);
    
    // Close modal when clicking outside
    const modal = document.getElementById('deleteUserModal');
    if (modal) {
        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                hideDeleteModal();
            }
        });
    }
}

// Hide delete modal
function hideDeleteModal() {
    const modal = document.getElementById('deleteUserModal');
    if (modal) {
        const content = document.getElementById('deleteModalContent');
        if (content) {
            content.classList.add('scale-95', 'opacity-0');
            content.classList.remove('scale-100', 'opacity-100');
        }
        setTimeout(() => {
            modal.remove();
        }, 300);
    }
}

// Confirm delete user
function confirmDeleteUser(userId) {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/cornerbites-sia/process/hapus_user.php';

    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'user_id';
    input.value = userId;

    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}

// Close modal when clicking outside
document.addEventListener('click', function(event) {
    const modal = document.getElementById('resetPasswordModal');
    if (modal && event.target === modal) {
        hideResetPasswordModal();
    }
});

// Handle escape key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        hideUserModal();
        hideResetPasswordModal();
        hideDeleteModal();
    }
});

// Form validation
document.getElementById('userForm')?.addEventListener('submit', function(e) {
    const password = document.getElementById('password').value;
    const isEdit = document.getElementById('user_id_to_edit').value !== '';
    
    if (!isEdit && password.length < 6) {
        e.preventDefault();
        alert('Password minimal 6 karakter!');
        return false;
    }
    
    if (isEdit && password && password.length < 6) {
        e.preventDefault();
        alert('Password minimal 6 karakter!');
        return false;
    }
});