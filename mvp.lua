addhook("startround","mystartroundhook")
addhook("leave","myleavehook")
addhook("hit","myhithook")
addhook("kill","mykillhook")
addhook("endround", "imagend")
addhook("endround","myendroundhook")
addhook("bombexplode","exploto")
addhook("bombdefuse","lapago")

function initArray(m)
  local array = {}
  for i = 1, m do
    array[i]=0
  end
  return array
end

dmg=initArray(32)
frags=initArray(32)

function mystartroundhook(mode)
  local playerlist=player(0,"table")
  for _,id in pairs(playerlist) do
    dmg[id]=0
    frags[id]=0
  end
end

function myleavehook(id)
  dmg[id]=0
  frags[id]=0
end

function myhithook(id,source,weapon,hpdmg)
  dmg[source]=dmg[source]+hpdmg
  return 0
end

function mykillhook(killer)
  frags[killer]=frags[killer]+1
end

function myendroundhook()
  local max_val, key = -math.huge
  for k, v in pairs(dmg) do
    if v > max_val then
      max_val, key = v, k
    end
  end
  if max_val > 0 then
    if (frags[key]==1) then text = "frag" else text = "frags" end
    msg("\169150255150» MVP "..player(key, "name").." ("..max_val.." dmg / "..frags[key].." "..text..") «@C")
  end
  max_val, key = 0, 0
end

function ctwin()
HUDImage = image('gfx/trct/ctwin.png', 320, 170, 2)
--imagescale(HUDImage, 130,28)
imagealpha(HUDImage, 1)
end

function twin()
HUDImage = image('gfx/trct/ttwin.png', 320, 170, 2)
--imagescale(HUDImage, 130,28)
imagealpha(HUDImage, 1)
end

function imagend(mode)
     if mode==1 then --TR win
          twin()
     elseif mode==2 then --CT win
          ctwin()
     elseif mode==3 then --Round draw
     elseif mode==4 then --Game commencing
     elseif mode==10 then --VIP
     end
end

function exploto(id)
  parse("sv_msg MVP: "..player(id,"name").." For planting the bomb!@C ")
  HUDImage = image('gfx/trct/ttwin.png', 320, 170, 2)
  imagealpha(HUDImage, 1)
end

function lapago(id)
  parse("sv_msg MVP: "..player(id,"name").." For defusing bomb!@C ")
  HUDImage = image('gfx/trct/ctwin.png', 320, 170, 2)
  imagealpha(HUDImage, 1)
end
