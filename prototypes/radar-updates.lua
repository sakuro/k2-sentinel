data.raw.radar["radar"].max_health = 300
data.raw.radar["radar"].energy_usage = "1MW"
data.raw.radar["radar"].max_distance_of_nearby_sector_revealed = 5
data.raw.radar["radar"].max_distance_of_sector_revealed = 16
data.raw.radar["radar"].energy_per_sector = "2MJ"

data.raw.recipe["radar"].ingredients = {
  { type = "item", name = "kr-sentinel", amount = 1 },
  { type = "item", name = "electronic-circuit", amount = 3 },
  { type = "item", name = "iron-gear-wheel", amount = 5 },
  { type = "item", name = "iron-plate", amount = 5 },
}
data.raw.recipe["radar"].enabled = false
