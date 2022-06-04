## @Author Siandfrance


# setup objectives
#define objective srnd General purpose temporary objective
scoreboard objectives add srnd dummy

#define objective srnd.global General purpose global objective
scoreboard objectives add srnd.global dummy

#define objective srnd.start A trigger to start the run
scoreboard objectives add srnd.start trigger

#define objective srnd.see_goals A trigger to see what objectives to do
scoreboard objectives add srnd.see_goals trigger


# setup variables
execute unless score $started srnd.global matches -2147483648..2147483647 run scoreboard players set $started srnd.global 0