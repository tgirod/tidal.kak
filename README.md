A simple plugin to use the [Tidal Cycles](https://tidalcycles.org/) live programming environment with kakoune.

So far, it offers the following functions:

- `:tidal-start-repl` opens up the tidal repl in a new pane. **do not forget to open kakoune inside tmux!**
- `:tidal-send-line` sends the current line to the repl
- `:tidal-send-block` sends the current block (paragraph) to the repl

`<c-e>` is bound to `:tidal-send-block`
