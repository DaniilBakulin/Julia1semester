function draw_piramida_with_barriers!(rob)
    counters = move_West_Nord(rob)         
    move_forward!(rob, Sud)                 
    putmarker!(rob)
    row_length = move_forward!(rob, Ost)   
    move!(rob, Nord)
    snake!(rob, row_length)
    move_West_Nord(rob)
    go_start!(rob, counters)
end


function snake!(rob, counter)      
    direction = 1
    counter+=1
    counter_1 = counter-1
    while counter_1!=0 
        i = 0
        if direction == 1                  
            while i != counter - counter_1
                if !isborder(rob, HorizonSide(1))
                    move!(rob, HorizonSide(1))
                    i+=1
                else
                    i += bypass!(rob, direction)
                    i+=1
                end
            end
            putmarker!(rob)
        else                                
            putmarker!(rob)
        end
        while i != counter-1               
            if !isborder(rob, HorizonSide(direction))
                move!(rob, HorizonSide(direction))
                i += 1
                if direction==1
                    putmarker!(rob)
                end
            else   
                i += bypass!(rob, direction)
                i+=1
                if i<=counter_1+1
                    putmarker!(rob)
                end
            end
            if i<counter_1   
                putmarker!(rob)
            end
        end
        if !isborder(rob,Nord)                     
            move!(rob, Nord)
        else                                     
            return 0                            
        end
        direction = (direction+2)%4
        counter_1 -= 1
    end    
end



function move_forward!(rob, side)      
    c = 0
    while !isborder(rob, side)
        move!(rob, side)
        c+=1
        if side==Ost                  
            putmarker!(rob)
        end
    end
    return c
end


function bypass!(rob, side)
    counter = 0
    counter_1 = 0
    while isborder(rob, HorizonSide(side))
        move!(rob, Nord)
        counter+=1
    end
    move!(rob, HorizonSide(side))
    while isborder(rob, Sud)
        move!(rob, HorizonSide(side))
        counter_1 += 1
    end
    for i in 0:counter-1
        move!(rob, Sud)
    end
    return(counter_1)
end




function move_West_Nord(rob)           # идем в левый верхний угол
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


function go_start!(rob, counters)   # возвращаемся в начало
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

draw_piramida_with_barriers!(r)