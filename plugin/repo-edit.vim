scriptencoding utf-8

" vim-repo-edit
" Author: Sheldon Johnson
" Version: 0.1

if exists('g:loaded_repo_edit') || &compatible
  finish
endif

let g:loaded_repo_edit = 1

function! RepoEdit(url) abort
	let l:basename = system("basename " . a:url . " .git")
	let l:repo_path = "/tmp/" . l:basename
	execute "!git clone " . a:url . " " . l:repo_path
	execute "lcd ". l:repo_path
	edit .
endfunction

command! -nargs=1 RepoEdit call RepoEdit(<q-args>)
