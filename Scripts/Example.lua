local ITEMS = loadstring(game:HttpGet("https://raw.githubusercontent.com/0xBqz/SoupWareV2/main/Library/Library.lua"))()

--
local Services = ITEMS.Services

local FPS = ITEMS:GetDetail({"fps: 0"})
FPS:set("fps: 60")

--

ITEMS:button({
    Name = "TEST",
    Image = "run",
    Callback = function()
        print("idk")
    end
})

local TEST_TOGGLE = ITEMS:toggle({
    Name = "TEST TOGGLE",
    Image = "plugin",
    Callback = function(value)
        print(tostring(value))
    end
})

ITEMS:toggle({
    Name = "VIEW FPS",
    Image = "hd",
    Callback = function(value)
        FPS:visible(value)
    end
})

TEST_TOGGLE:set(true)
TEST_TOGGLE:Execute()
