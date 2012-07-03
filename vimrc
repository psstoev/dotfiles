" Default indentation settings:
set ts=4 sts=4 sw=4 et

syntax on

" Copy/Paste to/From X clipboard:
set clipboard=unnamed

set history=100

if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
endif
