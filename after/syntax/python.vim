" Python triple quotes as comments in certain contexts
syn region pythonComment
  \ start=+\%(:\n\s*\|\n\)\@<=\z('''\|"""\)+ end=+\z1+ keepend
  \ contains=pythonEscape,pythonTodo,@Spell
