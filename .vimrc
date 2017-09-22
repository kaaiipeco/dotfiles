"#####dein#####
"{{{
"required
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

"Add or remove your pugin here:
call dein#add('mattn/emmet-vim')
call dein#add('OmniSharp/omnisharp-vim', { 
	\ 'autoload':{ 'filetypes':['cs', 'csi', 'csx'] },
	\ 'build':{
	\	'windows':'msbuild server/OmniSharp.sln',
	\	'mac':'xbuild server/OmniSharp.sln',
	\	'unix':'xbuild server/OmniSharp.sln',
	\ },
	\})
call dein#add('Shougo/neocomplete.vim')
call dein#add('tpope/vim-dispatch')
call dein#add('scrooloose/syntastic')

"required
call dein#end()

if dein#check_install()
	call dein#install()
endif
"End dein scripts}}}
"
"---プラグイン設定{{{
"emmet
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
\	'variables' : {
\	'lang' : "ja"
\	},
\	'identation' : ' ',
\}
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"{{{neocomplete OmniSharp
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
"neocomplete OmniSharp end}}}

"}}}
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

"行番号表示
set number
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
"set list
"不可視文字をどのように表示するか
"set listchars=tab:»-,trail:-,extends:»,precedes:«
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
"{{{
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
"  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
"  augroup END
"}}}

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

