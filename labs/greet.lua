-- Run with: rex do greet.lua name=rex
return "hello " .. (rex.args.name or "world")
