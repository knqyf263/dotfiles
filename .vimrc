set number "行番号表示

"===============================================
"
"" カラー設定

"===============================================
"
"" シンタックスハイライトを有効にする

syntax enable

" 背景色を dark にする
set background=dark
"
" " 輝度とコントラストは、最初はデフォルトを試すのがオススメです
"
" " 自分はコントラストだけ高くしています
"
" " (ここではコメントアウトしています)
"
"
"
" " 輝度を高くする
"
"let g:solarized_visibility = "high"
"
"
"
" " コントラストを高くする
"
"let g:solarized_contrast = "high"
"
"
" " カラースキーマを Solarized にする
"colorscheme solarized

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" vi との互換性OFF  
set nocompatible  
" ファイル形式の検出を無効にする  
filetype off  
  
" Vundle を初期化して  
" Vundle 自身も Vundle で管理  
"set rtp+=~/.vim/bundle/vundle/  
"call vundle#rc()  
"Bundle 'gmarik/vundle'  
	  
" github にあるプラグイン  
	  
" vim-scripts プラグイン  
	  
" github にないプラグイン  
	  

" プラグイン
"
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
NeoBundle "vim-scripts/taglist.vim"
NeoBundle 'altercation/vim-colors-solarized'
" ステータスラインをカッコよくする
NeoBundle 'Lokaltog/vim-powerline'

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
let Tlist_Use_Right_Window = 1 
map <silent> <C-r> :TlistToggle<CR>
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'

" NERDTree
NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2
