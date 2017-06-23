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
"" vim-plug
"===============================================

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
call plug#end()
  

"===============================================
"" プラグイン
"===============================================

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
"noremap <C-M> :Unite file_mru<CR>
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
"" vimdiffの色設定
"===============================================
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

