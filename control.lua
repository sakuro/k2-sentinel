local freeplay_interface = "freeplay"

script.on_init(function()
  if not remote.interfaces[freeplay_interface] then return end

  local ship = remote.call(freeplay_interface, "get_ship_items")
  ship["kr-sentinel"] = 2
  remote.call(freeplay_interface, "set_ship_items", ship)

  local debris = remote.call(freeplay_interface, "get_debris_items")
  debris["kr-sentinel"] = 2
  remote.call(freeplay_interface, "set_debris_items", debris)
end)
