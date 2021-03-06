set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'VundleVim/Vundle.vim'

" original repos on github
Bundle 'vim-scripts/a.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'minibufexpl.vim'
Bundle 'FuzzyFinder'
Bundle 'OmniCppComplete'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'zhongxingzhi/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'whatot/gtags-cscope.vim'
"Bundle 'srooloose/syntastic'
"Bundle 'terryma/vim-multiple-coursors'
Bundle 'scrooloose/nerdtree'
"Bundle 'vim-scripts/refactor'
Bundle 'zhongxingzhi/pyclewn'
Bundle 'marijnh/tern_for_vim'
Bundle 'tacahiroy/ctrlp-funky'

call vundle#end()
filetype plugin on
filetype indent on
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" ctags --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++

syntax enable
syntax on
set foldmethod=syntax
set nofoldenable
"color scheme

set t_Co=256 "开启256分辨率,终端更好看
set background=dark "由于这个配色方案在终端,选择黑色背景

set shortmess=atI "去除开启vim的对话
let g:solarized_termcolors=256
let g:solarized_contrast="low"
let g:solarized_termtrans=1
colorscheme solarized "使用著名的配色方案"

hi Normal ctermbg=NONE "开启背景透明
"molokai
"let g:molokai_original = 1


"set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set cindent
set number
set nocp
set backspace=indent,eol,start
set mouse=a
set ignorecase
set noswapfile
set nobackup
set laststatus=2

set expandtab
set list
set listchars =eol:· "tab:▸\ ,trail:·,extends:…,nbsp:
set showbreak=↪\

let mapleader=","
let g:mapleader=","


"autocmd FileType python set expandtab
"autocmd FileType python set list
"
"
"""""""""""""""""""""""""""""""""""""""""""""
""""""miniBufExpl"""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" """"""""""""""""""""""""""OmniCppComplete"""""""""""""""""""""""""""
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set completeopt=menuone,menu,longest,preview

set tags+=~/.vim/tags/cpp

set cscopequickfix=c-,e-,d-,f-,g-,s-,t-


" 自动补全配置
"set completeopt=longest,menu   "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

""youcompleteme  默认tab  s-tab 和自动补全冲突
""let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
""let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1 " 从第1个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
nnoremap <leader>lo :lopen<CR> "open locationlist
nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处


"syntastic
 """"""""""""""syntastic"""""""""""""""""""
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args = '--ignore=E501,E225'

let g:syntastic_cpp_include_dirs = ['/usr/include', '/usr/local/include']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons
let g:syntastic_cpp_auto_refresh_includes = 1
"" """""""""""""""" tagbar """"""""""""""""""
"nmap <F8> :TagbarToggle<CR>
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
"let g:tagbar_left=1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()



" """""""""""""NERDTree"""""""""""""""""""""
"nmap <F7> :NERDTreeToggle<CR>
nmap <leader>tr :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end


""""""""""""Ctrl-P"""""""""""""""""""""""""""
" 打开ctrlp搜索
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']

""""""""""""""""vim-indent-guides""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level       = 2  " 从第二层开始可视化显示缩进
" \ig 打开/关闭 vim-indent-guides


" """""""""""""powerline"""""""""""""""""""
let g:Powerline_symbols = 'unicode'


""""""""""""""vim-trailing-white-space"""""""""
map <leader><space> :FixWhitespace<CR>


""""""""ultisnips"""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]


"""""TaskList.vim"""""""""""""""""""""""""""
map <leader>td <Plug>TaskList


"""""EasyMotion"""""""""""""""""""""""""""""
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Gif config
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
