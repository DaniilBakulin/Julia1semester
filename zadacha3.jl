function draw_piramida!(rob)
    s1=Sud
    s2=West
    quantity_steps=go_to_corner!(rob,s1,s2)
    horizon=count_horizon!(rob)
    piramida!(rob,horizon)
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

function count_horizon!(rob)
    count=1
    while !isborder(rob, Ost)
        move!(rob,Ost)
        count+=1
    end
    while !isborder(rob,West)
        move!(rob,West)
    end
    return count
end

function piramida!(rob,horizon)
    while !isborder(rob,Nord)
        putmarker!(rob)
        horizon=horizon-1
        for  i in 1 : horizon
            move!(rob,Ost)
            putmarker!(rob)
        end
        move!(rob,Nord)
        while !isborder(r,West)
            move!(rob,West)
        end
    end
    putmarker!(rob)
    for i in 2:horizon
        move!(rob,Ost)
        putmarker!(rob)
    end
end
draw_piramida!(r)


        
        


