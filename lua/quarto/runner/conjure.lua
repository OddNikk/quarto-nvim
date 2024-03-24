local concat = require('quarto.tools').concat

---Run the code cell with Conjure
---@param cell CodeCell
local function run(cell, _)
  local eval = require("conjure.eval")
  local client = require("conjure.client")
  local code = concat(cell.text)
  if code ~= nil then
    client["with-filetype"]("python", eval["eval-str"], {
      code = code,
      ["passive?"] = true,
    })
  end
end

---@class CodeRunner
local M = { run = run }

return M
