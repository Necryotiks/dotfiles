set background=dark
set showcmd
set number
set autoindent
set smartindent
set visualbell
set t_vb=
set number 
set relativenumber
set timeoutlen=1000 "No more ESC input delays
set ttimeoutlen=10
colorscheme badwolf

syntax on
autocmd BufNewFile,BufRead *.asm set syntax=mips
au! BufRead,BufNewFile *.json set filetype=json
au! bufread,bufnewfile *.conf set filetype=json
au! bufread,bufnewfile *.h set filetype=c
au! bufread,bufnewfile *.c set filetype=c
au! bufread,bufnewfile *.hpp set filetype=cpp
au! bufread,bufnewfile *.cpp set filetype=cpp
au! bufread,bufnewfile *.tex set filetype=tex

" Vundle (Required unless specified otherwise)
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" To install from command line: vim +PluginInstall +qall

set nocompatible
filetype off

"disable arrow keys because arrow keys ar for normies"
nnoremap <up>    <nop>
nnoremap <down>  <nop> 
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
vnoremap <up>    <nop>
vnoremap <down>  <nop>
vnoremap <left>  <nop>
vnoremap <right> <nop>

let mapleader = ","
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Lets Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"NERDtree
Plugin 'scrooloose/nerdtree'
map <C-b> :NERDTreeToggle<CR>

"NERDCommenter
Plugin 'scrooloose/nerdcommenter'
let g:NERDCommentEmptyLines = 1

"Syntastic
Plugin 'scrooloose/syntastic'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_check_header = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_cpp_compiler_options = "-Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-Wall -Wextra -Wpedantic"
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
			\ "mode": "active",
			\ "passive_filetypes": ["asm"] }

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1

" muComplete
Plugin 'lifepillar/vim-mucomplete'

let g:mucomplete#enable_auto_at_startup = 1
set noshowmode shortmess+=c
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noinsert,noselect

" JSON.vim
Plugin 'elzr/vim-json'

" Polyglot
"Plugin 'sheerun/vim-polyglot'

augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=78 shiftwidth=2
	autocmd FileType json set softtabstop=2 tabstop=8
	autocmd FileType json set expandtab
augroup END

" Bluespec SystemVerilog syntax
Plugin 'mtikekar/vim-bsv'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on
