function draw_marks_in_corners!(rob)
    counters = move_to_corner!(rob) 
    mark_each_corner!(rob)
    go_back!(rob, counters)
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

function mark_each_corner!(rob) 
    for i in 1:4
        while !isborder(rob, HorizonSide(4-i))
            move!(rob, HorizonSide(4-i))
        end
        putmarker!(rob)
    end
end


function go_back!(rob, counters) 
    println(size(counters))
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

draw_marks_in_corners!(r)