let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

"deinなかったらcloneでもってくる
if !isdirectory(s:dein_repo_path)
	exectute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
endif
execute 'set runtimepath^=' . s:dein_repo_path

let g:dein#enable_notification = 1

call dein#begin(s:dein_path)
call dein#load_toml('~/.vim/userautoload/dein/plugins.toml', {'lazy': 0})
call dein#load_toml('~/.vim/userautoload/dein/plugins_lazy.toml', {'lazy': 1})
call dein#end()

if dein#check_install()
	call dein#install()
endif
