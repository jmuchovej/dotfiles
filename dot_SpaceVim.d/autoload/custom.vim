func! custom#before() abort
  " Automatically run `chezmoi apply` when editing source files...
  "   https://www.chezmoi.io/user-guide/tools/editor/#configure-vim-to-run-chezmoi-apply-whenever-you-save-a-dotfile
  " autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
endf

func! custom#after() abort
endf
