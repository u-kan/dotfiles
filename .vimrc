" cf.) https://qiita.com/jnchito/items/5141b3b01bced9f7f48f#unitevim%E3%81%A7%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E3%81%99%E3%81%B0%E3%82%84%E3%81%8F%E9%96%8B%E3%81%8F
"------------基本設定------------
"行番号を表示する
set number
"編集中のファイル名を表示
set title
"括弧入力時の対応する括弧を表示
set showmatch
"コードを色付け
syntax on
"インデントをスペース４つ分に
set tabstop=2
"自動挿入されるインデントのスペース幅
set shiftwidth=2
"キーを押した時に挿入されるスペースの量
set softtabstop=2
"vim内部の文字コードをutf-8に
set encoding=utf-8
"スペースをタブ文字にへんこ
set expandtab
"カーソルの回りこみ設定
set whichwrap=b,s,[,],<,>
"バックスペースを空白、行末、行頭で有効化
set backspace=indent,eol,start
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()})}
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
"カッコを閉じた時に対応するカッコに一時的に移動
set nostartofline

"検索設定 -------------------
"大文字/小文字の区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan




" dein Scripts-----------------------------

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/./bundles')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてく
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
       execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
" jellybeans カラースキーマを使ってみましょう
set t_Co=256
colorscheme jellybeans

" Unite.vimの設定
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" uniteでの検索から除外
let g:unite_source_rec_async_command=
      \ ['ag', '--follow', '--nocolor', '--nogroup',
      \  '--hidden', '-g', '']


" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" te :ファイル一覧
noremap <C-N> :UniteWithProjectDir -buffer-name=file -force-redraw file_rec/async<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" nerdtree
noremap <C-O> :NERDTreeToggle<CR>
set modifiable

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
" """"""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" vim-javascript settings
let g:javascript_plugin_jsdoc = 1


let g:syntastic_javascript_checkers=['eslint']

" ここから下は Syntastic のおすすめの設定
" ref. https://github.com/scrooloose/syntastic#settings

" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行する
" let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0

" gitgutter
set updatetime=250
set updatetime=250

" map jj to Esc
inoremap <silent> jj <ESC>

