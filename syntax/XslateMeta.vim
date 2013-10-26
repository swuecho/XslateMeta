if exists("b:current_syntax")
    finish
endif

runtime! syntax/html.vim
syntax keyword txKeyword render cascade around block override macro contained
syntax keyword txBuildin size reduce merge count cycle is_first is_last peek_next peek_prev body max_index 
syntax match txKeyword +contain+ 
syntax match txKeyword +\$\w*+ 
syntax include @inlinePerl syntax/perl.vim
syntax cluster inlinePerl remove=perlFunctionName remove=perlElseIfError
syntax clear perlElseIfError
syntax region txBlock   matchgroup=txDelim start=+\[%+  end=+%\]+ contains=txKeyword,txComment,@inlinePerl containedin=ALL keepend
syntax match  txBlock   +^\s*%%.*$+ contains=txDelim,txKeyword,txComment,@inlinePerl
syntax match  txDelim   +%%+ contained
syntax match  txComment +#[^;]*+ contained
highlight link txKeyword Function
highlight link txBuildin Function
highlight link txDelim   Special
highlight link txComment Comment

let b:current_syntax = 'XslateMeta'
