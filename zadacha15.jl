
inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))  
function draw_kross(rob)
    for side in 0:3
        num = putmarkers!(rob, HorizonSide(side))
        move_back!(rob, inverse(HorizonSide(side)), num)
    end
    putmarker!(rob)
end
function move_if_possible!(rob::Robot, now_side::HorizonSide)::Bool
    if !isborder(rob, now_side)
        move!(rob, now_side)
        return true
    end

    left_side = left(now_side)
    right_side = inverse(left_side)
    num_steps = 0
    back_steps = 0
  
    while isborder(rob, now_side)
        if !isborder(rob, left_side)
            move!(rob, left_side)
            num_steps += 1
            back_steps += 1
        else
            movements!(rob, right_side, back_steps)
            return false # робот пришел в угол
        end
    end
  
    move!(rob, now_side)
  
    back_steps = 0
  
    while isborder(rob, right_side)
        if !isborder(rob, now_side)
            move!(rob, now_side)
            back_steps += 1
        else
            movements!(rob, left_side, back_steps)
            return false # робот пришел в угол
        end
    end
  
    for i in 1:num_steps
        move!(rob, right_side)
    end 
    
    return true
  end


function putmarkers!(rob::Robot, side::HorizonSide)
    num = 0
    while move_if_possible!(rob, side)
        putmarker!(rob)
        num += 1
    end
    return num
end

draw_kross(r)