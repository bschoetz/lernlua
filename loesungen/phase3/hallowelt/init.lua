-- ===== Unit 22: Log-Meldungen =====
core.log("action", "[hallowelt] Hallo aus meiner ersten Mod!")
core.log("action", "[hallowelt] Und noch eine zweite Meldung!")

-- ===== Units 23 + 24: Begrüßung mit Zähler =====
local begruessungen = 0

core.register_on_joinplayer(function(player)
  begruessungen = begruessungen + 1
  local name = player:get_player_name()
  -- Unit-23-Bonus: nur der beitretende Spieler sieht die Nachricht
  core.chat_send_player(name, "👋 Willkommen, " .. name .. "! (Beitritt Nr. " .. begruessungen .. ")")
end)

-- ===== Unit 25: Chat-Befehle =====
core.register_chatcommand("gruss", {
  description = "Begrüßt Dich persönlich",
  func = function(name, param)
    return true, "Hallo " .. name .. ", schön, dass Du da bist!"
  end,
})

-- Unit-25-Bonus: /zeit
core.register_chatcommand("zeit", {
  description = "Zeigt die Tageszeit im Spiel",
  func = function(name, param)
    local zeit = core.get_timeofday()  -- 0 = Mitternacht, 0.5 = Mittag
    local stunden = math.floor(zeit * 24)
    local minuten = math.floor((zeit * 24 - stunden) * 60)
    return true, string.format("🕐 Es ist %02d:%02d Uhr im Spiel.", stunden, minuten)
  end,
})

-- ===== Unit 26: Zufalls-Befehle =====
core.register_chatcommand("wuerfel", {
  description = "Würfelt eine Zahl (Standard: 1-6)",
  func = function(name, param)
    local seiten = tonumber(param) or 6
    local ergebnis = math.random(1, seiten)
    return true, "🎲 " .. name .. " würfelt: " .. ergebnis
  end,
})

-- Unit-26-Bonus: /muenze
core.register_chatcommand("muenze", {
  description = "Wirft eine Münze",
  func = function(name, param)
    if math.random(1, 2) == 1 then
      return true, "🪙 Kopf"
    else
      return true, "🪙 Zahl"
    end
  end,
})
