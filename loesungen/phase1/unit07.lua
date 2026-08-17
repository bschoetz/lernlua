-- Quest 7.1: Diamanten sammeln
local diamanten = 0

while diamanten < 5 do
  print("Diamant gefunden? (j/n)")
  local antwort = io.read()
  if antwort == "j" then
    diamanten = diamanten + 1   -- Stapel raus, eins drauf, Stapel zurück
    print("Du hast jetzt " .. diamanten .. " Diamanten.")
  else
    print("Weitersuchen!")
  end
end

print("Genug für eine Diamant-Spitzhacke!")

-- Bonus-Quest: Das Weizen-Wunder
print("")
local weizen = 1
local ernten = 0

while weizen < 100 do
  weizen = weizen * 2
  ernten = ernten + 1
  print("Ernte " .. ernten .. ": Du hast jetzt " .. weizen .. " Weizen.")
end

print("Nach nur " .. ernten .. " Ernten hast Du über 100 Weizen!")
