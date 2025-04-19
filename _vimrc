if has("gui_running")
  set lines=40 columns=100
  "set lines=999 columns=999
set guifont=Consolas:h14:cANSI
endif
nnoremap <F11> :set lines=40 columns=100 <CR>
nnoremap <F12> :set lines=999 columns=999 <CR>

set backspace=indent,eol,start
set nocp
set nobackup
set nowritebackup
set noswapfile
set autoindent
set smartindent
set tabstop=8
set shiftwidth=8
set expandtab
set nosmarttab
set textwidth=80
syntax on
"colorscheme desert
set number
set showmatch
filetype plugin indent on
filetype plugin on
let g:netrw_keepdir = 0
map <C-K> :py3f c:/tools/clang/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f c:/tools/clang/share/clang-format.py<cr>
map <F3> :!gcc % -std=gnu89 -ggdb<cr>
imap <F3> :!gcc % -std=gnu89 -ggdb<cr>
imap <F5> :!./a.out<cr>
map <F5> :!./a.out<cr>
set tags=./tags,tags;$HOME;
" SuperTab completion fall-back
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
iab #i #include <
iab #d #define
iab #u using namespace std;
iab #m int main()
let g:netrw_browse_split=4
let g:netrw_altv=0

" cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add cscope database if exists
  if filereadable("cscope.out")
    cs add cscope.out
  endif
endif

" Cscope shortcuts
nmap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>

