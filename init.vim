" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @anlen123
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


map <F5> :w<cr>:!python %<CR>
map <F5> :w<cr>:!python %<CR>
set nu
set nocompatible
"source $VIMRUNTIME/mswin.vim
"behave mswin
 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
 "设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8
filetype on
filetype plugin indent on
"colorscheme evening	"配色方案
"colorscheme desert
"set background=dark


set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
set guifont=Monaco:h10	"设置字体为Monaco，大小10
set tabstop=4		"设置tab的跳数
set expandtab
set backspace=2 	"设置退格键可用
"set nu! 		"设置显示行号
set wrap 		"设置自动换行
"set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
"Toggle Menu and Toolbar 	"隐藏菜单栏和工具栏
"set guioptions-=m
"set guioptions-=T
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set tabstop=4         
set softtabstop=4     
set shiftwidth=4     
set expandtab       
set mouse=a 		"设置在任何模式下鼠标都可用
set nobackup 		"设置不生成备份文件
"set go=				"不要图形按钮
set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
 
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
exec "noh" 
set incsearch "增量查找
"===========================
"状态栏的设置
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行
 
"===========================
"代码设置
"===========================
syntax enable "打开语法高亮
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
"set shiftwidth=4 "换行时，交错使用4个空格
set autoindent "设置自动对齐
set ai! "设置自动缩进
"set cursorcolumn "启用光标列
"set cursorline "设置高亮当前行(这里我注释了)
""hi CursorLine   cterm=NONE ctermbg=
set guicursor+=a:blinkon0 "设置光标不闪烁
"set fdm=indent "代码自动隐藏（合并） 

map <F5> :w<cr>:!python %<CR>
map L :set splitright<CR>:vsplit<CR> "右分屏
map H :set nosplitright<CR>:vsplit<CR>


set clipboard=unnamed
set number 
set smartindent

"关闭警告音
set vb t_vb=
"Vim 与系统剪切板共享
set clipboard=unnamed
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
noremap X :wq<CR>
noremap Q :q!<CR>
noremap S :w<CR>
map L :set splitright<CR>:vsplit<CR> "右分屏
map H :set nosplitright<CR>:vsplit<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-path'
"状态栏的例子
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"自动补全
"Plug 'ervandew/supertab'
"Plug 'yggdroot/indentline'
"自动弹出提示
Plug 'vim-scripts/AutoComplPop'
"编译运行
"F4 添加作者信息，更新作者信息
"F9 一键保存、编译、连接存并运行
"Ctrl + F9 一键保存并编译
"Ctrl + F10 一键保存并连接
"F8 编译调试（仅限于单文件)(gdb)
Plug 'Svtter/ACM.vim'
Plug 'scrooloose/nerdtree' "文件树
Plug 'easymotion/vim-easymotion'
nmap ss <Plug>(easymotion-s2)
"注释代码工具
"\cc注释当前行 \cu 撤销注释当前行 \cs sexily注释 \cA 行尾注释，切换成输入模式
Plug 'scrooloose/nerdcommenter'
noremap tt :NERDTree<CR>
"关于状态栏的小配置
"Powerline setting
"let g:airline_theme='molokai'
"let g:airline_powerl"ine_fonts = 1
"一只说话的狗
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'gko/vim-coloresque'
Plug 'will133/vim-dirdiff'
Plug 'itchyny/vim-cursorword'
"Plug 'Valloric/YouCompleteM'
Plug 'rkulla/pydiction'
call plug#end()
filetype plugin on
let g:pydiction_location = '~/.config/nvim/tools/pydiction/complete-dict'

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
