let mapleader = "\<Space>"

syntax on 															" Enable syntax
set number "relativenumber   						" Line number + relative line numbers
set encoding=utf-8                      " The encoding displayed
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" Treat dash separated words as a word text object
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set background=dark 										" Dark background
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set nowrap 															" No text wrapping
set noswapfile													" No swap file (might be a mistake)
set scrolloff=20
" set foldmethod=indent 								" Folds by indent
au BufNewFile,BufRead * if &syntax == '' | set syntax=zsh | endif " zsh default syntax
set t_Co=256
set cursorline
set ic                                  " Ignore case
set mouse=a

if (has("termguicolors"))
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set termguicolors
endif

"let g:airline_theme='onehalfdark'

" colorscheme onehalfdark

" colorscheme shades_of_purple
" colorscheme gruvbox
" colorscheme nord 
" colorscheme onedark
" hi Normal guibg=NONE ctermbg=NONE

" set softtabstop=0 noexpandtab
" set shiftwidth=4
" set incsearch
" set hlsearch
" set hidden " <- when a new buffer is opened, the prev file is not closed
" set colorcolumn=100
" highlight ColorColumn ctermbg=0 guibg=lightgrey
" set cursorline                        " Enable highlighting of the current line
