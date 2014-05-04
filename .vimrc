filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'minibufexpl.vim'
Bundle 'FuzzyFinder'
Bundle 'OmniCppComplete'
"Bundle 'Shougo/neocomplete.vim'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'https://github.com/Shougo/neocomplcache.vim'
Bundle 'Shougo/neosnippet'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'Shougo/neocomplcache-clang'
Bundle 'Shougo/neocomplcache-clang_complete'
"Bundle 'majutsushi/tagbar'
"Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/nerdtree'
Bundle 'file:///home/anti/zhong/git/tagbar.git'
Bundle 'file:///home/anti/zhong/git/syntastic.git'
Bundle 'file:///home/anti/zhong/git/nerdtree.git'

syntax enable
syntax on

set t_Co=256 "开启256分辨率,终端更好看  
set background=dark "由于这个配色方案在终端,选择黑色背景  
 
set shortmess=atI "去除开启vim的对话   
let g:solarized_termcolors=256
let g:solarized_contrast="low"
colorscheme solarized "使用著名的配色方案"
hi Normal ctermbg=NONE "开启背景透明
let g:solarized_termtrans=1



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


filetype plugin on
filetype indent on

"autocmd FileType python set expandtab
"autocmd FileType python set list
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
""""""miniBufExpl"""""""""""""""""""""""""""""

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"
"
" """""""""""""""""""""""""""""configuration for neocomplcache""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1 
"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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


" """""""""""""""" tagbar """"""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
"let g:tagbar_left=1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()


" """"""""""""""syntastic"""""""""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args = '--ignore=E501,E225'


" """""""""""""NERDTree"""""""""""""""""""""
nmap <F7> :NERDTreeToggle<CR>


" """""""""""""powerline"""""""""""""""""""
let g:Powerline_symbols = 'unicode'


" """"""""""""clang completion """"""""""""
" use neocomplcache & clang_complete

" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1

" add clang_complete option
let g:clang_complete_auto=1
let g:clang_auto_select=0

