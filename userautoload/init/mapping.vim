"#####キーマップ変更#####
"---インサートモード{{{
"インサートモード時にC-jでノーマルモードへ
inoremap <C-j> <esc>
"括弧を入力したら閉じ括弧もされて中にいる+Enter押したら改行してインデント
inoremap [ []<left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<left>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap { {}<left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap " ""<left>
inoremap ' ''<left>
"上記の括弧を消す時に補完されたものも消すスクリプト
"{{{
function! DeleteParenthesesAdjoin()
    let pos = col(".") - 1  " カーソルの位置．1からカウント
    let str = getline(".")  " カーソル行の文字列
    let parentLList = ["(", "[", "{", "\'", "\""]
    let parentRList = [")", "]", "}", "\'", "\""]
    let cnt = 0

    let output = ""

    " カーソルが行末の場合
    if pos == strlen(str)
        return "\b"
    endif
    for c in parentLList
        " カーソルの左右が同種の括弧
        if str[pos-1] == c && str[pos] == parentRList[cnt]
            call cursor(line("."), pos + 2)
            let output = "\b"
            break
        endif
        let cnt += 1
    endfor
    return output."\b"
endfunction
" BackSpaceに割り当て
inoremap <silent> <BS> <C-R>=DeleteParenthesesAdjoin()<CR>
"}}}

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
