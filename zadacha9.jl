function sr_temp(r)
    s=West
    kol = 0
    sum = 0
while !isborder(r,Ost)
    if ismarker(r)
        kol += 1
        sum += temperature(r)
    end 
    move!(r,Ost)
end
while !isborder(r,Nord)
    move!(r,Nord)
    while !isborder(r, s)
        if ismarker(r)
            kol += 1
            sum += temperature(r)
        end 
        move!(r,s)
    end
    s=inverse(s)
end
if ismarker(r)
    kol += 1
    sum += temperature(r)
end 
return sum/kol
end

function inverse(s)
    return HorizonSide((Int(s)+2)%4) 
end

sr_temp(r)