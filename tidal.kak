provide-module tidal %{

  define-command -docstring "tidal-start: starts tidal repl using the BootTidal.hs file as the boot script" tidal-start %{
    tmux-repl-vertical ghci -ghci-script BootTidal.hs
    tmux-focus
  }

  define-command -docstring "tidal-send-line: send the current line to tidal" tidal-send-line %{
    execute-keys x
    send-text
  }

  define-command -docstring "tidal-send-block: sends the current paragraph to the tidal" tidal-send-block %{
    execute-keys <a-i>p
    nop %sh{
      tmux set-buffer -b kak_selection ":{
${kak_selection}
:}
"
    	tmux paste-buffer -b kak_selection -t "$kak_opt_tmux_repl_id"
    }
  }

  define-command -docstring "tidal-send-hush: sends the hush command to the REPL" tidal-hush %{
    send-text "hush
"
  }
}

hook global WinCreate .*\.tidal %{
  set-option window filetype haskell
  require-module tidal
}
