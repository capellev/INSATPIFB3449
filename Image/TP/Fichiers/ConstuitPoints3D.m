function [ terrain3D ] = ConstuitPoints3D( terrain, xmin, xmax, ymin, ymax )
%CONSTUITPOINTS3D Summary of this function goes here
%   Detailed explanation goes here

terrain3D = zeros(size(terrain,1),size(terrain,2),3);

for x=xmin:xmax
    for y=ymin:ymax
        terrain3D(x,y,1)=x;
        terrain3D(x,y,2)=y;
        terrain3D(x,y,3)=terrain(x,y);     
    end 
end
end

