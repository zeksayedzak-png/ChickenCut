-- =====================================================
-- AUTO DELETE: Workspace.World.Bounds (ALL OBJECTS)
-- =====================================================

print("🔍 Starting auto-delete for Workspace.World.Bounds...")

local function DeleteAllBounds()
    local world = workspace:FindFirstChild("World")
    if not world then
        print("⚠️ World not found!")
        return
    end
    
    local bounds = world:FindFirstChild("Bounds")
    if not bounds then
        print("⚠️ Bounds not found!")
        return
    end
    
    local count = 0
    for _, child in pairs(bounds:GetChildren()) do
        child:Destroy()
        count = count + 1
    end
    print("🗑️ Deleted " .. count .. " objects from Bounds")
end

-- حذف فوري
DeleteAllBounds()

-- مراقبة أي كائن جديد
local world = workspace:FindFirstChild("World")
if world then
    local bounds = world:FindFirstChild("Bounds")
    if bounds then
        bounds.ChildAdded:Connect(function(child)
            child:Destroy()
            print("🗑️ Auto-deleted: " .. child.Name)
        end)
        print("✅ Auto-watcher active for Workspace.World.Bounds")
    else
        print("⚠️ Bounds not found for monitoring!")
    end
else
    print("⚠️ World not found for monitoring!")
end

print("✅ Script loaded and monitoring active!")
