define-command tidal-start-repl %{
    eval "repl ghci -ghci-script /usr/share/x86_64-linux-ghc-8.10.2/tidal-1.6.1/BootTidal.hs"
}

define-command tidal-send-line %{
    execute-keys x
    evaluate-commands send-text
}

hook global WinCreate .*\.tidal %{
    set-option window filetype haskell
}
