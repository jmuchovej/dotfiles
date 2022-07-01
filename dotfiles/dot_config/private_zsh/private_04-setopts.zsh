#!/usr/bin/env zsh
#: http://zsh.sourceforge.net/Doc/Release/Options.html
#: setopt - mostly for non-zsh systems

setopt autocd               #: cd by typing dir name, if it\'s not a cmd
setopt autolist             #: auto-list choices on ambiguous completion
setopt automenu             #: auto use menu completion
setopt always_to_end        #: move cursor to end if word as one match
setopt hist_ignore_all_dups #: remove older duplicate entries from hist
setopt hist_reduce_blanks   #: remove blanks from hist
setopt inc_append_history   #: save hist entries as soon as they're entered
setopt share_history        #: share hist between diff instances
setopt correct_all          #: autocorrect cmds
setopt interactive_comments #: allow commends in interactive shells
setopt completeinword
