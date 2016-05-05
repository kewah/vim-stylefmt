" ============================================================================
" File:        stylefmt.vim
" Maintainer:  Antoine Lehurt
" Description: Expose commands to execute the stylefmt binary on normal and
"              visual modes.
" Last Change: 2015-08-14
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" Forked:      https://github.com/millermedeiros/vim-esformatter
" ============================================================================

" avoid installing twice
if exists('g:loaded_stylefmt') || &compatible
  finish
endif

" check if debugging is turned off
if !exists('g:stylefmt_debug')
  let g:loaded_stylefmt = 1
end

function! s:StylefmtNormal()
  " store current cursor position and change the working directory
  let win_view = winsaveview()
  let file_wd = expand('%:p:h')
  let current_wd = getcwd()
  execute ':lcd' . file_wd

  " pass whole buffer content to stylefmt
  let output = system('stylefmt', join(getline(1,'$'), "\n"))

  if v:shell_error
    echom "Error while executing stylefmt! no changes made."
    echo output
  else
    " delete whole buffer content and append the formatted code
    normal! ggdG
    let list = split(output, "\n")
    call setline(1, list[0])
    call append(1, list[1:])
  endif

  " Clean up: restore previous cursor position and working directory
  call winrestview(win_view)
  execute ':lcd' . current_wd
endfunction

function! s:StylefmtVisual() range
  " store current cursor position and change the working directory
  let win_view = winsaveview()
  let file_wd = expand('%:p:h')
  let current_wd = getcwd()
  execute ':lcd' . file_wd

  " get lines from the current selection and store the first line number
  let range_start = line("'<")
  let input = getline("'<", "'>")

  let output = system('stylefmt', join(input, "\n"))

  if v:shell_error
    echom 'Error while executing stylefmt! no changes made.'
    echo output
  else
    " delete the old lines
    normal! gvd

    let new_lines = split(l:output, '\n')

    " add new lines to the buffer
    call append(range_start - 1, new_lines)

    " Clean up: restore previous cursor position
    call winrestview(win_view)
    " recreate the visual selection and cancel it, so that the formatted code
    " can be reselected using gv
    execute "normal! V" . (len(new_lines)-1) . "j\<esc>"
  endif

  " Clean up: restore working directory
  execute ':lcd' . current_wd
endfunction

command! -range=0 -complete=shellcmd Stylefmt call s:StylefmtNormal()
command! -range=% -complete=shellcmd StylefmtVisual call s:StylefmtVisual()
