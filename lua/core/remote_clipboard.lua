-- Over SSH, send yanks to the local clipboard via OSC 52
-- Paste reads Neovims own registers (not system clipboad) since OSC 52 paste queries tend to hang
if vim.env.SSH_TTY then
	local osc52 = require("vim.ui.clipboard.osc52")
	local function reg()
		return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
	end
	vim.g.clipboard = {
		name = "OSC52-copy-only",
		copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
		paste = { ["+"] = reg, ["*"] = reg },
	}
end
