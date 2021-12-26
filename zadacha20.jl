using HorizonSideRobots

function moves!(rob, side)
    while isborder(rob, side) == false
        move!(rob, side)
    end
end
function moves!(rob, side, num_steps)
    for _ in 1:num_steps
        move!(rob, side)
    end
end

putmarkers!(rob, side) =
    while isborder(rob, side) == false
        move!(rob, side)  
        putmarker!(rob)
    end

function move_by_markers(rob, side)
    while ismarker(rob) == true
        move!(rob, side)
    end
end

inverse(side) = HorizonSide(mod(Int(side) + 2, 4))

nextCounterClockwise(side) = HorizonSide(mod(Int(side) + 1, 4))

function move_While_Can(rob, sides)
moved = true
while moved
    moved = false
    for side in sides
        if !isborder(rob, side)
            move!(rob, side)
            moved = true
        end
    end
end
end

function bypass(rob, dir)
bypassDir = nextCounterClockwise(dir)
antiBypassDir = inverse(bypassDir)
numSteps = 0
while !isborder(rob, bypassDir) && isborder(rob, dir)
    move!(rob, bypassDir)
    numSteps += 1
end
if isborder(rob, dir) && isborder(rob,bypassDir)
    moves!(rob, antiBypassDir, numSteps)
    return false
end
move!(rob, dir)
moves!(rob, antiBypassDir, numSteps)
return true
end

function countSegments(rob)
    ans = 0
    move_While_Can(rob, (West, Sud))
    dir = Ost
    ans += processRow(rob, dir, Nord)
    while !isborder(rob, Nord)
        move!(rob, Nord)
        dir = inverse(dir)
        ans += processRow(rob, dir, Nord)
    end
    move_While_Can(rob, (West, Nord))

    dir = Sud
    ans += processRow(rob, dir, Ost)

    while !isborder(rob, Ost)
        move!(rob, Ost)
        dir = inverse(dir)
        ans += processRow(rob, dir, Ost)
    end

    return ans - 2
end

function processRow(rob, side, toCheckSide)
    cnt = 0
    flag = false
    while !isborder(rob, side) || bypass(rob, side)
        if isborder(rob, toCheckSide)
            if !flag
                flag = true
                cnt += 1
            end
        else
            flag = false
        end
        if !isborder(rob, side)
            move!(rob, side)
        end
    end
    return cnt
end
countSegments(rob)
