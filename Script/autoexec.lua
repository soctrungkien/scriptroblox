
-- Phiên bản nâng cao với thêm tùy chỉnh
local StarterGui = game:GetService("StarterGui")

local function showNotification(title, message, duration, icon)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = message,
        Duration = duration or 3,
        Icon = icon or "" -- Có thể thêm asset ID của hình ảnh
    })
end

-- Ví dụ sử dụng
showNotification(
    "AUTOEXEC", 
    "ko có gì cả", 
    10, 
    "rbxassetid://134399549849963" -- Thay bằng ID hình ảnh thực tế nếu muốn
)
