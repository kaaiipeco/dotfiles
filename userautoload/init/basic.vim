"===========================
"音設定
"===========================
"エラー時の音とヴィジュアルベルを鳴らさない
set noerrorbells
set novisualbell
set visualbell t_vb=

"===========================
"行設定"
"===========================
"行番号表示
set number
"コマンドを最下部に表示する
set showcmd
"上下n行分の視界を確保
set scrolloff=10
"テキストを折り返さない
"set nowrap
"編集行の行番号をハイライト
set cursorline
hi clear CursorLine
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE

"===========================
"検索設定
"===========================
"ハイライトサーチを有効にする
set hlsearch
"大文字小文字を区別しない
set ignorecase
"大文字を含めた検索はその通りに検索
set smartcase
"}}}

"===========================
"ステータスライン,タブライン設定
"===========================
"ファイル名補完強化
set wildmenu
set wildmode=longest,full

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

"タブラインを常に表示
set showtabline=2

"===========================
"その他設定
"===========================
"ファイルタイプ検出
filetype on
filetype plugin indent on
"クリップボードを共有
set clipboard=unnamed
"マウスを有効にする
set mouse=a
"バックアップをとらない
set nobackup
".swapファイルを作らない
set noswapfile
".vimrcを変更したら自動で反映
"augroup source-vimrc
"  autocmd!
"  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
"  augroup END

"===========================
"ヘルプを常に日本語に
"===========================
set helplang=ja,en
