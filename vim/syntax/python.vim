syn keyword pythonSelf self
highlight def link pythonSelf Special
syn match pythonArgs  /[^(, =+]\+=/
hi pythonArgs       ctermfg=3
