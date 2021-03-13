" vim-ref-godoc - A ref source for Go.
" Maintainer: obcat <obcat@icloud.com>
" License:    MIT License

" Options {{{1
let g:ref_godoc_cmd = get(g:, 'ref_godoc_cmd', executable('go') ? ['go', 'doc'] : '')

" Create source (|ref-sources|) {{{1
let s:source = {'name': 'godoc'}

" |ref-source-attr-available()|
function s:source.available()
  return !empty(g:ref_godoc_cmd)
endfunction

" |ref-source-attr-get_body()|
function s:source.get_body(query)
  let result = ref#system(ref#to_list(g:ref_godoc_cmd, a:query))
  if result.result == 0
    let stdout = trim(result.stdout, "\n")
    if stdout != ''
      return stdout
    endif
  endif
  throw result.stderr == ''
  \ ? printf('no doc for %s', a:query)
  \ : substitute(split(result.stderr, "\n")[0], '^doc: ', '', '')
endfunction

" |ref-source-attr-opened()|
function s:source.opened(query)
  call ref#godoc#syntax#call()
endfunction

" Register source (|ref-autoload|) {{{1
function ref#godoc#define()
  return copy(s:source)
endfunction

" Misc {{{1
call ref#register_detection('go', 'godoc')
