AddCSLuaFile()
CreateConVar("autocsm_enabled","1",FCVAR_NOTIFY,"Enable Automatic CSM Spawning?",0,1)

function SpawnCSM()
    if CLIENT then return end
    if !GetConVar("autocsm_enabled"):GetBool() then return end // return out of the function if not enabled.
    local csment = ents.Create("edit_csm") // initialize the entity for use
    csment:SetPos(Vector(0,0,0)) // set it at the middle of the map
    csment:Spawn() // spawn it! (idk if its a good idea to put it here lol)
    csment:SetNoDraw(true) // HIDE IT HIDE IT
    csment:SetCollisionGroup(COLLISION_GROUP_WORLD)
    csment:PhysicsDestroy()
end

hook.Add("InitPostEntity","AutoSpawnCSMInit",SpawnCSM)
hook.Add("PostCleanupMap","AutoSpawnCSMCleanup",SpawnCSM)
