function empty()
    for i=1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
end

function harvest_row()
    for pairGroup = 1, 2 do
        for heightIndex = 0, 1 do
            for rowIndex=0, 3 do
                itemSel = (rowIndex * 2) + (heightIndex * 8) + 1
                for cropIndex=1, 4 do
                    for i=1, 2 do --one for down, one for forward
                        turtle.select(itemSel)
                        if i == 1 then
                            turtle.digDown()
                        else
                            turtle.dig()
                        end

                        if turtle.getItemCount(1 + itemSel) > 0 then
                            turtle.select(1 + itemSel)
                        end

                        if i == 1 then
                            turtle.placeDown()
                        else
                            turtle.place()
                        end

                        turtle.select(itemSel)

                        if (i == 1 and heightIndex == 0) or (i == 2 and heightIndex == 1) then
                            turtle.turnLeft()
                        else
                            turtle.turnRight()
                        end
                    end
                    turtle.forward()
                end
                turtle.forward()
            end

            if heightIndex == 0 then
                turtle.up()
                turtle.up()
                turtle.turnLeft()
                turtle.forward()
                turtle.forward()
                turtle.turnLeft()
                turtle.forward()
            end
        end

        if pairGroup == 1 then
            turtle.turnLeft()
            turtle.forward()
            turtle.down()
            turtle.turnLeft()
            turtle.turnLeft()
            empty()
            for i=1, 3 do
                turtle.up()
                turtle.forward()
            end
            turtle.turnRight()
            turtle.forward()
        end
    end
end

function harvest()
    turtle.up()
    turtle.forward()
    turtle.forward()
    harvest_row()
end
harvest()
