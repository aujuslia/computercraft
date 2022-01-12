function harvest_row()
    for rowIndex=0, 3 do
        for cropIndex=1, 4 do
            for i=1, 2 do --one for down, one for forward
                turtle.select(1 + rowIndex)
                if i == 1 then
                    turtle.digDown()
                else
                    turtle.dig()
                end

                if turtle.getItemCount(2 + rowIndex) > 0 then
                    turtle.select(2 + rowIndex)
                end

                if i == 1 then
                    turtle.placeDown()
                else
                    turtle.place()
                end

                turtle.select(1 + rowIndex)

                if i == 1 then
                    turtle.turnLeft()
                else
                    turtle.turnRight()
                end
            end
            turtle.forward()
        end
        turtle.forward()
    end
end

function harvest()
    turtle.up()
    turtle.forward()
    turtle.forward()
    harvest_row()
end
