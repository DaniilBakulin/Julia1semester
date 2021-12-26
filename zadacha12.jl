import HorizonSideRobots: move!
import HorizonSideRobots: isborder
import HorizonSideRobots: putmarker!
import HorizonSideRobots: temperature
import HorizonSideRobots: ismarker

mutable struct NChessRobot <: AbstractCoordRobot
    robot::Robot
    N::Int
    coord::Coord
    NChessRobot(r,N::Int) = new(r,N,Coord())
end


get(r::NChessRobot) = r.robot

function putmarker!(r::ChessRobot)
    x,y = get_coord(r.coord)
    x = x % (2*r.N)
    y = y  % (2*r.N)
    if x in (0:r.N-1) && y in (0:r.N-1) || x in (r.N:2*r.N-1) && y in (r.N:2*r.N-1) 
        putmarker!(get(r))
    end
end

