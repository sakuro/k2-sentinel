data:extend({
  {
    type = "technology",
    name = "kr-sentinel",
    icon = "__k2-sentinel__/graphics/technologies/sentinel.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 100,
      ingredients = {
        { "automation-science-pack", 1 },
      },
    },
    prerequisites = { "lamp" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-sentinel" },
    },
  },
})

data.raw.technology["radar"].prerequisites = { "chemical-science-pack", "kr-sentinel" }
data.raw.technology["radar"].unit = {
  time = 30,
  count = 200,
  ingredients = {
    { "automation-science-pack", 1 },
    { "logistic-science-pack", 1 },
    { "chemical-science-pack", 1 },
  },
}
