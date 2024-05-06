return {
    {"jay-babu/mason-nvim-dap.nvim", config = function()
        require("mason-nvim-dap").setup({
            ensure_installed = { "stylua" },
            handlers = {},
        })
    end
},
{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}},


}

