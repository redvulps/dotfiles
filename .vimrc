syntax on
set updatetime=250
set nocompatible
set hidden
set fillchars+=vert:\ 
set background=dark
set number
let g:enable_bold_font = 1

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

call plug#begin('~/.vim/plugged')

" Base Plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sickill/vim-monokai'
Plug 'terryma/vim-multiple-cursors' 
Plug 'myusuf3/numbers.vim' 
Plug 'tpope/vim-commentary'
Plug 'qpkorr/vim-bufkill'
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'w0ng/vim-hybrid'

" Languages
Plug 'othree/html5.vim' "HTML5 + inline SVG omnicomplete function, indent
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/vim-journal' " syntax plugin for plain text files.
Plug 'kurko/smartest.vim' "Make your Vim smart when running your tests.
Plug 'burnettk/vim-angular'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-endwise'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-markdown' " sintax highlight for markdown
Plug 'hwartig/vim-seeing-is-believing'
Plug 'elixir-lang/vim-elixir'

call plug#end()

"Multiline
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-S-d>'

" NerdTree
colorscheme hybrid

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-e> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" Mirror nerdtree to new tabs
autocmd BufWinEnter * NERDTreeMirror

" Open file in tab instead of buffer
" let NERDTreeMapOpenInTab='<ENTER>'


"let g:nerdtree_tabs_open_on_console_startup=1

" Airline options
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1

" Vim GitGutter options
let g:gitgutter_sign_column_always = 1

" Ident guides
let g:indent_guides_space_guides = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

set ts=2 sw=2 et

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

" Buffer navigation
nnoremap <silent> <C-Right> :bn<CR> 
nnoremap <silent> <C-Left> :bp<CR>

nnoremap <silent> <A-Right> <c-w>l
nnoremap <silent> <A-Left> <c-w>h
nnoremap <silent> <A-Up> <c-w>k
nnoremap <silent> <A-Down> <c-w>j

" Line and column highlight
set cursorline
autocmd VimEnter,ColorScheme * :hi CursorLine   cterm=NONE ctermbg=240
autocmd VimEnter,ColorScheme * :hi CursorColumn cterm=NONE ctermbg=88

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" Clipboard
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
vmap <C-z> <Esc>ui
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

" Indent/deindent with tab
vnoremap < <gv
vnoremap > >gv
vmap <Tab> >
vmap <S-Tab> <

" Close current buffer
nnoremap <silent> <C-w> :BD<CR>


" Comment like sublime because yes
" vmap <C-;> gc
" map <C-;> gc
" imap <C-;> <Esc>vgci
"
" map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>. 
