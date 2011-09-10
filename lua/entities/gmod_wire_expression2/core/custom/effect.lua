--made by [G-moder]FertNoN
---------------------------------------------EFFECK SPAWN

function E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
	
	--if ent!=nil then
	--	if !validEntity(ent)  then return end
	--	if !isOwner(self,ent)  then return end
	--end

	local effectdata = EffectData()
	
	if pos!=nil then effectdata:SetOrigin( Vector(pos[1],pos[2],pos[3]) ) end
	if rot!=nil then effectdata:SetAngle(Angle(rot[1],rot[2],rot[3])) end
	if normal!=nil then effectdata:SetNormal( Vector(normal[1],normal[2],normal[3]) ) end
	if size!=nil then effectdata:SetScale( size ) end
	if start!=nil then effectdata:SetStart(Vector(start[1],start[2],start[3])) end
	if this!=nil then effectdata:SetEntity( this ) end

	util.Effect( effect , effectdata )
end

--E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)

e2function void entity:effectSpawn(string effect,vector pos,vector normal)
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end

e2function void entity:effectSpawn(string effect,vector pos,vector start,angle rot,number size)	
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end

e2function void entity:effectSpawn(string effect,vector pos,vector start,vector normal,number size)	
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end

e2function void entity:effectSpawn(string effect,vector pos,vector normal,number size)	
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end

e2function void effectSpawn(string effect,vector pos,number size)	
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end

e2function void entity:effectSpawn(string effect,vector pos,number size)	
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end

e2function void entity:effectSpawn(string effect,number size)	
	E2_Spawn_Effect(self, effect, this, pos, start, normal, rot, size)
end