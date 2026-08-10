-- =====================================================
-- HIDE/DELETE SPECIFIC OBJECTS (AUTO)
-- =====================================================

print("🔍 Starting cleanup...")

-- 1. إخفاء وحذف Wall25
local wall = workspace:FindFirstChild("World")
if wall then
    local bounds = wall:FindFirstChild("Bounds")
    if bounds then
        local wall25 = bounds:FindFirstChild("Wall25")
        if wall25 then
            wall25:Destroy()
            print("✅ Wall25 deleted!")
        else
            print("⚠️ Wall25 not found!")
        end
    end
end

-- 2. إخفاء وحذف الدجاجات (من 0 إلى 10)
local chickenBodies = workspace:FindFirstChild("ChickenBodies")
if chickenBodies then
    for i = 0, 10 do
        local chickenName = "ChickenBody_tower-rival:" .. i
        local chicken = chickenBodies:FindFirstChild(chickenName)
        if chicken then
            chicken:Destroy()
            print("✅ " .. chickenName .. " deleted!")
        end
    end
else
    print("⚠️ ChickenBodies folder not found!")
end

print("✅ Cleanup complete!")
