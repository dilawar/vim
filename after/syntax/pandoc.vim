" from https://vi.stackexchange.com/a/9782/7610
syntax match texStatement '\\gls' nextgroup=texGlsCommand
syntax region texGlsCommand matchgroup=Delimiter start='{' end='}' contained contains=@NoSpell
