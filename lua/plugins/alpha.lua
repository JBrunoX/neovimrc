return {
  'goolord/alpha-nvim',
  dependencies = { 'echasnovski/mini.icons' },
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    ------------
    -- Colors --
    ------------
    vim.api.nvim_set_hl(0, "mutedBlue", { fg = "#9dc4cf"})
    vim.api.nvim_set_hl(0, "antiqueWhite", { fg = "#f4f0e8"})
    vim.api.nvim_set_hl(0, "gruvYellow", { fg = "#fabd2f"})
    vim.api.nvim_set_hl(0, "charcolBlack", { fg = "#444545"})
    vim.api.nvim_set_hl(0, "quietGreen", {fg = "#89b482"})
    vim.api.nvim_set_hl(0, "neutralGray", {fg = "#a9a9a9"})

    ------------
    -- Header --
    ------------
    dashboard.section.header.val = {
    " ███╗   ██╗███████╗ ██████╗ ███████╗ ██████╗ ██████╗  ██████╗  ███████╗  ",
    " ████╗  ██║██╔════╝██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔═══██╗ ██╔════╝ ",
    " ██╔██╗ ██║█████╗  ██║   ██║█████╗  ██║   ██║██████╔╝██║       █████╗   ",
    " ██║╚██╗██║██╔══╝  ██║   ██║██╔══╝  ██║   ██║██╔══██╗██║  ████╗██╔══╝   ",
    " ██║ ╚████║███████╗╚██████╔╝██║     ╚██████╔╝██║  ██║╚██████╔╝ ███████╗ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚══════╝ ",
    }
    dashboard.section.header.opts.hl = "mutedBlue"

    -------------
    -- Buttons --
    -------------
    dashboard.section.buttons.val = {
      dashboard.button( "n", "  New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "f", "󰱼  Find file", ":cd $HOME/ | Telescope find_files<CR>"),
      dashboard.button( "r", "  Recent"   , ":Telescope oldfiles<CR>"),
      dashboard.button( "c", "  Config" , ":e ~/.config/nvim <CR>"),
      dashboard.button( "q", "  Quit NVIM", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "antiqueWhite"
      button.opts.hl_shortcut = "gruvYellow"
    end

    ------------
    -- Footer --
    ------------

    -- Quote wrap helper
    local function wrap(text, max_width)
      local lines = {}
      local quote_text, author = text:match("^(.-)%s*%-[%s]*(.+)$")

      if not quote_text then
        quote_text = text
        author = nil
      end
    -- word-safe wrap
      local line = ""
      local max_line_length = 0
      for word in quote_text:gmatch("%S+") do
        if #line + #word + 1 > max_width then
          table.insert(lines, line)
          max_line_length = math.max(max_line_length, #line)
          line = word
        else
          if line == "" then
            line = word
          else
            line = line .. " " .. word
          end
        end
      end
      if line ~= "" then
        table.insert(lines, line)
        max_line_length = math.max(max_line_length, #line)
      end
      -- right-align author relative to longest quote line
      if author then
        local author_line = string.rep(" ", math.max(0, max_line_length - #author - 2)) .. "- " .. author
        table.insert(lines, author_line)
      end

      return lines
    end

    -- Fetch quotes file
    package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/quotes/?.lua"
    local quotes = require("quotes")

    -- Randomize quote
    math.randomseed(os.time())
    local quote = quotes[math.random(#quotes)]

    -- Wrap quote to 60 chars per line
    dashboard.section.footer.val = wrap(quote, 60)
    dashboard.section.footer.opts.hl = "quietGreen"

    -- Output dashboard
    alpha.setup(dashboard.opts)
  end
}
