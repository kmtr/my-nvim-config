augroup clojure
    autocmd!
    autocmd BufRead,BufNewFile *.clj inoremap ( ()<Esc>i
    autocmd BufRead,BufNewFile *.clj inoremap [ []<Esc>i
augroup END
