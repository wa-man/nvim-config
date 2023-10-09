-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({ 
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd('colorscheme catppuccin-mocha')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
    use({
        'akinsho/bufferline.nvim',
        requires = {
            {'kyazdani42/nvim-web-devicons'},
        },
    })
    use({
        'nvim-lualine/lualine.nvim',
        require = {
            {'kyazdani42/nvim-web-devicons'},
        },
    })
    use {
        'utilyre/barbecue.nvim',
        requires = {
            'SmiteshP/nvim-navic',
        },
    }
    use('nvim-tree/nvim-tree.lua')
    use('petertriho/nvim-scrollbar')
    use('norcalli/nvim-colorizer.lua')
    use('goolord/alpha-nvim')
    use {
        'anuvyklack/windows.nvim',
        requires = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim',
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
end)
