rednet.open("left")
p = peripheral.wrap("right")

facing = 0

function setDir(dir)
    if dir == 1 then
        if facing == 2 then
            turtle.turnLeft()
        elseif facing == 3 then
            turtle.turnRight()
            turtle.turnRight()
        elseif facing == 4 then
            turtle.turnRight()
        end
    elseif dir == 2 then
        if facing == 1 then
            turtle.turnRight()
        elseif facing == 3 then
            turtle.turnLeft()
        elseif facing == 4 then
            turtle.turnRight()
            turtle.turnRight()
        end
    elseif dir == 3 then
        if facing == 1 then
            turtle.turnRight()
            turtle.turnRight()
        elseif facing == 2 then
            turtle.turnRight()
        elseif facing == 4 then
            turtle.turnLeft()
        end
    elseif dir == 4 then
        if facing == 1 then
            turtle.turnLeft()
        elseif facing == 2 then
            turtle.turnRight()
            turtle.turnRight()
        elseif facing == 3 then
            turtle.turnRight()
        end
    end
    
    facing = dir
end

function getFacing()
    px,py,pz = gps.locate(10)
    turtle.forward()
    print(px)
    p1x,p1y,p1z = gps.locate(10)
    print(p1x)
    if math.floor(p1z) < math.floor(pz) then
        facing = 1
    elseif math.floor(p1x) > math.floor(px) then
        facing = 2
    elseif p1z > pz then
        facing = 3
    else
        facing = 4
    end
    
    turtle.back()
    
    print(facing)
end

function floorCoords()
    px = math.floor(px + .5)
    py = math.floor(py + .5)
    pz = math.floor(pz + .5)
    
    target.x = math.floor(target.x + .5)
    target.y = math.floor(target.y + .5)
    target.z = math.floor(target.z + .5)
end

while true do
    if facing == 0 then getFacing() end

    target = p.getPlayerPos("joelzaper")
    px,py,pz = gps.locate(10)
    target.y = target.y + 2
    
    floorCoords()
    
    
    if target.y > py then
        turtle.up()
    elseif target.y < py then
        turtle.down()
    end
    
    
    if target.x > px then
        setDir(2)
        turtle.forward()
    elseif target.x < px then
        setDir(4)
        turtle.forward()
    
    elseif target.z > pz then
        setDir(3)
        turtle.forward()
    elseif target.z < pz then
        setDir(1)
        turtle.forward()
    end
    
    
    
    print("p: "..target.x)
    print("c: "..px)
end