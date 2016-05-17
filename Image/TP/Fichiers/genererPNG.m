function genererPNG( terrain )
%GENERERPNG Summary of this function goes here
%   Detailed explanation goes here

terrain = mat2gray(terrain);
imwrite(terrain,'resultat.png');

end

