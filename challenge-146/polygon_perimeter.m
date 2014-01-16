function p = polygon_perimeter(n,r)
%POLYGON_PERIMETER Regular polygon perimeter
%   Calculates the perimeter of a regular polygon
%   given the number of sides and the circumradius.

p = 2*n*r*sin(pi/n);
end


