function draw_perimeter!(rob)
    s1=Sud 
    s2=West
    quantity_steps=go_to_corner(rob,s1,s2)
    for s in [Nord,Ost,Sud,West]
        mark_line!(rob,s)
    end
    go_back(rob,s1,s2,quantity_steps)
end 
function go_to_corner(rob,s1,s2)
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
function mark_line!(rob,s)
    putmarker!(rob)
    while !isborder(rob,s)
        move!(rob,s)
        putmarker!(rob)
    end
end
function go_back(rob,s1,s2,quantity_steps)
    for i in 1: quantity_steps[2]
        move!(rob,inverse(s2))
    end
    for i in 1: quantity_steps[1]
        move!(rob,inverse(s1))
    end
end

inverse(s)=HorizonSide((Int(s)+2)%4)

draw_perimeter!(r)

