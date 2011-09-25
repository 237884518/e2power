-- made by [G-moder]FertNoN
--AddCSLuaFile( "entities\gmod_wire_expression2\core\custom\cl_KeyPress.lua" )
local keys = {
["w"]= IN_FORWARD,
["a"]= IN_MOVELEFT,
["s"]= IN_BACK,
["d"]= IN_MOVERIGHT,
["mouse1"]= IN_ATTACK,
["mouse2"]= IN_ATTACK2,
["reload"]= IN_RELOAD,
["jump"]= IN_JUMP,
["speed"] = IN_SPEED,
["run"] = IN_SPEED,
["zoom"]= IN_ZOOM,
["walk"]= IN_WALK,
["turnleftkey"]= IN_LEFT,
["turnrightkey"]= IN_RIGHT,
["duck"]= IN_DUCK,
["use"]= IN_USE,
["cancel"]= IN_CANCEL,
}


local e2_all_Keys={
[1]= {},
[2]= {},
[3]= {},
[4]= {},
[5]= {},
[6]= {},
[7]= {},
[8]= {},
[9]= {},
[10]= {},
[11]= {},
[12]= {},
[13]= {},
[14]= {},
[15]= {},
[16]= {},
[17]= {},
[18]= {},
[19]= {},
[20]= {},
[21]= {},
[22]= {},
[23]= {},
[24]= {},
[25]= {},
[26]= {},
[27]= {},
[28]= {},
[29]= {},
[30]= {},
[31]= {},
[32]= {},
[33]= {},
[34]= {},
[35]= {},
[36]= {},
[37]= {},
[38]= {},
[39]= {},
[40]= {},
}

local e2_all_MouseKeys={
[1]= {},
[2]= {},
[3]= {},
[4]= {},
[5]= {},
[6]= {},
[7]= {},
[8]= {},
[9]= {},
[10]= {},
[11]= {},
[12]= {},
[13]= {},
[14]= {},
[15]= {},
[16]= {},
[17]= {},
[18]= {},
[19]= {},
[20]= {},
[21]= {},
[22]= {},
[23]= {},
[24]= {},
[25]= {},
[26]= {},
[27]= {},
[28]= {},
[29]= {},
[30]= {},
[31]= {},
[32]= {},
[33]= {},
[34]= {},
[35]= {},
[36]= {},
[37]= {},
[38]= {},
[39]= {},
[40]= {},
}

local KeyAct={}

concommand.Add("wire_e2_keypress",function(ply, cmd, argm)
	if tonumber(argm[2])==1 then
		e2_all_Keys[ply:EntIndex()][tonumber(argm[1])] = true
		ply.e2_last_key=tonumber(argm[1])
	else
		e2_all_Keys[ply:EntIndex()][tonumber(argm[1])] = nil
	end
end)

__e2setcost(20)
e2function number clKeyPress(number key)
	if e2_all_Keys[self.player:EntIndex()][key] then
		return 1
	else
		return 0
	end
end

e2function number clKeyPressVel(number key)
	if e2_all_Keys[self.player:EntIndex()][key] then
		e2_all_Keys[self.player:EntIndex()][key]=nil
		return 1
	else
		return 0
	end
end

e2function number clLastKeyPress()
	if self.player.e2_last_key then 
		local key=self.player.e2_last_key 
		self.player.e2_last_key=0
		return key 
	else 
		return 0 
	end
end

e2function number runOnKey(number active)
	if KeyAct[self.player]==active then return end
	if active==1 then
		umsg.Start("e2_key_run", self.player) 
		umsg.End()
	 	KeyAct[self.player]=1
	else
		umsg.Start("e2_key_stop", self.player) 
		umsg.End()
	 	KeyAct[self.player]=0
	end
end

e2function number keyPress(string key)
if self.player:KeyDown(keys[key:lower()]) then return 1 else return 0 end
end
--------------------MOUSE

local mousekeys = {
["4"]= MOUSE_4,
["5"]= MOUSE_5,
["count"]= MOUSE_COUNT,
["first"]= MOUSE_FIRST,
["last"]= MOUSE_LAST,
["left"]= MOUSE_LEFT,
["middle"]= MOUSE_MIDDLE,
["right"]= MOUSE_RIGHT,
["wheel_down"]= MOUSE_WHEEL_DOWN,
["wheel_up"]= MOUSE_WHEEL_UP,
}

local MouseKeyAct={}

concommand.Add("wire_e2_mousekeypress",function(ply, cmd, argm)
	if tonumber(argm[2])==1 then
		e2_all_MouseKeys[ply:EntIndex()][argm[1]] = true
		ply.e2_mouselast_key=argm[1]
	else
		e2_all_MouseKeys[ply:EntIndex()][argm[1]] = nil
	end
end)

__e2setcost(20)
e2function number clMouseKeyPress(string key)
	if e2_all_MouseKeys[self.player:EntIndex()][mousekeys[key]] then
		return 1
	else
		return 0
	end
end

e2function number clMouseKeyPressVel(number key)
	if e2_all_MouseKeys[self.player:EntIndex()][key] then
		e2_all_MouseKeys[self.player:EntIndex()][key]=nil
		return 1
	else
		return 0
	end
end

e2function number clLastMouseKeyPress()
	if self.player.e2_mouselast_key then 
		local key=self.player.e2_mouselast_key 
		self.player.e2_mouselast_key="null"
		return key 
	else 
		return "null"
	end
end

e2function number runOnMouseKey(number active)
	if MouseKeyAct[self.player]==active then return end
	if active==1 then
		umsg.Start("e2_mousekey_run", self.player) 
		umsg.End()
	 	MouseKeyAct[self.player]=1
	else
		umsg.Start("e2_mousekey_stop", self.player) 
		umsg.End()
	 	MouseKeyAct[self.player]=0
	end
end