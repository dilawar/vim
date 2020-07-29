" from https://vi.stackexchange.com/a/9782/7610
syntax match texStatement '\\command' nextgroup=texMyCommand
syntax region texMyCommand matchgroup=Delimiter start='{' end='}' contained contains=@NoSpell
