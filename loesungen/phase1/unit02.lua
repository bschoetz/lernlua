-- Quest 2.1: Charakter-Steckbrief
-- (local kommt erst in Unit 3 dran - hier noch ohne)
name = "Alex"
level = 42
welt = "Overworld"
werkzeug = "Netherit-Spitzhacke"

print("=== SPIELER-STECKBRIEF ===")
print("Name: " .. name)
print("Level: " .. level)
print("Welt: " .. welt)
print("Werkzeug: " .. werkzeug)

-- Bonus-Quest: Variable ändern
herzen = 10
print("Herzen: " .. herzen)   -- 10
herzen = 5
print("Herzen: " .. herzen)   -- 5 - der Slot-Inhalt wurde ausgetauscht
