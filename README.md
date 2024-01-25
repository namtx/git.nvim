## git.nvim

### Installation

#### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
require('lazy').setup {
  {
    'namtx/git.nvim',
    opts = {
      path = -- point to the directory that you want to store your solution
    }
  }
}
```

### Mappings

`<leader>gb` - Open commit of current line in external browser (via `open`)

### Options

### References
- https://www.reddit.com/r/vim/comments/i50pce/how_to_show_commit_that_introduced_current_line/

