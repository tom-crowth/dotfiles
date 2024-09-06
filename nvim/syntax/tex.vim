
call matchadd('Conceal', '\[x\]', 0, -1, {'conceal': '4'})
call matchadd('Conceal', '\\alpha\>', 0, -1, {'conceal': 'α'})

syntax match Conceal "\\beta" contained conceal cchar=3
