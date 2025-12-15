return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local jdtls = require("jdtls")

        local root_file = vim.fs.find({
          "conf/application.conf",
          "project/plugins.sbt",
        }, { upward = true })[1]

        if not root_file then
          return
        end

        local root_dir = vim.fs.dirname(root_file)
        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/" .. project_name

        jdtls.start_or_attach({
          cmd = { "jdtls", "-data", workspace_dir },
          root_dir = root_dir,
        })
      end,
    })
  end,
}
