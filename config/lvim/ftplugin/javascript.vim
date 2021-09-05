" Disable spell checking in strings
" https://stackoverflow.com/questions/60594419/remove-spell-from-a-syntax-cluster
syntax cluster jsString remove=@Spell
syntax cluster jsTemplateString remove=@Spell
syntax cluster jsObjectKeyString remove=@Spell
syntax cluster jsObjectStringKey remove=@Spell
