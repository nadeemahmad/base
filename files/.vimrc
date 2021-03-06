" ============================================================================ "
" vimrc - base configuration file for vim
" Used primarily just to load pathogen, which contains the modules that have
" varying degrees of configuration. Any custom changes should be made in the
" `vim-custom` pathogen module.
" ============================================================================ "

"==========================================================
" Load pathogen
"==========================================================
"execute pathogen#infect()

call plug#begin()

Plug '~/.vim/bundle/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug '~/.vim/bundle/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '~/.vim/bundle/python-mode', { 'for': 'python' }
Plug '~/.vim/bundle/syntastic'
Plug '~/.vim/bundle/vim-better-whitespace'
Plug '~/.vim/bundle/vim-buftabline'
Plug '~/.vim/bundle/vim-colorschemes'
Plug '~/.vim/bundle/vim-custom'
Plug '~/.vim/bundle/vim-fugitive'
Plug '~/.vim/bundle/vim-gitgutter'
Plug '~/.vim/bundle/vim-json', { 'for': 'json' }
Plug '~/.vim/bundle/vim-over'
Plug '~/.vim/bundle/vim-puppet', { 'for': 'puppet' }

call plug#end()

syntax enable
filetype plugin indent on
set nocompatible

" color scheme
colorscheme hybrid
set background=dark

" show numbers and ruler
set number
set ruler

" link to Mac OSX clipboard
set clipboard=unnamed

set noshowmode
set modeline
" disable spell check
set nospell

" highlight as search is typed
set hlsearch
set incsearch

" TODO - look into these
set backspace=indent,eol,start
set wildmode=list:longest

" allows hidden buffers
set hidden

" code specific stuff - TODO find a better place for this?
set expandtab
set tabstop=2
set shiftwidth=2

set laststatus=2
set timeoutlen=100
set equalalways

if !has('nvim')

  " enable status bar
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup

  " Cursor manipulation
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

endif

