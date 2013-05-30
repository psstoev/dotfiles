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
set listchars=tab:▸\ ,trail:·
set list

set incsearch
set hlsearch

" Ignore compiled Python files:
set wildignore+=*.pyc

" Custom mappings:
inoremap kj <Esc>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader><Tab> :bp\|bd #<CR>

" Default indentation settings:
set ts=2 sts=2 sw=2 et

" Ignore certain files in Ctrl-P:
set wildignore+=*.pyc,*.png,*.jpg

" Set larger synmaxcol because of the crappy OpenCart PHP code:
set synmaxcol=10000

" Highlight the extra whitespace:
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightred guibg=lightred

" Fix for the powerline plugin:
set laststatus=2

set mouse=a

let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=[]

if has("autocmd")

  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType xml setlocal ts=4 sts=4 sw=4 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 et

  autocmd BufNewFile,BufRead *.pro setfiletype prolog
  autocmd BufNewFile,BufRead *.tpl setfiletype php
  autocmd BufNewFile,BufRead Capfile setfiletype ruby
endif
