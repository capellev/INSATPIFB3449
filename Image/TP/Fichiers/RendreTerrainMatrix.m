function [ matrice ] = RendreTerrainMatrix(terrain, texture, outfile, origin, target)
%GENERERPERTURBATION Summary of this function goes here
%   Detailed explanation goes here


matrice = zeros(4,4);
Up =[0;0;1];

w = target(:)-origin(:);
w=w/norm(w);
u = cross(Up,w);
u=u/norm(u);
v = cross(w,u);
v=v/norm(v);

t = origin(:);
w(4)=0;
u(4)=0;
v(4)=0;
t(4)=1;

matrice(:,1) = u(:);
matrice(:,2) = v(:);
matrice(:,3) = w(:);
matrice(:,4) = t(:);

repertoire = '\\servif-home\fic_eleves\Espace Pedagogique\3IF\Modeles et Outils Mathematiques\Images fondements\image\Mitsuba';
cmd = strcat('"',repertoire,'\mitsuba" -Dhfile=',terrain,' -Dtfile=',texture,' -Dmatrix="',sprintf('%f ',matrice') , '" -o ',outfile,' texture-matrix.xml');
disp(cmd);
system(cmd);


end

