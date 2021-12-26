function draw_box!(rob)
    s1=Ost
    s2=Nord
    quantity_steps=go_to_corner!(rob,s1,s2)
    mark_snake!(rob,s1,s2)
    go_to_corner!(rob,s1,s2)
    go_back!(rob,s1,s2,quantity_steps)
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

function mark_snake!(rob,s1,s2)
    while !isborder(rob,inverse(s1))
        mark_line!(rob,inverse(s2))
        move!(rob,inverse(s1))
        s2=inverse(s2)
    end
    mark_line!(rob,inverse(s2))
end
function mark_line!(rob,s2)
    putmarker!(rob)
    while !isborder(rob,s2)
        move!(rob,s2)
        putmarker!(rob)
    end
end

inverse(s)=HorizonSide((Int(s)+2)%4)
draw_box!(r)

    
    


