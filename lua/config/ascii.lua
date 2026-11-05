-- lua/config/ascii.lua
-- A collection of ASCII art banners.
-- Used by the dashboard header (random pick) and the :AsciiArt command.

local M = {}

M.list = {
  {
    name = 'neovim',
    art = [==[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]==],
  },
  {
    name = 'n-logo',
    art = [==[
 ██████╗ 
 ██╔══██╗
 ██████╔╝
 ██╔══██╗
 ██║  ██║
 ╚═╝  ╚═╝
    ]==],
  },
  {
    name = 'cat',
    art = [==[
   |\      _,,,---,,_
   /,`.-'`'    -.  ;-;;,'
  |,4-  ) )-,_..;\ (  `'-'
  '---''(_/--'  `-'\_)
    ]==],
  },
  {
    name = 'robot',
    art = [==[
      ┌───────┐
      │  ◕ ‿ ◕ │
      │   ___  │
      └───┬───┘
     ┌────┴────┐
     │  HELLO  │
     └─────────┘
    ]==],
  },
  {
    name = 'coffee',
    art = [==[
        )  (
       (   ) )
        ) ( (
      ..........
      |        |]
      \        /
       '------'
    ]==],
  },
  {
    name = 'lambda',
    art = [==[
        λ
       λ λ
      λ   λ
     λ λ λ λ
    λ   λ   λ
    ]==],
  },
}

--- Return the art lines of one entry (random by default).
---@param index? number: force a specific entry (1-based)
---@return string[] lines
function M.random(index)
  math.randomseed(os.time() + os.clock() * 1000)
  local entry = M.list[index or math.random(#M.list)]
  local lines = {}
  for line in entry.art:gmatch '[^\n]+' do
    lines[#lines + 1] = line
  end
  return lines
end

-- :AsciiArt — show a random ASCII art banner
vim.api.nvim_create_user_command('AsciiArt', function()
  vim.notify('\n' .. table.concat(M.random(), '\n'), vim.log.levels.INFO, { title = 'ASCII Art' })
end, { desc = 'Show a random ASCII art banner' })

return M
