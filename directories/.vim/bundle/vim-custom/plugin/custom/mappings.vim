" Defines custom mappings

" toggles
set pastetoggle=<F2>
nnoremap <F2> :set invpaste<CR>
nnoremap <F3> :set invnumber<CR>
inoremap <F3> <Esc>:set invnumber<CR>a
nnoremap <F4> :NERDTreeToggle<CR>
inoremap <F4> <Esc>:NERDTreeToggle<CR>

" buffer shortcuts
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>

" g shortcuts
nmap gw :w !sudo tee > /dev/null %<CR>

