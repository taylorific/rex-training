-- Sample config. Copy to ~/.config/rex/init.lua, then run:
--   rex config check
--   rex config reload

rex.bind("cmd+d", "pane.split", { direction = "right" })
rex.bind("shift+cmd+d", "pane.split", { direction = "down" })

rex.action{
  name  = "scratch",
  title = "Open Scratch Window",
  run   = function(ctx, args)
    rex.session.new_window{
      layout = rex.layout.block{
        flavor = "com.superlogical.terminal.shell",
      },
    }
  end,
}

rex.bind("shift+cmd+n", "scratch")
