function draw_corners(rob)
    s1=Sud 
    s2=West
    mvs=[]
    move_to_corner!(rob,s1,s2,mvs)
    mark_corners!(rob,s1,s2)
    go_back!(rob,mvs)
end

function move_to_corner!(rob,s1,s2,mvs)
    while !isborder(rob,s1) || !isborder(rob,s2)
        move_if_possible!(rob,s1,mvs)
        move_if_possible!(rob,s2,mvs)
    end
end
function mark_corners!(rob,s1,s2)
    for s in (inverse(s2),inverse(s1),s2,s1)
        while !isborder(rob,s)
            move!(rob,s)
        end
        putmarker!(rob)
    end
end

draw_corners(r)