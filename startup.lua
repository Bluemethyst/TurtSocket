local ws = http.websocket('ws://localhost:2024')

function forward()
    turtle.forward()
    local below, result = turtle.inspectDown()
    if below then
        ws.send(textutils.serialiseJSON(result))
    end
    local up, result = turtle.inspectUp()
    if up then
        ws.send(textutils.serialiseJSON(result))
    end
    local front, result = turtle.inspect()
    if front then
        ws.send(textutils.serialiseJSON(result))
    end
end

function back()
    turtle.back()
    local below, result = turtle.inspectDown()
    if below then
        ws.send(textutils.serialiseJSON(result))
    end
    local up, result = turtle.inspectUp()
    if up then
        ws.send(textutils.serialiseJSON(result))
    end
    local front, result = turtle.inspect()
    if front then
        ws.send(textutils.serialiseJSON(result))
    end
end

function up()
    turtle.up()
    local below, result = turtle.inspectDown()
    if below then
        ws.send(textutils.serialiseJSON(result))
    end
    local up, result = turtle.inspectUp()
    if up then
        ws.send(textutils.serialiseJSON(result))
    end
    local front, result = turtle.inspect()
    if front then
        ws.send(textutils.serialiseJSON(result))
    end
end

function down()
    turtle.down()
    local below, result = turtle.inspectDown()
    if below then
        ws.send(textutils.serialiseJSON(result))
    end
    local up, result = turtle.inspectUp()
    if up then
        ws.send(textutils.serialiseJSON(result))
    end
    local front, result = turtle.inspect()
    if front then
        ws.send(textutils.serialiseJSON(result))
    end
end

function right()
    turtle.turnRight()
    local below, result = turtle.inspectDown()
    if below then
        ws.send(textutils.serialiseJSON(result))
    end
    local up, result = turtle.inspectUp()
    if up then
        ws.send(textutils.serialiseJSON(result))
    end
    local front, result = turtle.inspect()
    if front then
        ws.send(textutils.serialiseJSON(result))
    end
end

function left()
    turtle.turnLeft()
    local below, result = turtle.inspectDown()
    if below then
        ws.send(textutils.serialiseJSON(result))
    end
    local up, result = turtle.inspectUp()
    if up then
        ws.send(textutils.serialiseJSON(result))
    end
    local front, result = turtle.inspect()
    if front then
        ws.send(textutils.serialiseJSON(result))
    end
end

function mine()
    local broken, why = turtle.dig('right')
    if broken == false then
        ws.send(textutils.serialise(why))
    end
end

function mineup()
    local broken, why = turtle.digUp('right')
    if broken == false then
        ws.send(textutils.serialise(why))
    end
end

function minedown()
    local broken, why = turtle.digDown('right')
    if broken == false then
        ws.send(textutils.serialise(why))
    end
end

function place()
    local placed, why = turtle.place()
    if placed == false then
        ws.send(textutils.serialise(why))
    end
end

function placeup()
    local placed, why = turtle.placeUp()
    if placed == false then
        ws.send(textutils.serialise(why))
    end
end

function placedown()
    local placed, why = turtle.placeDown()
    if placed == false then
        ws.send(textutils.serialise(why))
    end
end

function fuel()
    local fuel = turtle.getFuelLevel()
    if fuel == 0 then
        turtle.refuel()
    end
end

while true do
    fuel()
    local message = ws.receive()
    if message then
        print("Received: " .. message)
        if message == 'forward' then
            forward()
        end
        if message == 'back' then
            back()
        end
        if message == 'up' then
            up()
        end
        if message == 'down' then
            down()
        end
        if message == 'right' then
            right()
        end
        if message == 'left' then
            left()
        end
        if message == 'mine' then
            mine()
        end
        if message == 'mineup' then
            mineup()
        end
        if message == 'minedown' then
            minedown()
        end
        if message == 'place' then
            place()
        end
        if message == 'placeup' then
            placeup()
        end
        if message == 'placedown' then
            placedown()
        end
    end
end
