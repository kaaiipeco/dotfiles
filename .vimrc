"#####表示設定#####
"---カラー設定{{{
syntax enable
set background=dark
colorscheme solarized
"let g:solarized_termcolors=256
"}}}

"---音設定{{{
"エラー時の音とヴィジュアルベルを鳴らさない
set noerrorbells
set novisualbell
set visualbell t_vb=
"}}}

"行番号表示
set number
"カーソル座標を表示
set ruler
"コマンドを画面最下部に表示する
set showcmd
"ハイライトサーチを有効にする
set hlsearch
"大文字小文字を区別しない
set ignorecase
"改行時インデントを引き継ぐ
set autoindent
"マウスを有効にする
set mouse=a

"#####見えない設定#####
"クリップボードを共有
set clipboard=unnamed
"#####キーマップ変更#####
"---インサートモード{{{
"インサートモード時にC-jでノーマルモードへ
inoremap <C-j> <esc>
"括弧を入力したら閉じ括弧もされて中にいる
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap ' ''<left>  
"}}}
 
"---ノーマルモード{{{
"2回escを入力したら検索のハイライトをやめる
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
"}}}
