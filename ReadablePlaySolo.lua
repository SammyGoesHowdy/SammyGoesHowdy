--[[
    Play Solo script written by SammyGoesHowdy
    Date: 15/08/2024
]]

game:service("Visit")

-- Variables --
local error
local id = 12 -- Change this to the ID of your choosing, useful for games with owner doors.
local RESPAWN_TIME = 5 -- Change with time of your choice.
local msg = Instance.new("Message",workspace)


-- Display error if needed --
function OnError()
    msg.Text = "Failed to execute script: ".. error
end
-- Check if the RESPAWN_TIME variable is a valid number --
if tonumber(RESPAWN_TIME) then
    msg.Text = "Waiting for scripts"
else
    error = "RESPAWN_TIME is not a number"
    OnError()
    return
end
-- Check if the id variable is a valid number --
if tonumber(id) then
    msg.Text = "Waiting for scripts"
else
    error = "ID is not a number"
    OnError()
    return
end

-- Check if the player already exists --
if game.Players.LocalPlayer then
    error = "Player already exists"
    OnError()
    wait(4)
    msg.Parent = nil
    return
end

-- Create player --

local plr = game.Players:createLocalPlayer(id)
wait(1)
msg.Text = "Waiting for character"

-- Run the game --
game:service("RunService"):run();


-- 2007 ONLY!!!!!!!!
plr:SetSuperSafeChat(false);
plr:LoadCharacter(id);
msg.Parent = nil


-- (awkward) respawning code
while true do 
    wait()
    if plr.Character.Humanoid.Health == 0 then
        wait(RESPAWN_TIME)
        plr:LoadCharacter(id); 
    end
end
