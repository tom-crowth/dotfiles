
call matchadd('Conceal', '\[x\]', 0, -1, {'conceal': '4'})
call matchadd('Conceal', '\\alpha\>', 0, -1, {'conceal': 'α'})

syntax match testgroup "\\beta\>" conceal cchar=3
syntax match testgroup "\\\gamma\>" conceal cchar=9
syntax match testgroup '\\gamma\>' conceal cchar=8
syntax match testgroup "testing_this" conceal cchar=3
