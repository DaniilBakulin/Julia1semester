function draw_frame_perimetr!(rob)
    num_vert = moves!(rob, Sud)
    num_hor = moves!(rob, West)

    for i in 3:6
        putmarkers!(rob, HorizonSide(i % 4))
    end

    move_back!(rob, Nord, num_vert)
    move_back!(rob, Ost, num_hor)
end

function moves!(rob, side)
    num_steps = 0
    while move_if_possible!(rob, side)
        num_steps += 1
    end
    return num_steps
end
function putmarkers!(rob, side)
    while !isborder(rob, side)
        move!(rob, side)
        putmarker!(rob)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))

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

  left(side::HorizonSide) = HorizonSide(mod(Int(side) + 1, 4))

  function movements!(rob::Robot, side::HorizonSide, num_steps::Int)
    for i in 1:num_steps
        move!(rob, side)
    end 
  end

  function move_back!(rob::Robot, side::HorizonSide, num_steps::Int)
    while num_steps > 0
        move_if_possible!(rob, side)
        num_steps -= 1
    end
  end

  draw_frame_perimetr!(r)