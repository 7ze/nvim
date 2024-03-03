local actions = require("telescope.actions")
local themes = require("telescope.themes")

require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.7,
				results_width = 0.5,
			},
			width = 0.7,
			height = 0.7,
		},
		file_ignore_patterns = { ".git/", "%.pdf", "%.ttf", "%.otf", "%.mkv", "%.mp4", "%.zip", "node_modules" },
		winblend = 10,
		set_env = { ["COLORTERM"] = "truecolor" },
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-h>"] = "which_key",
			},
			n = {
				["<C-c>"] = actions.close,
				["q"] = actions.close,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},
	},
})

require("telescope").load_extension("fzf")

local M = {}

M.current_buffer_fuzzy_find = function()
	require("telescope.builtin").current_buffer_fuzzy_find(themes.get_dropdown({
		layout_config = {
			width = 0.7,
			height = 0.6,
		},
		winblend = 10,
		previewer = false,
	}))
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files(themes.get_ivy({
		prompt_title = "< dotfiles />",
		cwd = "~/dots/",
		hidden = true,
	}))
end

M.search_nvim_config = function()
	require("telescope.builtin").find_files(themes.get_ivy({
		prompt_title = "< neovim config />",
		cwd = "~/.config/nvim/",
		hidden = true,
	}))
end

local function set_background(content)
	print(content)
	vim.fn.system("setbg " .. content)
end

local function select_background(prompt_bufnr, map)
	local function set_the_background(close)
		local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
		set_background(content.cwd .. "/" .. content.value)
		if close then
			require("telescope.actions").close(prompt_bufnr)
		end
	end

	map("i", "<C-p>", function()
		set_the_background()
	end)

	map("i", "<CR>", function()
		set_the_background(true)
	end)
end

local function image_selector(prompt, cwd)
	return function()
		require("telescope.builtin").find_files(themes.get_dropdown({
			previewer = false,
			prompt_title = prompt,
			cwd = cwd,
			attach_mappings = function(prompt_bufnr, map)
				print("Choose your wallie!!")
				select_background(prompt_bufnr, map)
				return true
			end,
		}))
	end
end

M.set_wallpaper = image_selector("< Choose your wallie /> ", "~/media/pix/wallpapers/")

return M
