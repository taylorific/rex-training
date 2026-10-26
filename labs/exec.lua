-- Run with: rex do exec.lua
-- Runs a command and returns part of its result as JSON.
local r = rex.exec({ "sw_vers", "-productVersion" })
return { ok = r.ok, out = r.stdout }
