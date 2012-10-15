set nocompatible
call pathogen#infect()

" Enable file type detection
filetype on
filetype plugin indent on
syntax enable
set number
set history=100
" Copy/Paste to/From X clipboard:
set clipboard=unnamed
set autoindent
" Show invisible characters:
set listchars=tab:▸\ ,eol:¬

set incsearch
set hlsearch

" Custom mappings:
inoremap kj <Esc>
nnoremap <Tab> :bn<CR>

" Default indentation settings:
set ts=2 sts=2 sw=2 et

if has("autocmd")

  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType xml setlocal ts=4 sts=4 sw=4 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 noet

  autocmd BufNewFile,BufRead *.pro setfiletype prolog
  autocmd BufNewFile,BufRead Capfile setfiletype ruby
endif
