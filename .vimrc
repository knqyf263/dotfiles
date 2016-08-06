set encoding=utf-8
set number "行番号表示
set autoindent
set expandtab

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

"===============================================
"" カラー設定
"===============================================
"
"" シンタックスハイライトを有効にする
syntax enable

" 背景色を dark にする
set background=dark
"
"
" " カラースキーマを Solarized にする
"colorscheme solarized
"
"===============================================
"" 表示
"===============================================
" カレント行ハイライトON
set cursorline
" " アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" ディレクトリ閲覧時の表示がツリー形式
let g:netrw_liststyle=3

"===============================================
"" 移動
"===============================================
"行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,] 
set backspace=indent,eol,start

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" ctagsのタグジャンプを変更
nmap <c-[>  :pop<CR>

"===============================================
"" 検索
"===============================================
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト
nnoremap <Esc><Esc> :noh<Return>


"===============================================
"" Python
"===============================================
imap <F5> <nop>
set pastetoggle=<F5> "ペーストするときにインデントさせない
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"===============================================
"" その他
"===============================================
" 特定の拡張子のファイルが新規作成される際，テンプレートが読み込まれるように設定
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl.txt
" vi との互換性OFF  
set nocompatible  
" ファイル形式の検出を無効にする  
filetype off 

" コマンドライン補完するときに補完候補を表示する
set wildmenu
  
"===============================================
"" NeoBundle
"===============================================
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切読み込まない
    let s:noplugin = 1
else
    " NeoBundleを'runtimepath'に追加し初期化を行う
    if has('vim_starting')
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#begin(s:bundle_root)

    " NeoBundle自身をNeoBundleで管理させる
    NeoBundleFetch 'Shougo/neobundle.vim'

    " 非同期通信を可能にする
    " 'build'が指定されているのでインストール時に自動的に指定されたコマンドが実行され vimproc がコンパイルされる
    NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}

    " originalrepos on github
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'Shougo/vimfiler'
    NeoBundle 'jpalardy/vim-slime'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'altercation/vim-colors-solarized'
    " ステータスラインをカッコよくする
    NeoBundle 'Lokaltog/vim-powerline'
    " 自動で閉じる
    NeoBundle 'tpope/vim-endwise'
    " Ruby補完
    NeoBundle 'marcus/rsense'
"    NeoBundle 'supermomonga/neocomplete-rsense.vim'

    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neomru.vim'

    " インストールされていないプラグインのチェックおよびダウンロード
    NeoBundleCheck
    call neobundle#end()
endif

"===============================================
"" プラグイン
"===============================================

"===============================================
"" quickrun
"===============================================
" Vim上からコードを実行
NeoBundleLazy "thinca/vim-quickrun", {
      \ "autoload": {
      \   "mappings": [['nxo', '<Plug>(quickrun)']]
      \ }}
nmap <Leader>r <Plug>(quickrun)
set splitright " quickrunを右側に表示
let g:quickrun_config = {'*': {'hook/time/enable': '1'},} " 常に実行時間を表示する

"===============================================
"" Tagbar
"===============================================
NeoBundleLazy "majutsushi/tagbar", {
      \ "autoload": { "commands": ["TagbarToggle"] }}
if ! empty(neobundle#get("tagbar"))
  " Map for toggle
  nn <silent> <leader>t :TagbarToggle<CR>
endif

"===============================================
"" SrcExpl
"===============================================
"NeoBundleLazy "wesleyche/SrcExpl", {
"      \ "autoload" : { "commands": ["SrcExplToggle"]}}
"if ! empty(neobundle#get("SrcExpl"))
"  " Set refresh time in ms
"  let g:SrcExpl_RefreshTime = 1000
"  " Is update tags when SrcExpl is opened
"  let g:SrcExpl_isUpdateTags = 1
"  " Source Explorer Window Height
"  let g:SrcExpl_winHeight = 14
"  let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
"  " Mappings
"  nn [srce] <Nop>
"  nm <Space>e [srce]
"  nn <silent> [srce]t :SrcExplToggle<CR>
"endif




"===============================================
"" Unite
"===============================================
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
"bookmarkだけホームディレクトリに保存
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-M> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-L> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-L> unite#do_action('vsplit')

"===============================================
"" VimFiler
"===============================================
nnoremap [vimfiler] <Nop>
nmap <Space>f [vimfiler]
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> [vimfiler]e :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> [vimfiler]i :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'


"===============================================
" rubocop
"===============================================
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"===============================================
" Rsense
"===============================================
let g:rsenseHome = "/usr/local/lib/rsense"
let g:rsenseUseOmniFunc = 1

"===============================================
"" インデント
"===============================================
filetype indent on " ファイル形式検出、プラグイン、インデントを ON  
filetype plugin indent on   

"===============================================
"" vimdiffの色設定
"===============================================
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"===============================================
"" Powerline
"===============================================
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode
