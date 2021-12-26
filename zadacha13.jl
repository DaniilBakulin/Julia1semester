function draw_krest_X(rob)
    quanity_steps = 0
    for s in (Nord,West,Sud,Ost)
        quanity_steps = diog_line(rob,s)
    go_back!(r,inverse(s),HorizonSide((Int(s)+3)%4),quanity_steps)
    quanity_steps = 0
    end
    putmarker!(rob)
end

function diog_line(rob,s)
    quanity_steps = 0
     while (!isborder(rob,s) && !isborder(r,HorizonSide((Int(s)+1)%4)))
        move!(rob,s)
        quanity_steps += 1
        move!(rob,HorizonSide((Int(s)+1)%4))
        putmarker!(rob)
     end
     return quanity_steps
end   

function go_back!(rob,s1,s2,quanity_steps1)
    for i in 1: quanity_steps1
        move!(rob,s1)
    end
    for i in 1: quanity_steps1
        move!(rob,s2)
    end
end

function inverse(s)
    return HorizonSide((Int(s)+2)%4) 
end

draw_krest_X(r)