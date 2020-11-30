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
" set cursorline  " highlight cursor line
" highlight CursorLine cterm=Bold ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE

" Basic Config ----------------------------------
set nocompatible  " no vi-compatible
filetype plugin on  " allow plugins by file type (required for plugins!)
filetype indent on

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
" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
silent !mkdir -p ~/.vim/files/backup/
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
silent !mkdir -p ~/.vim/files/swap/
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
silent !mkdir -p ~/.vim/files/undo/
set undodir     =$HOME/.vim/files/undo/
silent !mkdir -p ~/.vim/files/info/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

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

" Resize Window
nnoremap <Leader>+ :resize +1<cr>
nnoremap <Leader>_ :resize -1<cr>
nnoremap + :vertical resize +1<cr>
nnoremap _ :vertical resize -1<cr>

" tab navigation mappings
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>
nnoremap tm :tabm
nnoremap tt :tabnew
nnoremap ts :tab split<CR>
nnoremap tl :tabs<CR>
nnoremap tc :tabc<CR>

" buffer navigation
nnoremap ba :badd
nnoremap bd :bd
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap bl :ls<CR>

autocmd FileType python nnoremap <LocalLeader>f :0,$!yapf<CR>

" ============================================================================
" Plugins settings and mappings

" airline.vim
" -----------------------------------------------------------------------------
let g:airline_section_b = ''  " don't show anything in section b
" 开启标签栏
let g:airline#extensions#tabline#enabled = 1
" 显示缓冲区编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 关闭状态显示空白符号计数"
let g:airline#extensions#whitespace#enabled = 1
" 状态栏显示设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Window Chooser
" -----------------------------------------------------------------------------
nmap - <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = -1

" vim-signify
" -----------------------------------------------------------------------------
set signcolumn=yes
noremap <Leader>s :SignifyDiff<cr>

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
nmap <Leader>t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.o$']

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

" LeaderF
" -----------------------------------------------------------------------------
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ShowDevIcons = 0

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

let g:Lf_Gtagsconf = "/usr/local/share/gtags/gtags.conf"
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_GtagsAutoGenerate = 1

noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fg :<C-U><C-R>=printf("Leaderf! gtags -g %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" vim-preview.vim
" -----------------------------------------------------------------------------
" p预览 大P关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
noremap <Leader>d :PreviewScroll +1<cr> " 往下滚动预览窗口

" echodoc.vim
" -----------------------------------------------------------------------------
set noshowmode
let g:echodoc#enable_at_startup = 1

" completor.vim
" -----------------------------------------------------------------------------
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> Tab_Or_Complete()

noremap K :call completor#do('doc')<CR>

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
    \}
" 关闭补全功能
let g:ale_completion_enabled = 0

colorscheme solarized
