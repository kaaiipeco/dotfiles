"#####表示設定#####
"---カラー設定{{{
syntax on
set t_Co=256
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

"カーソルライン表示
"set cursorline
"相対行番号表示
set relativenumber
"コマンドを最下部に表示する
set showcmd
"上下n行分の視界を確保
set scrolloff=10
"テキストを折り返さない
set nowrap

"---検索設定{{{
"ハイライトサーチを有効にする
set hlsearch
"大文字小文字を区別しない
set ignorecase
"大文字を含めた検索はその通りに検索
set smartcase
"}}}

"---テキスト編集設定{{{
"バックスペースでインデントや改行を削除
set backspace=indent,eol,start
"改行時インデントを引き継ぐ
set autoindent
"高度なインデント
set smartindent
"<Tab>入力時の空白の数
set shiftwidth=4
"<Tab>が対応する文字の数
set tabstop=4
"<Tab>入力時の空白の数
set softtabstop=4
"不可視文字を表示
set list
"不可視文字をどのように表示するか
set listchars=tab:»_,trail:-
"}}}

"---ファイル名補完強化{{{
set wildmenu
set wildmode=longest,full
"}}}

"---ステータスライン設定{{{
"ステータスラインを常に表示
set laststatus=2
"ファイル名を表示
set statusline=%F
"変更のチェックを表示
set statusline+=%m
"ヘルプページなら[help]と表示
"これ以降のステータス表示は右寄せ
set statusline+=%=
"ファイルのエンコーディング
set statusline+=[%{&fileencoding}]
"現在行数/全行数
set statusline+=[%l/%L]
"ファイルタイプを表示
set statusline+=%y
"}}}

"---タブライン設定{{{
"タブラインを常に表示
set showtabline=2
"}}}
"#####その他設定#####
"クリップボードを共有
set clipboard=unnamed
"マウスを有効にする
set mouse=a
"バックアップをとらない
set nobackup
".swapファイルを作らない
set noswapfile
".vimrcを変更したら自動で反映
" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
  augroup END

"#####キーマップ変更#####
"---インサートモード{{{
"インサートモード時にC-jでノーマルモードへ
inoremap <C-[> <esc>
"括弧を入力したら閉じ括弧もされて中にいる
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap ' ''<left>
"}}}

"---ノーマルモード{{{
";を:に
nnoremap ; :
"2回escを入力したら検索のハイライトをやめる
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
"ウィンドウの分割:横割り
nnoremap ss :<C-u>sp<CR>
"ウィンドウの分割:縦割り
nnoremap sv :<C-u>vs<CR>
"分割したウィンドウ間を移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
"分割したウィンドウそのものを移動
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
"カレントウィンドウの大きさを変更
nnoremap s0 <C-w>= "大きさを揃える
nnoremap s= <C-w>= "上に同じ
nnoremap s> <C-w>> "幅を増やす
nnoremap s< <C-w>< "幅を減らす
nnoremap s+ <C-w>+ "高さを増やす
nnoremap s- <C-w>- "高さを減らす
"タブを追加
nnoremap st :<C-u>tabnew<CR>
"次のタブ
nnoremap sn gt
"前のタブ
nnoremap sp gT
"バッファを閉じる
nnoremap sQ :<C-u>bd<CR>
"}}}
