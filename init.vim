"" __  ____   __  _   ___     _____ __  __ ____   ____
""|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
""| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
""| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
""|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @anlen123
" ===
" === Auto load for first time uses
" ===
"if empty(glob('~/.config/nvim/autoload/plug.vim'))
"	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://gitee.com/anlen123/nvim/raw/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nu
set nocompatible
"source $VIMRUNTIME/mswin.vim
"behave mswin
 
set diffexpr=MyDiff()
"function MyDiff()
"let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt= opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
 "设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
"set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
"language messages zh_CN.utf-8
filetype on
filetype plugin indent on
"colorscheme evening	"配色方案
"colorscheme desert
set background=dark


set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
set guifont=Monaco:h10	"设置字体为Monaco，大小10
set tabstop=4		"设置tab的跳数
set expandtab
set backspace=2 	"设置退格键可用
set wrap 		"设置自动换行
"set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=10	"在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set tabstop=4         
set softtabstop=4     
set shiftwidth=4     
set expandtab       
"set mouse=a 		"设置在任何模式下鼠标都可用
"set nobackup 		"设置不生成备份文件
"set guioptions-=T           " 隐藏工具栏
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
map sl :set splitright<CR>:vsplit<CR> "右分屏
map sh :set nosplitright<CR>:vsplit<CR> "右分屏
map B :tabnew <CR>
map + :tabnext <CR>
map _ :tabprevious <CR>
set smartindent
"关闭警告音
set vb t_vb=
"Vim 与系统剪切板共享
set clipboard=unnamed
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
noremap X :x<CR>
noremap Q :q!<CR>
noremap W :w<CR>
call plug#begin('~/.config/nvim/plugged')
"状态栏的例子
Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"图标插件
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
"自动补全插件,.路径补全和上下文补全
"Plug 'Shougo/neocomplcache'
"let g:neocomplcache_enable_at_startup = 1 
"let g:neocomplcache_enable_auto_select = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [ 'coc-vimlsp','coc-marketplace','coc-jedi','coc-python', 'coc-pyright']
"直接从空格调出补全
"inoremap <silent> <expr> <c-o> coc#refresh() 
nmap ss <Plug>(easymotion-s2)
"注释代码工具
"\cc注释当前行 \cu 撤销注释当前行 \cs sexily注释 \cA 行尾注释，切换成输入模式
Plug 'scrooloose/nerdcommenter'
"一只说话的狗
Plug 'mhinz/vim-startify'
"自动加括号
Plug 'jiangmiao/auto-pairs'
Plug 'gko/vim-coloresque'
"Plug 'will133/vim-dirdiff'
Plug 'itchyny/vim-cursorword'
Plug 'scrooloose/nerdtree'
Plug 'universal-ctags/ctags'
Plug 'tpope/vim-surround' " 用下面的插件选中代码后,使用 S 对那些代码进行符号包裹  ;cs({ 把小括号包裹的变成大括号
Plug 'gcmt/wildfire.vim'  " 回车 会选中 当前 符号包裹的 代码
call plug#end()
filetype plugin on

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set undofile
"set swapfile
noremap <F9> :call CompileRunGcc()<CR>
noremap tt :NERDTree<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow    
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res 10
    :term ./%<
    exec "!rm -rf ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
    exec "!rm %<.class"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!" google-chrome-stable " % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device
    CocCommand flutter.dev.openDevLog
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
  endif
endfunc

"每次创建C++文件都会初始化一些内容
autocmd BufNewFile *.cpp exec ":call CppInit()"
func CppInit()
  if expand("%:e") == "cpp"
    call setline(1,"#include<bits/stdc++.h>")
    call setline(2,"using namespace std;")
    call setline(3,"int main(int argc, const char *argv[]){")
    call setline(4,"")
    call setline(5,"    return 0;")
    call setline(6,"}")
  endif
endfunc
autocmd BufNewFile *.py exec ":call PyInit()"
func PyInit()
  if expand("%:e") == "py"
    call setline(1,"#!/root/miniconda3/bin/python")
    call setline(2,'# -*- coding: utf-8 -*- ')
  endif
endfunc
autocmd BufNewFile * normal G'
"========COC============
"========COC============
"========COC============
"========COC============
"========COC============
"========COC============
"========COC============
function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

""" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"========COC============
"========COC============
"========COC============
"========COC============
"========COC============
"========COC============
"========COC============
noremap ;p :set paste<CR>
noremap ;np :set nopaste<CR>
 
