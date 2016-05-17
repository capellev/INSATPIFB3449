function [ alter_terrain ] = subdivise( terrain, alpha )
%SUBDIVISE Summary of this function goes here
%   Detailed explanation goes here

l = size(terrain, 2);
h = size(terrain, 1);

H = 2*h-1;
L = 2*l-1; 

alter_terrain = zeros(H,L);

%Agrandissement et reprise des points initiaux

for i=1:2:H
   for j=1:2:L
      alter_terrain(i,j) = terrain((i+1)/2, (j+1)/2);
   end
end


% Calcul des points intérieurs (points diamants)

for i=2:2:H
   for j=2:2:L
      pertub=genererPerturbation(alpha);
      alter_terrain(i,j) = ((alter_terrain(i-1,j-1) + alter_terrain(i+1,j-1) + alter_terrain(i-1, j+1) + alter_terrain(i+1,j+1))/4)+pertub;
   end
end


% Calcul des points restants (points carrés)
%Lignes impaires
for i=1:2:H
   for j=2:2:L
       pertub=genererPerturbation(alpha);
      if(i==1)
        alter_terrain(i,j) = ((alter_terrain(i+1,j) + alter_terrain (i, j+1) + alter_terrain(i,j-1))/3)+pertub;
      elseif (i==H)
        alter_terrain(i,j) = ((alter_terrain(i-1,j) + alter_terrain (i, j+1) + alter_terrain(i,j-1))/3)+pertub;
      else    
        alter_terrain(i,j) = ((alter_terrain(i-1,j) + alter_terrain(i+1,j) + alter_terrain(i, j+1) + alter_terrain(i,j-1))/4)+pertub;
      end
      
   end
end

%Lignes paires

for i=2:2:H
   for j=1:2:L
       pertub=genererPerturbation(alpha);
      if(j==1)
        alter_terrain(i,j) = ((alter_terrain(i-1,j) + alter_terrain(i+1,j) + alter_terrain(i, j+1))/3)+pertub;
      elseif (j==L)
        alter_terrain(i,j) = ((alter_terrain(i-1,j) + alter_terrain(i+1,j) + alter_terrain(i, j-1))/3)+pertub;
      else    
        alter_terrain(i,j) = ((alter_terrain(i-1,j) + alter_terrain(i+1,j) + alter_terrain(i, j+1) + alter_terrain(i,j-1))/4)+pertub;
      end
      
   end
end


end

