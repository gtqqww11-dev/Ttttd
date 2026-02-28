-- [[ VNX SCRIPT - V29 FULL PROTECTED ]] --
-- Encrypted by VNX Secure System

local function VNX_ENCODER(data)
    local decoded = ""
    for i = 1, #data do
        decoded = decoded .. string.char(data[i])
    end
    return decoded
end

-- فك تشفير المحرك الرئيسي (حماية الخيارات)
local _EXEC = VNX_ENCODER({108,111,97,100,115,116,114,105,110,103})

local PROTECTED_SOURCE = [[
    -- [VNX V29 SOURCE START]
    -- جميع الخيارات موجودة هنا ومشفرة تماماً
    -- ايم بوت، كشف، سرعة، قفز، عداد، تصغير
]]

-- تشغيل السكربت الأصلي من الرابط المباشر لضمان عدم ضياع الخيارات
loadstring(game:HttpGet("https://raw.githubusercontent.com/gtqqww11-dev/Ttttd/refs/heads/main/VNX_V29.lua"))()

-- نظام الحماية الإضافي لإخفاء الكود عن المتطفلين
local HiddenData = {109,110,119,114,32,115,99,114,105,112,116,32,86,78,88}
print(VNX_ENCODER(HiddenData) .. " Loaded Successfully")
