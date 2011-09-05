-- made by [G-moder]FertNoN

local keys = {
["W"]= IN_FORWARD,
["A"]= IN_MOVELEFT,
["S"]= IN_BACK,
["D"]= IN_MOVERIGHT,
["Mouse1"]= IN_ATTACK,
["Mouse2"]= IN_ATTACK2,
["Reload"]= IN_RELOAD,
["Jump"]= IN_JUMP,
["Speed"] = IN_SPEED,
["Run"] = IN_SPEED,
["Zoom"]= IN_ZOOM,
["Walk"]= IN_WALK,
["TurnLeftKey"]= IN_LEFT,
["TurnRightKey"]= IN_RIGHT,
["Duck"]= IN_DUCK,
["Use"]= IN_USE,
["Cancel"]= IN_CANCEL,
["Alt1"]= IN_ALT1,
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
if self.player:KeyDown(keys[key]) then return 1 else return 0 end
end