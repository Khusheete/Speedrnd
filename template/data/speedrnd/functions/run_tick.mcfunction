## @Author Siandfrance


function speedrnd:gen/check_adv
scoreboard players add $time srnd.global 1

execute if score $ok srnd matches 1 run function speedrnd:end
