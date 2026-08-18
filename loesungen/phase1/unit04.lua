-- Quest 4.1: Der Begrüßungs-Bot
print("Wie heißt Du?")
local name = io.read()
print("Was ist Dein Lieblings-Mob?")
local mob = io.read()
print("Hallo " .. name .. ", " .. mob .. " sind auch meine Favoriten!")

-- Bonus-Quest: Der Interview-Bot
print("Wie heißt Dein Spieler?")
local spieler = io.read()
print("In welcher Welt bist Du unterwegs?")
local welt = io.read()
print("Was ist Dein Werkzeug?")
local werkzeug = io.read()

print("=== SPIELER-STECKBRIEF ===")
print("Name: " .. spieler)
print("Welt: " .. welt)
print("Werkzeug: " .. werkzeug)
