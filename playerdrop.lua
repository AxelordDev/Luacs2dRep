function initArray(m)
	local array = {}
	local friendrop = {}
	for i = 1, m do
		array[i]=0
	end
	return array
	friendrop.drop=initArray(32)
end

local rad = math.rad
local cos = math.cos
local sin = math.sin

function GetXYInFrontOfPlayer(PlayerID, Offset)
	local PX, PY, PRot = player(PlayerID, "x"), player(PlayerID, "y"), player(PlayerID, "rot")
	PRot = rad((PRot - 90))
	PX = (PX + (Offset * cos(PRot)))
	PY = (PY + (Offset * sin(PRot)))
	return PX, PY
end

addhook("drop","friendrop.drop")
function friend.drop(id)
	if player(id,drop) then
	for (drop(x,y)==3,3)
	drop y = 3
	drop x= 3
	parse("drop"..gun)
		
end

addhook("use","use.friendrop.use")
function use.friend.drop(key)
	for (player(id,key)=="E") then
	friendrop.serveraction

end

addhook("serveraction","friendrop.serveraction")
function friendrop.serveraction(id)
	friendrop.drop(id)
end
