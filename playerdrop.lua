cant_drop = {50,74}
normal_drop = {47,48,49,51,52,53,54,72,73,75,76,89}

addhook("drop","drop")
function drop(id,idd,type)
     for _, value in pairs(cant_drop) do
          if value == player(id,"weapon") then
return 1
end
end

     for _, v in pairs(normal_drop) do
          if v == player(id,"weapon") then
return 0
end
end

local x=player(id,"x") 
local y=player(id,"y") 
local rot=player(id,"rot") 
parse("strip "..id.." "..type.."")
parse("spawnprojectile 0 "..type.." "..x.." "..y.." 100 "..rot.."")
return 1
end
