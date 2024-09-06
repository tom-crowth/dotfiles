call matchadd('Conceal', '\[x\]', 0, -1, {'conceal': '4'})
syntax match customConceals "\\_" conceal cchar=_
highlight default link customConceals Normal

set conceallevel=2
