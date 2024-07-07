testing
C:\USERS\%USERPROFILE%\APPDATA\LOCAL\NVIM
└───lua
    ├───config
    ├───core
    ├───custom
    ├───plugins
    └───remaps

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh",       builtin.help_tags,     { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk",       builtin.keymaps,       { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf",       builtin.find_files,    { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss",       builtin.builtin,       { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw",       builtin.grep_string,   { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg",       builtin.live_grep,     { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd",       builtin.diagnostics,   { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr",       builtin.resume,        { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.",       builtin.oldfiles,      { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers,       { desc = "[ ] Find existing buffers" })


               vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>d", dap.continue, {})

nvim/
│
├── lua/
│   │
│   ├── config/
│   │   ├── cmp
│   │   ├── colorscheme
│   │   ├── dashboard
│   │   ├── luasnip
│   │   ├── null-ls
│   │   ├── nvim_tree
│   │   └── path
│   │
│   ├── core/
│   │   ├── lazy
│   │   └── mason
│   │
│   ├── custom/
│   │   ├── Explorer
│   │   ├── buffer
│   │   └── show_path
│   │
│   ├── plugins/
│   │   ├── alpha_dashboard
│   │   ├── autocompletion
│   │   ├── cloak
│   │   ├── fugitive
│   │   ├── init
│   │   ├── lspconfig
│   │   ├── neotest
│   │   ├── nvim_cmp
│   │   ├── nvim_tree
│   │   ├── other
│   │   ├── snippets
│   │   ├── telescope
│   │   ├── terminal
│   │   ├── treesitter
│   │   ├── trouble
│   │   └── vimbegood
│   │
│   └── remaps/
│       ├── init
│       ├── plugins
│       └── remap
│
├── Readme.text
├── init
├── kickstart
├── lazy-lock.json
├── mvim
├── recyclebin
├── test
└── uniqueconfig

	"tpope/vim-fugitive",           event = "verylazy",

	"goolord/alpha-nvim",           lazy = false,                priority = 1000,

	"laytan/cloak.nvim",            event = "verylazy",


     {'Mofiqul/dracula.nvim'},
	{"EdenEast/nightfox.nvim"},
	{ "nvim-neotest/nvim-nio" },
	{'feline-nvim/feline.nvim'},
	{ 'lewis6991/gitsigns.nvim'},
	
	"mfussenegger/nvim-dap",        event = "verylazy",
	"jay-babu/mason-nvim-dap.nvim", event = "VeryLazy",
	"rcarriga/nvim-dap-ui",         event = "verylazy",


		
	"hrsh7th/nvim-cmp",             event = "InsertEnter",


	"L3MON4D3/LuaSnip",             event = "verylazy",
	

	"nvim-telescope/telescope.nvim", event = "VimEnter",

     "CRAG666/betterTerm.nvim",

     "nvim-treesitter/nvim-treesitter",
 
	"folke/trouble.nvim",


	"theprimeagen/vim-be-good",      event = "verylazy",




		{ "goolord/alpha-nvim", lazy = false, priority = 1000 },

    -- Git integration, load lazily when Neovim is idle
    { "tpope/vim-fugitive", event = "VeryLazy" },
    { "lewis6991/gitsigns.nvim", event = "BufReadPre" -- Load before reading buffers },

    -- Debugging tools, load lazily when Neovim is idle
    { "mfussenegger/nvim-dap", event = "VeryLazy" },
    { "jay-babu/mason-nvim-dap.nvim", event = "VeryLazy" },
    { "rcarriga/nvim-dap-ui", event = "VeryLazy" },

    -- Cloak sensitive information, load lazily
    { "laytan/cloak.nvim", event = "VeryLazy" },

    -- Load `nvim-cmp` for autocompletion upon entering insert mode
    { "hrsh7th/nvim-cmp", event = "InsertEnter" },

    -- LuaSnip for snippet management, load lazily
    { "L3MON4D3/LuaSnip", event = "VeryLazy" },

    -- Telescope fuzzy finder, load on specific commands or keys
    { "nvim-telescope/telescope.nvim", cmd = "Telescope" -- Load when the `Telescope` command is used },

    -- Themes and aesthetics
    { "Mofiqul/dracula.nvim", lazy = true -- Load lazily to avoid conflict },
    { "EdenEast/nightfox.nvim", lazy = true -- Load lazily to avoid conflict },
    { "feline-nvim/feline.nvim", lazy = true -- Load lazily, configure on use },

    -- Neotest for testing, default lazy load
    { "nvim-neotest/nvim-nio", lazy = true },

    -- Better terminal integration
    { "CRAG666/betterTerm.nvim", lazy = true -- Load lazily, configure when needed },

    -- Treesitter for syntax highlighting, load based on file types
    { "nvim-treesitter/nvim-treesitter", event = {"BufReadPre", "BufNewFile"}, -- Load for specific file events run = ":TSUpdate" },

    -- Trouble plugin for diagnostics
    { "folke/trouble.nvim", lazy = true, -- Load lazily, configure when needed cmd = "TroubleToggle" -- Load when the `TroubleToggle` command is used },

    -- Fun plugin, load very lazily
    { "theprimeagen/vim-be-good", event = "VeryLazy" }
