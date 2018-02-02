set background=dark
set number
set autoindent
set smartindent
set visualbell
set t_vb=
set number 
set relativenumber

colorscheme badwolf

autocmd BufNewFile,BufRead *.asm set syntax=mips
au! BufRead,BufNewFile *.json set filetype=json
au! bufread,bufnewfile *.conf set filetype=json

" Vundle (Required unless specified otherwise)
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" To install from command line: vim +PluginInstall +qall

set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Lets Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Fugitive
Plugin 'tpope/vim-fugitive'

"c.vim
Plugin 'WolfgangMehner/c-support'

"NERDtree
Plugin 'scrooloose/nerdtree'
map <C-b> :NERDTreeToggle<CR>

"NERDCommenter
Plugin 'scrooloose/nerdcommenter'
let g:NERDCommentEmptyLines = 1

"Syntastic
Plugin 'scrooloose/syntastic'

"LaTeX
Plugin 'lervag/vimtex'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
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

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
augroup END


" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on
