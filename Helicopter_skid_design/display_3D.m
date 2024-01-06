% === DISPLAY 3D TOPOLOGY (ISO-VIEW) ===
function display_3D(rho,el)
[nely,nelz,nelx] = size(rho);
% el.dx = 1; el.dy = 1; el.dz = 1;            % User-defined unit element size
face = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8];
set(gcf,'Name','ISO display','NumberTitle','off');
for k = 1:nelz
    z = (k-1)*el.dz;
    for i = 1:nelx
        x = (i-1)*el.dx;
        for j = 1:nely
            y = nely*el.dy - (j-1)*el.dy;
            if (rho(j,i,k) > 0.5)  % User-defined display density threshold
%                 vert = [x y z; x y-el.dx z; x+el.dx y-el.dx z; x+el.dx y z; x y z+el.dx;x y-el.dx z+el.dx; x+el.dx y-el.dx z+el.dx;x+el.dx y z+el.dx];
                vert = [x y z; x y+el.dx z; x+el.dx y+el.dx z; x+el.dx y z; x y z+el.dx;x y+el.dx z+el.dx; x+el.dx y+el.dx z+el.dx;x+el.dx y z+el.dx];
                
                vert(:,[1 3]) = vert(:,[3 1]); 
                
                vert(:,2,:) = -vert(:,2,:);
                patch('Faces',face,'Vertices',vert,'FaceColor',[0.2+0.8*(1-rho(j,i,k)),0.2+0.8*(1-rho(j,i,k)),0.2+0.8*(1-rho(j,i,k))]);
                hold on;
            end
        end
    end
end
axis equal; axis tight; axis off; box on; view([30,30]); pause(1e-6);
end