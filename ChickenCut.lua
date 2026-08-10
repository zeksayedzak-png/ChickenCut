-- =====================================================
-- PREVENT BattleFx & Chickens FROM APPEARING
-- =====================================================

print("🔧 Preventing BattleFx and Chickens...")

local function DisableBattleFx()
    local battleFx = workspace:FindFirstChild("BattleFx")
    if battleFx then
        battleFx:Destroy()
    end
end

local function DisableChickens()
    local chickenBodies = workspace:FindFirstChild("ChickenBodies")
    if chickenBodies then
        for _, child in pairs(chickenBodies:GetChildren()) do
            if child:IsA("BasePart") then
                child.Transparency = 1
                child.CanCollide = false
                child.Anchored = true
            end
            if child:FindFirstChild("Humanoid") then
                child.Humanoid:Destroy()
            end
        end
    end
end

-- منع فوري
DisableBattleFx()
DisableChickens()

-- مراقبة ومنع أي محاولة لإعادة الإنشاء
workspace.ChildAdded:Connect(function(child)
    if child.Name == "BattleFx" then
        child:Destroy()
        print("🚫 Blocked BattleFx from spawning")
    elseif child.Name == "ChickenBodies" then
        for _, c in pairs(child:GetChildren()) do
            c:Destroy()
        end
        child:Destroy()
        print("🚫 Blocked ChickenBodies from spawning")
    end
end)

print("✅ Prevention active (BattleFx & Chickens will not appear)")
