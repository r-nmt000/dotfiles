"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200


nnoremap <silent> <Space>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>uu :<C-u>Unite file_mru buffer<CR>
