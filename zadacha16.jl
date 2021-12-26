function draw_field_with_barriers!(rob)
    counters = move_to_corner!(rob)        
    putmarker!(rob)
    move_forward!(rob, Sud)                 
    row_length = move_forward!(rob, Ost)    
    move!(rob, Nord)
    move_by_snake!(rob, row_length)
    move_to_corner!(rob)
    return_to_start!(rob, counters)
end



function move_by_snake!(rob, counter)           
    direction = 1
    while true 
        i = 0
        while i != counter-1                   
            if !isborder(rob, HorizonSide(direction))   
                putmarker!(rob)
                move!(rob, HorizonSide(direction))
                i += 1
                putmarker!(rob)
            else                                
                i += move_through_barrier!(rob, direction)
                i+=1
            end
            if i==counter-1
                putmarker!(rob)
            end
        end
        if !isborder(rob,Nord)
            move!(rob, Nord)
        else
            return 0
        end
        direction = (direction+2)%4
    end    
end



function move_forward!(rob, side)          
    c = 0
    while !isborder(rob, side)
        move!(rob, side)
        c+=1
        putmarker!(rob)
    end
    return c
end


function move_through_barrier!(rob, side)  
    counter = 0
    counter_1 = 0
    while isborder(rob, HorizonSide(side))
        move!(rob, Nord)
        counter+=1
    end
    move!(r, HorizonSide(side))
    while isborder(rob, Sud)
        move!(rob, HorizonSide(side))
        counter_1 += 1
    end
    for i in 0:counter-1
        move!(rob, Sud)
    end
    putmarker!(rob)
    return(counter_1)
end


function move_to_corner!(rob)      
    counters = []
    while !(isborder(rob,Nord) && isborder(rob,West))
        counter_N = 0
        while !isborder(rob,Nord)
            move!(rob, Nord)
            counter_N+=1
        end
        pushfirst!(counters, counter_N)
        counter_W = 0
        while !isborder(rob,West)
            move!(rob, West)
            counter_W+=1
        end
        pushfirst!(counters, counter_W)
    end     
    return counters
end


function return_to_start!(rob, counters) 
    for i in 1:size(counters, 1)
        if i%2==0
            for j in 0:counters[i]-1
                move!(rob, Sud)
            end

        end
        if i%2==1
            for j in 0:counters[i]-1
                move!(rob, Ost)
            end
        end
    end
end

draw_field_with_barriers!(r)