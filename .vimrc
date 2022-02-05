call pathogen#infect()

""""""""""""""""""""""""""""
""" VIM CONFIGURE
""""""""""""""""""""""""""""

syntax on  "start using syntax highlighting
filetype plugin indent on "switch on file type detection, with automatic indenting and settings

colorscheme desert
""colorscheme molokai
set background=dark "background color
set t_Co=256 "number of colors
set guifont=Monospace\ Regular\ 12


set tabstop=3  "number of spaces that <Tab> in file uses
set shiftwidth=3 "same with tabstop
set autoindent "take indent for new line from previous line
set smartindent "Do smart autoindenting when starting a new line
set cindent "works for C-like programs
set expandtab "use spaces when <Tab> is inserted

set number
set showcmd
set cursorcolumn
""set cursorline
set showmatch
set wildmenu

set backspace=indent,eol,start
set noswapfile
set nobackup

set foldenable
set foldmethod=marker
""set foldcolumn=4
""set foldcolumn&
""set foldmethod=indent

set hlsearch
set incsearch ""highlight match while typing search pattern
set ignorecase ""ignore case in search patterns
set matchtime=2

set isfname+={,}
set ruler
set statusline=[%F]%y%r%m*%=[Line:%l/%L,Column:%c][%p%%]
set magic ""changes special characters in search patterns
set encoding=utf8

""""""""""""""""""""""""""""
""" USER DEFINE
""""""""""""""""""""""""""""

let mapleader = ","

inoremap jk <esc>
nnoremap <BackSpace> :nohl<CR>

inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

nnoremap <Leader>w :w<CR>
nnoremap <Leader>v :Vexplore<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>s :Sexplore<CR>
nnoremap <Leader>e :Explore<CR>


"" max window
nmap - :res<CR>:vertical res<CR>$

map <Leader>h <C-W-H>
map <Leader>l <C-W-L>

vnoremap <C-C> "+y
nnoremap <C-P> "+gP

" Switch CWD to the directory of the open buffer"
map <Leader>cd :cd %:p:h<cr>:pwd<cr>

"" open at the last quit location
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif
set viminfo^=%

"" <F2> Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent><F2> :if &guioptions =~# 'T' <Bar>
         \set guioptions-T <Bar>
         \set guioptions-m <Bar>
      \else <Bar>
         \set guioptions+T <Bar>
         \set guioptions+m <Bar>
      \endif<CR>


""""""""""""""""""""""""""""
""" PLUGIN
""""""""""""""""""""""""""""

""MiniBufExpl
let g:MiniBufExplMapWindowNavVim = 1
let g:MiniBufExplMapWindowNavArrows = 1
let g:MiniBufExplForceSyntaxEnable = 1
let g:MiniBufExplorerMoreThanOne = 2
let g:MiniBufExplModSelTarget = 0
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

""easymotion
nmap ss <Plug>(easymotion-s2)

""matchit
let b:match_words=
   \ '\<begin\>:\<end\>,' .
   \ '\<if\>:\<else\>,' .
   \ '\<module\>:\<endmodule\>,' .
   \ '\<class\>:\<endclass\>,' .
   \ '\<program\>:\<endprogram\>,' .
   \ '\<clocking\>:\<endclocking\>,' .
   \ '\<property\>:\<endproperty\>,' .
   \ '\<sequence\>:\<endsequence\>,' .
   \ '\<primitive\>:\<endprimitive\>,' .
   \ '\<specify\>:\<endspecify\>,' .
   \ '\<package\>:\<endpackage\>,' .
   \ '\<covergroup\>:\<endgroup\>,' .
   \ '\<generate\>:\<endgenerate\>,' .
   \ '\<interface\>:\<endinterface\>,' .
   \ '\<function\>:\<endfunction\>,' .
   \ '\<task\>:\<endtask\>,' .
   \ '\<case\>|\<casex\>|\<casez\>:\<endcase\>,' .
   \ '\<fork\>:\<join\>|\<join_any\>|\<join_none\>,' .
   \ '`ifdef\>:`else\>:`endif\>,'


""Supertab
""let g:SuperTabMappingForward=""
let g:SuperTabMappingForward="<tab>"
let g:SuperTabMappingBackward="<s-Tab>"
""inoremap <Tab> <C-n>
inoremap <Leader><Space> <Tab>
   

""maximizer 
nnoremap <Leader>m :MaximizerToggle<CR>
vnoremap <Leader>m :MaximizerToggle<CR>gv
inoremap <Leader>m <C-o>:MaximizerToggle<CR>

"" expand-region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

"" ctrlp
let g:ctrlp_map = '<c-e>'
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_root_markers = ['.kkk']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

"" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
         \set guioptions-=T <Bar>
         \set guioptions-=m <Bar>
      \else <Bar>
         \set guioptions+=T <Bar>
         \set guioptions+=m <Bar>
      \endif<CR>

"" [md] instert comment
iab md <c-r>="//modified by Holden @".strftime("%c")<cr>

map <F9> ms:call XYY()<cr>'s
autocmd BufNewFile *.sv exec ":call XYY()"
function XYY()
call append(0,"//************************************************//")
call append(1,"//   Copyright(C), XXX Co. Ltd.")
call append(2,"//                                                  ")
call append(3,"//   Filename    : ".expand("%:t"))
call append(4,"//   Author      : Holden Liu                       ")
call append(5,"//   Mail        :                                  ")
call append(6,"//   Version     : 1.0                              ")
call append(7,"//   Create_time : ".strftime("%Y-%m-%d")."")
call append(8,"//   Description :                                  ")
call append(9,"//************************************************//")
call append(10,"`ifndef " .expand("%:t"))
call append(11,"`define " .expand("%:t"))
call append(12,"`endif ")
endfunction
