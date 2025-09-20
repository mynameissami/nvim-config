local options = {
  view = {
    side = "right", -- 👈 THIS moves the tree to the right
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = { git = true, folder = true, file = true, folder_arrow = true },
    },
  },
  git = {
    enable = true,
  },
  filters = {
    dotfiles = false,
  },  
}

return options
