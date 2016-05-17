function [ alter_terrain ] = genererTerrain( initterrain,nsubdiv, alpha, lambda )

alter_terrain=initterrain;


for i=1:nsubdiv
   alter_terrain = subdivise (alter_terrain, alpha);
   alpha=alpha*lambda;
end

alter_terrain = subdivise (alter_terrain,0);

end