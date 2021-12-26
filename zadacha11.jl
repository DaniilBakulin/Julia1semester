function mark_centers(r)
    num_steps = through_rectangles_into_angle(r,(Sud,West))
    # УТВ: Робот - в юго-западном углу и в num_steps - закодирован пройденный путь
    num_steps_to_ost = sum(num_steps[1:2:end])
    num_steps_to_nord = sum(num_steps[2:2:end])

    #---------------------
    movements!(r,Nord,num_steps_to_nord)
    putmarker!(r)
    num_steps_to_sud = movements!(r,Nord)

    movements!(r,Ost,num_steps_to_ost)
    putmarker!(r)
    num_steps_to_west = movements!(r,Ost)

    movements!(r,Sud,num_steps_to_sud)
    putmarker!(r)
    movements!(r,Sud) # возвращаемое значение игнорируется

    movements!(r,Sud,num_steps_to_west)
    putmarker!(r)
    movements!(r,Sud) # возвращаемое значение игнорируется
    # УТВ: Маркеры поставлены и Робот - в юго-западном углу
    #-------------------

    movements!(r,(Ost,Nord),num_steps)
    #УТВ: Робот - в исходном положении
end

function mark_angles(r)
    num_steps = through_rectangles_into_angle(r,(Sud,West))
    # УТВ: Робот - в юго-западном углу и в num_steps - закодирован пройденный путь
    for side in (Nord,Ost,Sud,West)
        movements!(r,side) # возвращаемый результат игнорируется
        putmarker!(r)
    end
    # УТВ: Маркеры поставлены и Робот - в юго-западном углу
    movements!(r,(Ost,Nord),num_steps)
    #УТВ: Робот - в исходном положении
end
through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})


function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
    num_steps=[]
    while isborder(r,angle[1])==false || isborder(r,angle[2]) # Робот - не в юго-западном углу
        push!(num_steps, movements!(r, angle[2]))
        push!(num_steps, movements!(r, angle[1]))
    end
    return num_steps
end
movements!(r,sides,num_steps::Vector{Int})
      
function movements!(r,sides,num_steps::Vector{Int})
    for (i,n) in enumerate(num_steps)
        movements!(r, sides[mod(i-1, length(sides))+1], n)
    end
end
mark_centers(r)
