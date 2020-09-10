define-command tidal-start-repl %{
    eval "repl ghci -ghci-script /usr/share/x86_64-linux-ghc-8.10.2/tidal-1.6.1/BootTidal.hs"
}

hook global WinCreate .*\.tidal %{
    set-option window filetype haskell
}
