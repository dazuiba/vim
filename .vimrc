filetype plugin indent on  " Automatically detect file types.

let g:netrw_list_hide= '.*\.swp$,^\.'

set nocompatible  " We don't want vi compatibility.

set diffopt=filler,iwhite
set guioptions-=T
set guioptions-=m

set tags+=/var/lib/var/lib/gems/1.8/gems/tags,~/.gem/ruby/1.8/gems/tags
let g:fuzzy_matching_limit = 15

let mapleader=","
let VCSCommandDisableMappings=1 " key binding conflict, so disable vcs key map
set grepprg=ack
set grepformat=%f:%l:%m

nmap ,ss :source $HOME/.vimrc<CR>
nmap ,sv :e $HOME/.vimrc<CR>
nmap ,sr :!ruby %<CR>
nmap ,sc :!ruby -c %<CR>

map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
"map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" ,* is Substitute(Replace)
nmap <Leader>* :%s/<C-R><C-W>/

" ,ff is format code
nmap ,f :set ff=unix<CR>:%!dos2unix<CR>gg=G:%s/\s\+$//ge<CR>

" ,fc is clean code
nmap ,fc :set ff=unix<CR>:%!dos2unix<CR>:%s/\s\+$//ge<CR>

source $VIMRUNTIME/mswin.vim
" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set wrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Color scheme
set background=dark
colorscheme ir_black_mod " This is a much better color scheme, Scotty :)
"colorscheme twilight

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 4 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set nocp hlsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set lines=50
set columns=120
set backspace=2     

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

"set showtabline=2
set tabpagemax=15
" set guifont=DejaVu\ Sans\ Mono\ 10
set cursorline

runtime! macros/matchit.vim

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

nmap <C-h> :%s/<C-R><C-W>/
nnoremap <silent> <C-tab> :tabnext<CR>
nnoremap <silent> <C-s-p> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew %<CR>
nnoremap <silent> <C-q> :bd<CR>

noremap <C-j> :bprev<CR>
noremap <C-k> :bnext<CR>


noremap <C-A-t> :FuzzyFinderTextMate<CR>
" F1 is toggle indent style smartly
map <F1> :call <SID>ToggleIndentStyle()<CR>
imap <F1> :call <Esc><F1>a

" Shift-F1 is Toggle iskeyword contain or not contain '_'
map <S-F1> :call <SID>ToggleIsKeyword('_')<CR>
imap <S-F1> <Esc><S-F1>a

function! s:ToggleIsKeyword(...)
  " Second param means 'force add', not 'toggle'
  if a:0 > 1 || stridx(&iskeyword, a:1) < 0
    exec "setlocal iskeyword+=" . a:1
  else
    exec "setlocal iskeyword-=" . a:1
  endif
endfunction

" F2 is Toggle wrap
map <F2> :call <SID>ToggleGuiOption("b")<CR>:set wrap!<CR>
imap <F2> <Esc><F2>a

function! s:ToggleGuiOption(option)
  " If a:option is already set in guioptions, then we want to remove it
  if match(&guioptions, "\\C" . a:option) > -1
    exec "set go-=" . a:option
  else
    exec "set go+=" . a:option
  endif
  "   if has("gui_running")
  "     call s:SetWinPos(g:CUR_FONT_INDEX)
  "   endif
endfunction

" F3 is Reverse hlsearch
map <F3> :set hlsearch!<CR>
imap <F3> <Esc><F3>a

" F4 is Toggle Tag List
" Rails Tag List will config this
map <F4> :TlistToggle<CR>
imap <F4> <Esc><F4>a

" F5 is Toggle Mini Buffer Explorer
map <F5> :TMiniBufExplorer<CR>
imap <F5> <Esc><F5>a


let g:buftabs_only_basename=1
set laststatus=2
let g:buftabs_in_statusline=1
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set hidden

nnoremap ' `
nnoremap ` '
set wildmode=list:longest

set title
set scrolloff=3


