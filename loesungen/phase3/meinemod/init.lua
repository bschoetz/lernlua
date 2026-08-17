-- Lösungen für Phase 3, Units 27-38.
-- Hinweis: Die Texturen (PNG-Dateien in textures/) musst Du selbst malen!
-- Ohne sie sind die Blöcke pink-schwarz — funktionieren aber trotzdem.

-- ===== Unit 27: Eigene Blöcke =====
core.register_node("meinemod:wunderblock", {
  description = "Wunderblock",
  tiles = {"meinemod_wunderblock.png"},
  groups = {cracky = 2},
  sounds = mcl_sounds.node_sound_stone_defaults(),
})

-- ===== Unit 29: Leuchtender Block =====
core.register_node("meinemod:leuchtstein", {
  description = "Leuchtstein",
  tiles = {"meinemod_leuchtstein.png"},
  groups = {cracky = 2},
  light_source = 14,
  sounds = mcl_sounds.node_sound_glass_defaults(),
})

-- Unit-29-Bonus: Sprungkristall (leuchtet, nicht solide, wie Glas)
core.register_node("meinemod:sprungkristall", {
  description = "Sprungkristall",
  tiles = {"meinemod_sprungkristall.png"},
  groups = {cracky = 3},
  light_source = 10,
  walkable = false,
  drawtype = "glasslike",
  sunlight_propagates = true,
  sounds = mcl_sounds.node_sound_glass_defaults(),
})

-- ===== Unit 30: Groups und Drops =====
core.register_node("meinemod:erz", {
  description = "Magisches Erz",
  tiles = {"meinemod_erz.png"},
  groups = {cracky = 2},
  drop = "meinemod:staub 3",
  sounds = mcl_sounds.node_sound_stone_defaults(),
})

-- ===== Unit 31: Craftitems =====
core.register_craftitem("meinemod:staub", {
  description = "Zauberstaub",
  inventory_image = "meinemod_staub.png",
})

core.register_craftitem("meinemod:trank", {
  description = "Magischer Trank",
  inventory_image = "meinemod_trank.png",
  on_use = core.item_eat(10),
})

-- Unit-31-Bonus: Schwacher Trank
core.register_craftitem("meinemod:trank_schwach", {
  description = "Schwacher Trank",
  inventory_image = "meinemod_trank_schwach.png",
  on_use = core.item_eat(4),
})

-- ===== Unit 32: on_use =====
core.register_craftitem("meinemod:teleportstab", {
  description = "Teleportstab",
  inventory_image = "meinemod_teleportstab.png",
  on_use = function(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    pos.y = pos.y + 10
    user:set_pos(pos)
    return itemstack
  end,
})

core.register_craftitem("meinemod:feuerwerk", {
  description = "Mini-Feuerwerk",
  inventory_image = "meinemod_feuerwerk.png",
  on_use = function(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    core.add_particlespawner({
      amount = 50,
      time = 1,
      minpos = {x = pos.x - 1, y = pos.y, z = pos.z - 1},
      maxpos = {x = pos.x + 1, y = pos.y + 3, z = pos.z + 1},
      minvel = {x = -1, y = 2, z = -1},
      maxvel = {x = 1, y = 4, z = 1},
      minexptime = 1,
      maxexptime = 2,
      minsize = 2,
      maxsize = 4,
      texture = "meinemod_staub.png",
    })
    return itemstack
  end,
})

-- ===== Unit 33: Geformtes Rezept (Trank: 1 Apfel + 4 Diamanten) =====
core.register_craft({
  output = "meinemod:trank",
  recipe = {
    {"",                 "mcl_core:diamond", ""},
    {"mcl_core:diamond", "mcl_core:apple",   "mcl_core:diamond"},
    {"",                 "mcl_core:diamond", ""},
  },
})

-- Unit-33-Bonus: 9 Diamanten -> 1 Diamantblock
core.register_craft({
  output = "mcl_core:diamondblock",
  recipe = {
    {"mcl_core:diamond", "mcl_core:diamond", "mcl_core:diamond"},
    {"mcl_core:diamond", "mcl_core:diamond", "mcl_core:diamond"},
    {"mcl_core:diamond", "mcl_core:diamond", "mcl_core:diamond"},
  },
})

-- ===== Unit 34: Ungeformtes Rezept =====
core.register_craft({
  type = "shapeless",
  output = "meinemod:staub 4",
  recipe = {"mcl_dye:purple", "mcl_core:sugar", "mcl_dye:blue"},
})

-- ===== Unit 35: Spieler-Callbacks (Tod-Zähler) =====
local tode = {}

core.register_on_dieplayer(function(player)
  local name = player:get_player_name()
  tode[name] = (tode[name] or 0) + 1
  core.chat_send_all("💀 " .. name .. " ist zum " .. tode[name] .. ". Mal gestorben!")
end)

-- Unit-35-Bonus: /tode
core.register_chatcommand("tode", {
  description = "Zeigt die Tod-Statistik aller Spieler",
  func = function(name, param)
    local zeilen = {"=== TOD-STATISTIK ==="}
    for spieler, anzahl in pairs(tode) do
      table.insert(zeilen, spieler .. ": " .. anzahl)
    end
    if #zeilen == 1 then
      table.insert(zeilen, "Noch niemand gestorben. 🎉")
    end
    return true, table.concat(zeilen, "\n")
  end,
})

-- ===== Unit 36: Block-Callbacks =====
core.register_on_dignode(function(pos, oldnode, digger)
  if oldnode.name == "mcl_core:diamond_ore" and digger and digger:is_player() then
    local name = digger:get_player_name()
    core.chat_send_player(name, "💎 Glückwunsch, ein Diamant!")
  end
end)

-- Unit-36-Bonus: TNT-Warnung an alle anderen
core.register_on_placenode(function(pos, newnode, placer)
  if newnode.name == "mcl_tnt:tnt" and placer and placer:is_player() then
    local platzierer = placer:get_player_name()
    for _, spieler in ipairs(core.get_connected_players()) do
      local name = spieler:get_player_name()
      if name ~= platzierer then
        core.chat_send_player(name, "⚠️ " .. platzierer .. " hat TNT platziert!")
      end
    end
  end
end)

-- ===== Unit 37: ABM — Wunderblock funkelt =====
core.register_abm({
  label = "Wunderblock funkelt",
  nodenames = {"meinemod:wunderblock"},
  interval = 5,
  chance = 2,
  action = function(pos, node)
    core.add_particlespawner({
      amount = 10,
      time = 0.5,
      minpos = pos,
      maxpos = pos,
      minvel = {x = -0.5, y = 1, z = -0.5},
      maxvel = {x = 0.5, y = 2, z = 0.5},
      minexptime = 1,
      maxexptime = 2,
      texture = "meinemod_staub.png",
    })
  end,
})

-- ===== Unit 38 Bonus: /pos =====
core.register_chatcommand("pos", {
  description = "Zeigt Deine Position",
  func = function(name, param)
    local player = core.get_player_by_name(name)
    local pos = player:get_pos()
    return true, string.format("Position: X=%.1f, Y=%.1f, Z=%.1f", pos.x, pos.y, pos.z)
  end,
})

core.log("action", "[meinemod] Lösungs-Mod geladen!")
