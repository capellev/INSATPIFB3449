function [ textureOmbre ] = Ombrage( terrain, inter, rampfile, normales, points, lumiere )
%CONSTUITPOINTS3D Summary of this function goes here
%   Detailed explanation goes here


textureOmbre=CourbeNiveauRamp(terrain,inter,rampfile);




for i=1:size(terrain,1)
    for j=1:size(terrain,2)
        
        p = points(i,j,:);
        v = p(:) - lumiere(:);
        n = normales(i,j,:);
        color = textureOmbre(i,j,:);
        textureOmbre(i,j,:) = color(:)*dot(v(:)/norm(v),n(:));
        

    end
end

imwrite(uint8(textureOmbre),'textureOmbre.png');

end

