A simple plugin to use the [Tidal Cycles](https://tidalcycles.org/) live programming environment with kakoune.

**do not forget to open kakoune inside tmux!**

So far, it offers the following functions:

- `:tidal-start-repl` opens up the tidal repl in a new pane.
- `:tidal-start-superdirt` launches supercollider and superdirt in a new window
- `:tidal-send-line` sends the current line to the repl
- `:tidal-send-block` sends the current block (paragraph) to the repl
- `:tidal-hush` sends the hush command to the repl

You could bind those commands to keys such as :

```
map global normal <c-e> ':tidal-send-block<ret>'
map global normal <c-h> ':tidal-hush<ret>'
```

# WARNINGS

**At the moment this is barely usable **- it looks like GHCi is not the easiest REPL to interact with. For example, if your code has tab indent, it will trigger GHCi's completion, even if you are in the middle of a multiline input. Crazy.

A the moment the REPL is initiated with the `BootTidal.hs` file shipped with the plugin, not the one shipped with tidalcycles. The `tidal_plugin_path` should allow you to define the folder where to look for `BootTidal.hs`, but I haven't tested it.

