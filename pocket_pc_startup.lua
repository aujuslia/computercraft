term.setCursorPos(1,1)
term.clear()

term.setTextColor(colors.purple)
print("JuliOS 0.1")


--main loop:

while true do

    event, key, isHeld = os.pullEvent("key")
    if key == keys.s then
        term.setTextColor(colors.orange)
        print("Shell:")
        error()
    end
end
