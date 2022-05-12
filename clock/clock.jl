# submit
import Base: +, -;
import Dates.Minute

struct Clock
    hour::Number
    minute::Number
    Clock(hour, minute) = begin 
        hours = minute ÷ 60
        minute = minute % 60
        if minute < 0
            minute = 60 - abs(minute)
            hours -= 1
        end
        hour = (hour + hours) % 24
        if hour < 0
            hour = 24 - abs(hour)
        end
        return(new(hour, minute))
    end
end

function +(c::Clock, m::Dates.Minute)
    return Clock(c.hour, c.minute + m.value)
end

function -(c::Clock, m::Dates.Minute)
    return Clock(c.hour, c.minute - m.value)
end

function show(io::IO, c::Clock)
    Base.show(io, lpad(c.hour, 2, "0")*":"*lpad(c.minute, 2, "0"))
end