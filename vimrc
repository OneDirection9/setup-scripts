" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    :execute 'source '.fnameescape(vim_plug_path)
    let vim_plug_just_installed = 1
endif

" ============================================================================
" Active plugins
call plug#begin('~/.vim/plug')

if filereadable(expand('~/.vimrc.plugins'))
    source ~/.vimrc.plugins
endif

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles"
    :PlugInstall
endif

" ============================================================================
" Vim settings

" Encode ----------------------------------------
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix

" UI --------------------------------------------
syntax on  " syntax highlight on
set t_Co=256
set background=dark
colorscheme solarized
" set cursorline  " highlight cursor line
" highlight CursorLine cterm=Bold ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE

" Basic Config ----------------------------------
set nocompatible  " no vi-compatible
filetype plugin on  " allow plugins by file type (required for plugins!)
filetype indent on
set noswapfile

set ls=2  " always show status bar
set number  " show line numbers
set showcmd  " show cmd in the bottom
set showmatch  " highlight matched parenthese automatically
set scrolloff=3  " when scrolling, keep cursor * lines away from screen border horizontally
set sidescrolloff=3  " keep cursor * lines away from screen border vertically
set nobackup  " Don't create backup file
set noerrorbells " No bells when error

set history=1024  " history buffer size
set autoread  " Prompt if the file being edited is modified externally
set autowrite  " auto save

set incsearch  " incremental search
set hlsearch  " highlighted search results
set ignorecase
set smartcase

" Editor -------------------------------------
set expandtab  " replace tab with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent

set backspace=indent,eol,start  " use backspace to delete
set whichwrap=h,l  " use h/l to move to previous/next line

set complete=.,w,b,u,t,i,d
set completeopt=longest,menuone
set pumheight=10  " The number of items to show

set wildmenu
set wildmode=longest:list,full

set tags=./tags;
" ============================================
" Auto Command

" 打开文件光标自动跳转到上次关闭时的位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif ""

" ===========================================
" Key mappings

let mapleader=' '  " Leader
let maplocalleader=','  " Leader

" enter command mode with semicolon
nnoremap ; :
vnoremap ; :

" Switch in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

" Resize Window
nnoremap <Leader>+ :resize +1<cr>
nnoremap <Leader>_ :resize -1<cr>
nnoremap + :vertical resize +1<cr>
nnoremap _ :vertical resize -1<cr>

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>

" vimgrep查找字符串
nmap <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h **/*.py<cr><C-o>:cw<cr>

" ============================================================================
" Plugins settings and mappings

" vim-signify
" -----------------------------------------------------------------------------
set signcolumn=yes
noremap <Leader>s :SignifyDiff<cr>

" LeaderF
" -----------------------------------------------------------------------------
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <M-p> :LeaderfFunction!<cr>
noremap <M-n> :LeaderfBuffer<cr>
noremap <M-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" echodoc.vim
" -----------------------------------------------------------------------------
set noshowmode
let g:echodoc#enable_at_startup = 1

" taglist.vim
" -----------------------------------------------------------------------------
" 设置打开关闭快捷键F2
nmap  <F3> :TlistToggle<cr>
" 自动更新tags列表
let g:Tlist_Auto_Update=1
" 始终解析文件中的tag,不管taglist窗口有没有打开
let g:Tlist_Process_File_Always=1
" 当taglist窗口是最后一个窗口时退出vim
let g:Tlist_Exit_OnlyWindow=1
" 只显示一个文件的tags
let g:Tlist_Show_One_File=1
" 窗口宽度
let g:Tlist_WinWidth=30
" 只显示当前文件的tags
let g:Tlist_Enable_Fold_Column=0
" 高亮显示当前tag
let g:Tlist_Auto_Highlight_Tag=1
" 设置窗口显示在右侧
let g:Tlist_Use_Right_Window=1
" 打开时光标定位于taglist窗口
let g:Tlist_GainFocus_On_ToggleOpen=1

" NERDTree.vim
" -----------------------------------------------------------------------------
" 设置打开关闭快捷键F3
nmap  <F2> :NERDTreeToggle<cr>
" 窗口美化
let NERDChristmasTree=1
" 自动调整光标到窗口中心
let NERDTreeAutoCenter=1
" 指定鼠标模式(1.双击打开;2.单目录双文件;3.单击打开)
let NERDTreeMouseMode=2
" 默认显示文件
let NERDTreeShowFiles=1
" 默认显示隐藏文件
let NERDTreeShowHidden=1
" 窗口位置（'left' or 'right'）
let g:NERDTreeWinPos="left"
" 窗口宽度
let g:NERDTreeWinSize=30
" 显示行号
let g:NERDTreeShowLineNumbers=1
" 打开文件后关闭NERDTree窗口
" let g:NERDTreeQuitOnOpen=1
" 高亮显示当前行目录或文件
let NERDTreeHightCursorline=1
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.o$']

" gutentags.vim && gutentags_plus.vim
" -----------------------------------------------------------------------------
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" tags模式设置
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
    let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置ctags的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+lpxzLANU']
let g:gutentags_ctags_extra_args += ['--c-kinds=+lpxzL']
" 如果使用universal ctags需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰
" 使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0

" vim-preview.vim
" -----------------------------------------------------------------------------
" p预览 大P关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
noremap <Leader>d :PreviewScroll +1<cr> " 往下滚动预览窗口

" Window Chooser
" -----------------------------------------------------------------------------
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = -1

" yapf
" -----------------------------------------------------------------------------
autocmd FileType python nnoremap <LocalLeader>f :0,$!yapf<CR>

" jedi-vim
" -----------------------------------------------------------------------------
let g:jedi#show_call_signatures = 0

" ALE.vim
" -----------------------------------------------------------------------------
let g:ale_set_highlights = 0  " 禁用高亮显示
let g:ale_fix_on_save = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
" 使能airline状态栏扩展
let g:airline#extensions#ale#enabled = 1
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
" 错误警告消息格式
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
"普通模式下警告跳转快捷键
nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)
"<Leader>x触发/关闭语法检查
nmap <Leader>x :ALEToggle<CR>
"<Leader>y查看错误或警告的详细信息
nmap <Leader>y :ALEDetail<CR>
" 指定对应语言的检查工具
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \   'go': ['gofmt', 'golint'],
            \}
let g:ale_fixers = {
    \  '*': ['remove_trailing_lines', 'trim_whitespace'],
    \  'python': [
    \    'ale#fixers#generic_python#BreakUpLongLines',
    \   ]
    \}
" 关闭补全功能
let g:ale_completion_enabled = 0

" airline.vim
" -----------------------------------------------------------------------------
" 设置主题
let g:airline_theme='molokai' "'bubblegum'
" 这个是安装字体后必须设置此项"
let g:airline_powerline_fonts = 1
" 开启标签栏
let g:airline#extensions#tabline#enabled = 1
" 显示缓冲区编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 关闭状态显示空白符号计数"
let g:airline#extensions#whitespace#enabled = 0
" 状态栏显示设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
