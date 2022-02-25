" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

"{Basic setting
  filetype plugin indent on  " Load plugins according to detected filetype.
  syntax on

  set smartindent
  set autoindent
  "set cindent
  set expandtab
  set tabstop=4
  set shiftwidth=4
  set nu
  set ruler

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

  "{set colorshceme
    syntax enable
    "set t_Co=256
    colorscheme morning
  "}
"}
