" File: .vimrc
" Author: Sven Behrend <bse666@gmail.com>
" Description: my first vimrc with a little tweaks here and there.
" Last Modified: September 22, 2013
"

" This must be first, because it changes other options as side effect
set nocompatible
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#incubate() "pathogen#runtime_append_all_bundles()
" change the mapleader from \ to ,
let mapleader=","
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" jekyll blog settings
let g:jekyll_path = "$HOME/git/blog"
" Jekyll Bundle mappings
map <Leader>jn  :JekyllPost<CR>
map <Leader>jl  :JekyllList<CR>
map <Leader>jc  :JekyllCommit<CR>
map <Leader>jp  :JekyllPublish<CR>
set hidden

" toggle Tagbar with 'l'
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


" vimboy plugin
au bufread,bufnewfile ~/wiki/* set ft=vimboy
" notes plugin
let g:notes_directories = ['~/Dokumente/Notes', '~/Dropbox/Shared Notes']
set t_Co=16

syntax on

set background=dark " dark | light "
colorscheme solarized
call togglebg#map("<F5>")
filetype plugin on

set ts=4 sts=4 sw=4 expandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on
  autocmd filetype html,xml set listchars-=tab:>.
  autocmd filetype python set expandtab
   
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
   
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
   
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

set cursorline
set colorcolumn=80
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

filetype plugin indent on

" set out tab, spaces visually
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.


" Paste Mode for pasting more Text at once (use in insert mode)
set pastetoggle=<F2>

" enable Mouse
set mouse=a

" Enable Mouse Switching using:
" http://github.com/nvie/vim-togglemouse
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap


" Unmap the Arrow Keys
	no <down> <Nop>
	no <left> <Nop>
	no <right> <Nop>
	no <up> <Nop>

	ino <down> <Nop>
	ino <left> <Nop>
	ino <right> <Nop>
	ino <up> <Nop>

	vno <down> <Nop>
	vno <left> <Nop>
	vno <right> <Nop>
	vno <up> <Nop>

"============ Custom Mappings ==============
" tabbing
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
imap <C-Tab> <ESC>:tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>
noremap <F7> :set expandtab!<CR>

" with line wrapping go 1 line in editor not 1 line in text.
" nnoremap j gj
" nnoremap k gk

" " Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" unhilight searches
nmap <silent> ,/ :nohlsearch<CR>

" write the file with sudo: w!!
cmap w!! w !sudo tee % >/dev/null
