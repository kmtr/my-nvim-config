if empty(globpath(&rtp, 'autoload/nerdtree.vim'))
    finish
endif

let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>

