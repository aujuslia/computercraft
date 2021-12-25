function clear()
    term.setCursorPos(1,1)
    term.clear()
end

clear()

term.setTextColor(colors.purple)
print("JuliOS 0.1")


--main loop:

while true do

    event, key, isHeld = os.pullEvent("key")
    if key == keys.s then
        clear()

        term.setTextColor(colors.orange)
        print("Shell:")
        error()
    end
end
