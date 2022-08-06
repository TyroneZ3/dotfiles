"" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

"{Basic setting
  syntax on

  set smartindent
  set autoindent
  "set cindent
  set expandtab
  set tabstop=4
  set shiftwidth=4
  set nu
  set ruler
  set mouse=a

  set foldmethod=indent
  set foldlevel=99

  set backspace   =indent,eol,start  " Make backspace work as you would expect.
  set hidden                 " Switch between buffers without having to save first.
  set laststatus  =2         " Always show statusline.
  set display     =lastline  " Show as much as possible of the last line.

  set showmode               " Show current mode in command-line.
  set showcmd                " Show already typed keys when more are expected.

  set incsearch              " Highlight while searching with / or ?.
  set hlsearch               " Keep matches highlighted.

  set ttyfast                " Faster redrawing.
  set lazyredraw             " Only redraw when necessary.

  set splitbelow             " Open new windows below the current window.
  set splitright             " Open new windows right of the current window.

  set cursorline             " Find the current line quickly.
  set wrapscan               " Searches wrap around end-of-file.
  set report      =0         " Always report changed lines.
  set synmaxcol   =200       " Only highlight the first 200 columns.

  "set list                   " Show non-printable characters.
  
  "{Set colorshceme
    syntax enable
    set t_Co=256
    colorscheme default
  "}
"}

"{Quick tab switching
  " move to the previous/next tabpage.
  nnoremap <C-j> gT
  nnoremap <C-k> gt
  " Go to last active tab 
  au TabLeave * let g:lasttab = tabpagenr()
  nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
  vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"}

"{Vundle
  "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'

  "Plugin 'dense-analysis/ale'

  Plugin 'vim-python/python-syntax'
  let g:python_highlight_all=1

  Plugin 'airblade/vim-gitgutter'

  Plugin 'davidhalter/jedi-vim'

  "Plugin 'psliwka/vim-smoothie'

  Plugin 'preservim/vim-markdown'
  let g:vim_markdown_math=1

  call vundle#end()
  filetype plugin indent on  " Load plugins according to detected filetype.
"}

"{Python files specific setting
  autocmd FileType python set nowrap foldmethod=indent foldlevel=99
"}

