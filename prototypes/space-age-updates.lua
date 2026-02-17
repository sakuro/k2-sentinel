if not mods["space-age"] then return end

local sentinel = data.raw["radar"]["kr-sentinel"]

sentinel.heating_energy = "40kW"

sentinel.frozen_patch = {
  filename = "__k2-sentinel__/graphics/buildings/sentinel/sentinel-frozen.png",
  width = 128,
  height = 128,
  shift = { 0.21, -0.2 },
  scale = 0.35,
  direction_count = 1,
}

sentinel.reset_orientation_when_frozen = true
