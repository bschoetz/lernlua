-- ===============================
--  MAGIE-MOD (Units 39 + 40 komplett)
-- ===============================
-- Texturen musst Du selbst malen — siehe textures/LIESMICH.md

-- -----------------------
--  1. MAGISCHES ERZ
-- -----------------------
core.register_node("magie:erz", {
  description = "Magisches Erz",
  tiles = {"magie_erz.png"},
  groups = {cracky = 2},
  drop = "magie:staub 2",
  sounds = mcl_sounds.node_sound_stone_defaults(),
})

-- -----------------------
--  2. MAGIE-STAUB (Item)
-- -----------------------
core.register_craftitem("magie:staub", {
  description = "Magie-Staub",
  inventory_image = "magie_staub.png",
})

-- -----------------------
--  3. MAGIE-KRISTALL (leuchtender Block)
-- -----------------------
core.register_node("magie:kristall", {
  description = "Magie-Kristall",
  tiles = {"magie_kristall.png"},
  groups = {cracky = 2},
  light_source = 12,
  use_texture_alpha = "blend",
  drawtype = "glasslike",
  sunlight_propagates = true,
  sounds = mcl_sounds.node_sound_glass_defaults(),
})

-- -----------------------
--  4. ZAUBERSTAB (Unit-40-Version mit Funken und Statistik)
-- -----------------------
local zauber_zaehler = {}

core.register_craftitem("magie:zauberstab", {
  description = "Zauberstab",
  inventory_image = "magie_zauberstab.png",
  stack_max = 1,

  on_use = function(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    local dir = user:get_look_dir()
    local name = user:get_player_name()

    zauber_zaehler[name] = (zauber_zaehler[name] or 0) + 1

    core.add_particlespawner({
      amount = 80,
      time = 0.3,
      minpos = {x = pos.x, y = pos.y + 1.5, z = pos.z},
      maxpos = {x = pos.x, y = pos.y + 1.5, z = pos.z},
      minvel = {x = dir.x * 5 - 1, y = dir.y * 5 - 1, z = dir.z * 5 - 1},
      maxvel = {x = dir.x * 5 + 1, y = dir.y * 5 + 1, z = dir.z * 5 + 1},
      minexptime = 0.5,
      maxexptime = 1.5,
      minsize = 1,
      maxsize = 3,
      texture = "magie_staub.png",
      glow = 14,
    })

    return itemstack
  end,
})

-- -----------------------
--  5. CRAFTING-REZEPTE
-- -----------------------

-- Kristall: 4 Staub im Quadrat
core.register_craft({
  output = "magie:kristall",
  recipe = {
    {"magie:staub", "magie:staub"},
    {"magie:staub", "magie:staub"},
  },
})

-- Zauberstab: Kristall oben, Stock unten
core.register_craft({
  output = "magie:zauberstab",
  recipe = {
    {"magie:kristall"},
    {"mcl_core:stick"},
  },
})

-- Erz künstlich herstellen (Spaß-Rezept)
core.register_craft({
  output = "magie:erz",
  recipe = {
    {"magie:staub", "magie:staub",    "magie:staub"},
    {"magie:staub", "mcl_core:stone", "magie:staub"},
    {"magie:staub", "magie:staub",    "magie:staub"},
  },
})

-- -----------------------
--  6. BEGRÜSSUNG
-- -----------------------
core.register_on_joinplayer(function(player)
  local name = player:get_player_name()
  core.chat_send_player(name,
    "✨ Willkommen, " .. name .. "! Diese Welt enthält die Magie-Mod. " ..
    "Tippe /magie für Infos.")
end)

-- -----------------------
--  7. CHAT-BEFEHL /magie
-- -----------------------
core.register_chatcommand("magie", {
  description = "Zeigt Magie-Statistik",
  func = function(name, param)
    local zaubert = zauber_zaehler[name] or 0
    return true,
      "=== MAGIE-MOD ===\n" ..
      "Spieler: " .. name .. "\n" ..
      "Zauberstab-Nutzungen: " .. zaubert .. "\n" ..
      "Items: magie:erz, magie:staub, magie:kristall, magie:zauberstab"
  end,
})

core.log("action", "[magie] Magie-Mod geladen!")
