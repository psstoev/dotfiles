set nocompatible
syntax on
set number
set history=100
" Copy/Paste to/From X clipboard:
set clipboard=unnamed
set autoindent
" Show invisible characters:
set listchars=tab:▸\ ,eol:¬

" Custom mappings:
inoremap kj <Esc>

" Default indentation settings:
set ts=2 sts=2 sw=2 et

if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 noet

  autocmd BufNewFile,BufRead *.pro setfiletype prolog
endif
