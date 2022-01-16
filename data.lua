local data_util = {}
data_util.mod_prefix = "se-"

local arcosphere_variants = {
  { number = 1, letter = "a", sign = "l", character = "λ", name = "lambda"},
  { number = 2, letter = "b", sign = "x", character = "ξ", name = "xi"},
  { number = 3, letter = "c", sign = "z", character = "ζ", name = "zeta"},
  { number = 4, letter = "d", sign = "t", character = "θ", name = "theta"},
  { number = 5, letter = "e", sign = "e", character = "ε", name = "epsilon"},
  { number = 6, letter = "f", sign = "f", character = "φ", name = "phi"},
  { number = 7, letter = "g", sign = "g", character = "γ", name = "gamma"},
  { number = 8, letter = "h", sign = "o", character = "ω", name = "omega"},
}

local function make_recipe(name, from_high, to_high, to_low)

  local a = data.raw.item[data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[from_high].letter]
  -- local b = data.raw.item[data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[from_low].letter]
  local c = data.raw.item[data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[to_high].letter]
  local d = data.raw.item[data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[to_low].letter]
  data:extend({
    {
      type = "recipe",
      name = name,
      category = "arcosphere",
      subgroup = "arcosphere",
      results = {
        { data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[to_high].letter, 1 },
        { data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[to_low].letter, 0 },
      },
      enabled = false,
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[from_high].letter, 1 },
      },
      requester_paste_multiplier = 1,
      always_show_products = true,
      allow_decomposition = false,
      always_show_made_in = true,
      icons = {
        { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, shift = {0, 0}, icon_size = 64 }, -- to lock scale
        { icon = a.icon, scale = 0.33, shift = {-4, -16}, icon_size = 64 },
        { icon = c.icon, scale = 0.33, shift = {-16, 16}, icon_size = 64 },
        { icon = d.icon, scale = 0.33, shift = {4, 16}, icon_size = 64 },
        { icon = "__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale = 1, shift = {0, 0}, icon_size = 64 }, -- to overlay
      },
      localised_name = {"recipe-name.se-arcosphere-easy-folding",
        arcosphere_variants[from_high].character,
        arcosphere_variants[to_high].character,
        arcosphere_variants[to_low].character}
    }
  })
  data:extend({
    {
      type = "recipe",
      name = name.."-alt",
      category = "arcosphere",
      subgroup = "arcosphere",
      results = {
        { data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[to_high].letter, 0 },
        { data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[to_low].letter, 1 },
      },
      enabled = false,
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "arcosphere-"..arcosphere_variants[from_high].letter, 1 },
      },
      requester_paste_multiplier = 1,
      always_show_products = true,
      allow_decomposition = false,
      always_show_made_in = true,
      icons = {
        { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, shift = {0, 0}, icon_size = 64 }, -- to lock scale
        { icon = a.icon, scale = 0.33, shift = {0, -16}, icon_size = 64 },
        { icon = c.icon, scale = 0.33, shift = {-16, 16}, icon_size = 64 },
        { icon = d.icon, scale = 0.33, shift = {4, 16}, icon_size = 64 },
        { icon = "__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale = 1, shift = {0, 0}, icon_size = 64 }, -- to overlay
      },
      localised_name = {"recipe-name.se-arcosphere-easy-folding",
        arcosphere_variants[from_high].character,
        arcosphere_variants[to_high].character,
        arcosphere_variants[to_low].character}
    }
  })
end
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-a", 1, 2, 4)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-b", 2, 3, 1)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-c", 3, 4, 6)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-d", 4, 5, 3)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-e", 5, 6, 8)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-f", 6, 7, 5)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-g", 7, 8, 2)
make_recipe(data_util.mod_prefix .. "arcosphere-fold-easy-h", 8, 1, 7)


data:extend({
  {
    type = "technology",
    name = data_util.mod_prefix .. "arcosphere-easy-folding",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-a", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-a-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-b", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-b-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-c", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-c-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-d", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-d-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-e", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-e-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-f", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-f-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-g", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-g-alt", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-h", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "arcosphere-fold-easy-h-alt", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/arcosphere.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "arcosphere-folding",
    },
    unit = {
     count = "500",
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
     }
    },
  }
})

function recipe_require_tech(recipe_name, tech_name)
  if data.raw.recipe[recipe_name] and data.raw.technology[tech_name] then
    -- data_util.disable_recipe(recipe_name)
    -- for _, tech in pairs(data.raw.technology) do
    --     if tech.effects then
    --         data_util.remove_recipe_from_effects(tech.effects, recipe_name)
    --     end
    -- end
    local already = false
    data.raw.technology[tech_name].effects = data.raw.technology[tech_name].effects or {}
    for _, effect in pairs(data.raw.technology[tech_name].effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
        already = true
        break
      end
    end
    if not already then
      table.insert(data.raw.technology[tech_name].effects, { type = "unlock-recipe", recipe = recipe_name})
    end
  end
end