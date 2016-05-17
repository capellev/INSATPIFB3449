function [ texture ] = CourbeNiveau( terrain, inter )
%COURBENIVEAU Summary of this function goes here
%   Detailed explanation goes here

texture=zeros(size(terrain,1),size(terrain,2),3);

for i = 1:size(terrain,1)
   for j = 1:size(terrain,2)
      
       if(mod(terrain(i,j),inter)<inter/10 || mod(terrain(i,j),inter)>inter*9/10)
          
           texture(i,j,1)=0;
           texture(i,j,2)=0;
           texture(i,j,3)=0;
       else
           texture(i,j,1)=200;
           texture(i,j,2)=200;
           texture(i,j,3)=200;
           
       end
       
       
   end
end

imwrite(uint8(texture),'texture.png');

end

