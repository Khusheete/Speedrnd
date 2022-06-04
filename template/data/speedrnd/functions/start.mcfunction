## @Author Siandfrance


scoreboard players set $started srnd.global 1
scoreboard players set $time srnd.global 0
time set day
advancement revoke @a everything
execute as @a run function speedrnd:gen/display
gamemode survival @a