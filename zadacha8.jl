function find_marker(rob)
    steps = 0
    while !ismarker(rob)
        for s in (Nord, West)
            for i in 0:steps
                if ismarker(rob)
                break
            end
                move!(rob,s)
            end
        end
        z=steps+=1
        for s in (Sud, Ost)
            for i in 0:z
                if ismarker(rob)
                break
            end 
                move!(rob,s)
            end
        end
        steps+=1
    end
end

find_marker(r)