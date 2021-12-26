function find_pass(rob)
    steps = 0
    steps_back = 0
    while isborder(rob,Nord)
        for i in 0:steps
            move!(rob,Ost)    
        end
        if !isborder(rob,Nord) 
            break
        end
        steps_back = steps+1
        for i in 0:steps_back
            move!(rob,West)
        end
        steps+=2
    end
end

find_pass(r)