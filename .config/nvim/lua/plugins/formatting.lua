return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- indent shell scripts with 2 spaces
      formatters_by_ft = {
        sh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci", "-sr" }, 
        },
      },
    },
  },
}
