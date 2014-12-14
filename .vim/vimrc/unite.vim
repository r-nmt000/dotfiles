"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200


nnoremap <silent> sy :<C-u>Unite history/yank<CR>
nnoremap <silent> sb :<C-u>Unite buffer_tab<CR>
nnoremap <silent> sB :<C-u>Unite buffer<CR>
nnoremap <silent> su :<C-u>Unite file_mru buffer<CR>
