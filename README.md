A simple plugin to use the [Tidal Cycles](https://tidalcycles.org/) live programming environment with kakoune.

So far, it offers the following functions:

- `:tidal-start-repl` opens up the tidal repl in a new pane. **do not forget to open kakoune inside tmux!**
- `:tidal-send-line` sends the current line to the repl
- `:tidal-send-block` sends the current block (paragraph) to the repl

`<c-e>` is bound to `:tidal-send-block`

# WARNINGS

A the moment the REPL is initiated with the `BootTidal.hs` file shipped with the plugin, not the one shipped with tidalcycles. The `tidal_plugin_path` should allow you to define the folder where to look for `BootTidal.hs`, but I haven't tested it.

the `BootTidal.hs` file has been slightly modified, I just added `:set +m` to activate GHCi's multiline mode. Couldn't find a way to specify it from the flags.
