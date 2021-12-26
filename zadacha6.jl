function draw_chess_board!(rob) 
    global flag
    quantity_steps=go_to_corner!(rob,Sud,West)
    chess_mark(rob,Sud,West,quantity_steps)
    go_to_corner!(rob,Sud,West)
    go_back!(rob,Sud,West,quantity_steps)
end

function go_to_corner!(rob,s1,s2)
    count_steps1=0
    count_steps2=0
    while !isborder(rob,s1) || !isborder(rob,s2)
        while !isborder(rob,s1)
            move!(rob,s1)
            count_steps1+=1
        end
        while !isborder(rob,s2)
            move!(rob,s2)
            count_steps2+=1
        end
    end
    return (count_steps1,count_steps2)
end

function chess_mark(rob,s1,s2,quantity_steps)

    if (quantity_steps[1]+ quantity_steps[2])%2 == 0
        marker_sw = true
    else 
        marker_sw = false
    end

    global flag = marker_sw

    mark_line(rob,inverse(s2))



    while !isborder(rob,inverse(s1))
        move!(rob,inverse(s1))
        flag = !flag
        mark_line(rob,s2)
        s2=inverse(s2)
    end

end

function mark_line(rob,s)
    global flag
    if flag == true
        putmarker!(rob)
    end
    while !isborder(rob,s)
        move!(rob,s)
        flag = !flag
        if flag == true
            putmarker!(rob)  
        end  
    end
end

function go_back!(rob,s1,s2,quantity_steps)
    for i in 1: quantity_steps[2]
        move!(rob,inverse(s2))
    end
    for i in 1: quantity_steps[1]
        move!(rob,inverse(s1))
    end
end

draw_chess_board!(r)