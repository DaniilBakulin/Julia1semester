function mark_vnutri!(r)
    mvs = []
    go_to_corner!(r,West,Sud,mvs)
    find_border(r,West,Sud)
    kras_vokryg(r,West,Sud)
    go_to_corner!(r,West,Sud)
    go_back(r,mvs)
end

function go_to_corner!(r,s1,s2,mvs)
    while !isborder(r,s1) || !isborder(r,s2)
        move_if_possible!(r,s1,mvs)
        move_if_possible!(r,s2,mvs)
    end
end

function find_border(r,s1,s2)
    while !isborder(r,inverse(s1))
        if !isborder(r,inverse(s2))
            move!(r,inverse(s2))
        else
            move!(r,inverse(s1))
            s2=inverse(s2)
        end
    end
end

function kras_vokryg(r,s1,s2)
    putmarker!(r)
    for s in (inverse(s1),inverse(s2),s1,s2)
        while isborder(r,s)
            move!(r,HorizonSide((Int(s)+3)%4))
            putmarker!(r)
        end
        move!(r,s)
        putmarker!(r)
    end
end

function go_to_corner!(r,s1,s2)
    count_steps1=0
    count_steps2=0
    while !isborder(r,s1) || !isborder(r,s2)
        while !isborder(r,s1)
            move!(r,s1)
            count_steps1+=1
        end
        while !isborder(r,s2)
            move!(r,s2)
            count_steps2+=1
        end
    end
    return (count_steps1,count_steps2)
end

function go_back(r,mvs)
    while length(mvs)>0
        last_move = pop!(mvs)
        move!(r, inverse(last_move))
    end
end

function inverse(s)
    return HorizonSide((Int(s)+2)%4) 
end

mark_vnutri!(r)