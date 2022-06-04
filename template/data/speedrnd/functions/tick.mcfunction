## @Author Siandfrance


# if it did not start, put everyone in adventure mode
execute as @a if score $started srnd.global matches 0 run gamemode adventure @s

# if a player starts the run execcute the start function
execute as @a if score @s srnd.start matches 1.. unless score $started srnd.global matches 1..2 run function speedrnd:start


# if a player requests a display of the advancements
execute as @a if score @s srnd.see_goals matches 1.. run function speedrnd:gen/display
execute as @a if score @s srnd.see_goals matches 1.. run scoreboard players set @s srnd.see_goals 0

# tick if the run is in progress
execute as @a if score $started srnd.global matches 1 run function speedrnd:run_tick


# calculate run time

# $sec = $time / 20
scoreboard players operation $sec srnd = $time srnd.global
scoreboard players set $eax srnd 20
scoreboard players operation $sec srnd /= $eax srnd

scoreboard players set $eax srnd 60
# $min = $sec / 60
scoreboard players operation $min srnd = $sec srnd.global
scoreboard players operation $min srnd /= $eax srnd

# $h = $min / 60
scoreboard players operation $h srnd = $min srnd.global
scoreboard players operation $h srnd /= $eax srnd

# $sec %= 60
scoreboard players operation $sec srnd %= $eax srnd
# $min %= 60
scoreboard players operation $min srnd %= $eax srnd

# and display it
execute if score $sec srnd matches 10..60 if score $min srnd matches 10..60 run title @a actionbar [{"score":{"name":"$h","objective":"srnd"}},{"text":":"},{"score":{"name":"$min","objective":"srnd"}},{"text":":"},{"score":{"name":"$sec","objective":"srnd"}}]
execute if score $sec srnd matches 0..9 if score $min srnd matches 10..60 run title @a actionbar [{"score":{"name":"$h","objective":"srnd"}},{"text":":"},{"score":{"name":"$min","objective":"srnd"}},{"text":":0"},{"score":{"name":"$sec","objective":"srnd"}}]
execute if score $sec srnd matches 10..60 if score $min srnd matches 0..9 run title @a actionbar [{"score":{"name":"$h","objective":"srnd"}},{"text":":0"},{"score":{"name":"$min","objective":"srnd"}},{"text":":"},{"score":{"name":"$sec","objective":"srnd"}}]
execute if score $sec srnd matches 0..9 if score $min srnd matches 0..9 run title @a actionbar [{"score":{"name":"$h","objective":"srnd"}},{"text":":0"},{"score":{"name":"$min","objective":"srnd"}},{"text":":0"},{"score":{"name":"$sec","objective":"srnd"}}]