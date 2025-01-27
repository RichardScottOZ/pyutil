#!/bin/bash

VIMRC=~/.vimrc
cat << EOF > ${VIMRC}
" Hybrid line numbers (https://github.com/josiahdavis/dotfiles/blob/master/.vimrc)
"
" Prefer built-in over RltvNmbr as the later makes vim even slower on
" high-latency aka. cross-region instance.
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Relative number only on focused-windoes (see: jeffkreeftmeijer/vim-numbertoggle)
autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &number | set norelativenumber | endif

" Stanza extracted from https://github.com/verdimrc/linuxcfg/blob/main/.vimrc
set laststatus=2
set hlsearch
set colorcolumn=80
set splitbelow
set splitright

"set cursorline
set lazyredraw
"set nottyfast

autocmd FileType help setlocal number

""" Coding style
" Prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set foldmethod=indent
set foldlevel=99

""" Shortcuts
map <F3> :set paste!<CR>
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" Highlight trailing space without plugins -- https://stackoverflow.com/a/48951029
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Terminado supports 256 colors
set t_Co=256
"colorscheme delek
"colorscheme elflord
"colorscheme murphy
colorscheme ron
highlight colorColumn ctermbg=237
EOF
