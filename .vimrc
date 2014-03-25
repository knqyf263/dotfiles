set encoding=utf-8
set number "行番号表示

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

"===============================================
"" 検索
"===============================================
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

"===============================================
"" Python
"===============================================
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"===============================================
"" その他
"===============================================
" 特定の拡張子のファイルが新規作成される際，テンプレートが読み込まれるように設定
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
" vi との互換性OFF  
set nocompatible  
" ファイル形式の検出を無効にする  
filetype off 
" コマンドライン補完するときに補完候補を表示する
set wildmenu
  
" Vundle を初期化して  
" Vundle 自身も Vundle で管理  
"set rtp+=~/.vim/bundle/vundle/  
"call vundle#rc()  
"Bundle 'gmarik/vundle'  
	  
" github にあるプラグイン  
	  
" vim-scripts プラグイン  
	  
" github にないプラグイン  
	  

"===============================================
"" プラグイン
"===============================================
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
" ステータスラインをカッコよくする
NeoBundle 'Lokaltog/vim-powerline'
 " tagsを利用したソースコード閲覧・移動補助機能 tagsファイルの自動生成
NeoBundle 'vim-scripts/SrcExpl'
" ソースコード上のメソッド宣言、変数宣言の一覧を表示
NeoBundle "vim-scripts/taglist.vim"
" NERD_tree, taglist, srcexpl の統合
NeoBundle 'vim-scripts/Trinity'
" Vim上からコードを実行
NeoBundle 'thinca/vim-quickrun'
" quickrunを右側に表示
set splitright

" vim-powerline用設定
"let g:Powerline_symbols = 'fancy'

" ファイル形式検出、プラグイン、インデントを ON  
filetype indent on
filetype plugin indent on   


" taglist
set tags=tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
let Tlist_Enable_Fold_Column = 1 " 折り畳み
"let Tlist_Use_Right_Window = 1 
map <silent> <C-r> :TlistToggle<CR>
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'

" NERDTree
NeoBundle 'scrooloose/nerdtree.git'
"nmap <silent> <C-e>      :NERDTreeToggle<CR>
"vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
"omap <silent> <C-e>      :NERDTreeToggle<CR>
"imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
"cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeShowHidden=1
"let g:NERDTreeMinimalUI=1
"let g:NERDTreeDirArrows=0
"let g:NERDTreeMouseMode=2


" Trinity
" Open and close all the three plugins on the same time 
nmap <C-e>   :TrinityToggleAll<CR> 
" Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 
" Open and close the taglist.vim separately 
nmap <C-r>  :TrinityToggleTagList<CR> 
" Open and close the NERD_tree.vim separately 
nmap <C-a>  :TrinityToggleNERDTree<CR> 
