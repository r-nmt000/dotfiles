let g:quickrun_config = {
\  "_" : {
\    "outputter/buffer/split" : ":botright",
\    "outputter/buffer/close_on_empty" : 1,
\    "runner" : "vimproc",
\    "runner/vimproc/updatetime" : 60
\  },
\  'scala':{
\    'cmdopt': ''
\  }
\}

"shortcut key
nnoremap <Leader>r :QuickRun<CR>
