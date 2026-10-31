-- Run with: rex do htop.lua (needs htop: brew install htop)
-- Opens htop in a new window.
rex.session.new_window{
  layout = rex.layout.block{
    flavor  = "com.superlogical.terminal.shell",
    options = { command = { "htop" } },
  },
}
