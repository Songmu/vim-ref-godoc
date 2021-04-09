" vim-ref-godoc - A ref source for go doc.
" Maintainer: obcat <obcat@icloud.com>
" License:    MIT License

if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'ref-godoc'

syntax match refGodocPackageName '\%^package \zs\S\+'
highlight default link refGodocPackageName String

syntax region refGodocComment start='\%(\s\|^\)\zs//' end='$'
highlight default link refGodocComment Comment

syntax match refGodocSectionHeader '^\%(CONSTANTS\|FUNCTIONS\|TYPES\|VARIABLES\)$'
highlight default link refGodocSectionHeader Statement

syntax match refGodocConstantName '^\s*const \zs\k\+'
syntax match refGodocFunctionName '^\s*func \zs\k\+'
syntax match refGodocFunctionName '^\s*func (.\{-1,}) \zs\k\+'
syntax match refGodocTypeName     '^\s*type \zs\k\+'
syntax match refGodocVariableName '^\s*var \zs\k\+'
highlight default link refGodocConstantName Constant
highlight default link refGodocFunctionName Constant
highlight default link refGodocTypeName     Constant
highlight default link refGodocVariableName Constant

syntax keyword refGodocTodo TODO FIXME XXX BUG
highlight default link refGodocTodo Todo
