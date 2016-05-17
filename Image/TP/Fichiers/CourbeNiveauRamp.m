function [ texture ] = CourbeNiveauRamp( terrain, inter, rampfile )
%COURBENIVEAURAMP Summary of this function goes here
%   Detailed explanation goes here

texture=zeros(size(terrain,1),size(terrain,2),3);
matRamp = imread(rampfile);

maxTerr = max(max(terrain));
minTerr = min(min(terrain));

maxRamp = size(matRamp,2);
minRamp = size(matRamp,1);





for i = 1:size(terrain,1)
   for j = 1:size(terrain,2)
      
       if(mod(terrain(i,j),inter)<inter/10 || mod(terrain(i,j),inter)>inter*9/10)
          
           texture(i,j,1)=0;
           texture(i,j,2)=0;
           texture(i,j,3)=0;
       else
           vInt = round(((maxRamp - minRamp)*(terrain(i,j)-minTerr))/(maxTerr-minTerr) + minRamp);
           
           texture(i,j,1)=matRamp(1,vInt,1);
           texture(i,j,2)=matRamp(1,vInt,2);
           texture(i,j,3)=matRamp(1,vInt,3);
           
       end
       
       
   end
end

imwrite(uint8(texture),'textureColor.png');

end


