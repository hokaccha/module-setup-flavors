" [% module %].vim - description
"
" Author:  [% config.author %] <[% config.url %]>
" Version: 0.0.1
" License: MIT License <http://www.opensource.org/licenses/mit-license.php>

if exists('g:loaded_[% module %]')
    finish
endif
let g:loaded_[% module %] = 1

let s:save_cpo = &cpo
set cpo&vim

" plugin code here

let &cpo = s:save_cpo
