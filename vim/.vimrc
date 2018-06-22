set nocompatible

" Enable file type detection
filetype on
filetype plugin indent on
syntax enable

colorscheme monokai

set number
set history=100
" Copy/Paste to/From X clipboard:
set clipboard=unnamed
set autoindent
" Show invisible characters:
set listchars=tab:▸\ ,trail:·
"set list

set incsearch
set hlsearch

" Custom mappings:
inoremap kj <Esc>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Leader><Tab> :bp\|bd #<CR>
nmap <Leader>l :set list!<CR>
nmap <C-p> :FZF<CR>

" Default indentation settings:
set ts=4 sts=4 sw=4 noet

" Ignore certain files and directories in Ctrl-P:
set wildignore+=*.pyc,*.png,*.jpg

" Highlight the extra whitespace:
" highlight ExtraWhitespace ctermbg=darkred guibg=darkred
" match ExtraWhitespace /\s\+$/
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightred guibg=lightred

" Fix for the powerline plugin:
set laststatus=2

if has("autocmd")
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType xml setlocal ts=4 sts=4 sw=4 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4
  autocmd FileType html setlocal ts=4 sts=4 sw=4 et
  autocmd FileType less setlocal ts=4 sts=4 sw=4 et

  autocmd BufNewFile,BufRead *.pro setfiletype prolog
  autocmd BufNewFile,BufRead *.tpl setfiletype php
  autocmd BufNewFile,BufRead Capfile setfiletype ruby
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  autocmd BufNewFile,BufRead AppPrinter setfiletype javascript
endif

" Set directory-wise configuration.
" Search from the directory the file is located upwards to the root for
" a local configuration file called .lvimrc and sources it.
"
" The local configuration file is expected to have commands affecting
" only the current buffer.

function SetLocalOptions(fname)
  let dirname = fnamemodify(a:fname, ":p:h")
  while "/" != dirname
    let lvimrc  = dirname . "/.lvimrc"
    if filereadable(lvimrc)
      execute "source " . lvimrc
      break
    endif
    let dirname = fnamemodify(dirname, ":p:h:h")
  endwhile
endfunction

au BufNewFile,BufRead * call SetLocalOptions(bufname("%"))

set runtimepath^=~/.vim/bundle/ctrlp.vim

set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors

set rtp+=~/.fzf

let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fix_on_save = 1

let g:go_fmt_command = "goimports"
