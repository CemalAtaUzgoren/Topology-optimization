function [node,elements,nodeNrs] = grid_gen(el, numbers_onoff)
nelx = el.nelx;nely=el.nely;nelz=el.nelz;

nele = nelx*nely*nelz; %Number of elements


%==========================================================================
%                 NODE IDs
%==========================================================================
%Matrix of node IDs 
% x:3rd, y:1st (rows), z:2nd (columns)
nodeNrs = int32( reshape( 1 : ( 1 + nelx ) * ( 1 + nely ) * ( 1 + nelz ), ...
    1 + nely, 1 + nelz, 1 + nelx ) );  
nDof = ( 1 + nely ) * ( 1 + nelz ) * ( 1 + nelx ) * 3;   %Number of degree of freedoms





%==========================================================================
%                 ELELEMENT IDs
%==========================================================================
nEl = nelx * nely * nelz;  
elements = reshape(1:nEl,nely,nelx,nelz);
    
%==========================================================================
%                       GLOBAL NODE ID COORDINATES
%==========================================================================
size_node=max(max(max(nodeNrs)));
node = zeros(size_node,3);
inc = 0;
for k = 1:nelx+1
    x = (k-1)*el.dx;
    for i = 1:nelz+1
        z = (i-1)*el.dz;
        for j = 1:nely+1
            y = (j-1)*el.dy;
            % Global node IDs 
            inc = inc+1;
            node(inc,:) = [x y z];
        end
    end
end

%==========================================================================
%                        PLOT INITIAL TOPOLOGY
%==========================================================================
% Plot node ID numbers
if numbers_onoff==1
figure (3)
face = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8];
for k = 1:nelx
    x = (k-1)*el.dx;
    for i = 1:nely
        y = (i-1)*el.dz;
        for j = 1:nelz
            z = (j-1)*el.dy;
                % Local node IDs on each element          
                  vert = [x       y       z         ; x       y+el.dy   z       ; x+el.dx   y+el.dy z         ; x+el.dx   y       z       ; 
                          x       y       z+el.dz ; x         y+el.dy   z+el.dz ; x+el.dx   y+el.dy z+el.dz   ; x+el.dx   y       z+el.dz];                             
                %Plot face patches for each element using local node IDs
%                 vert(:,[2 3]) = vert(:,[3 2]); 
                vert(:,2,:) = -vert(:,2,:);
                patch('Faces',face,'Vertices',vert,'FaceColor',[0.2+0.8*(1-0.1),0.2+0.8*(1-0.1),0.2+0.8*(1-0.1)]);
                hold on;
        end
    end
end
axis equal; axis tight; axis on; box on; view([30,30]); pause(1e-6);

xlabel('x')
ylabel('y')
zlabel('z')
hold on

    for k = 1:size_node
        % in text plotting, y and z axes are switched. y is in negative. 
        if     node (k,3)>= max(node(:,3)) && node (k,1)<= min(node(:,1)) 
            text(node(k,1)-0.5*el.dx,-node(k,2)+0.3*el.dy,node(k,3)+0.2*el.dz,num2str(k),'Color','red','FontSize',8)
        elseif node (k,2)<= min(node(:,2)) && node (k,3)>= max(node(:,3)) 
            text(node(k,1)-0.5*el.dx,-node(k,2)+0.2*el.dy,node(k,3)+0.2*el.dz,num2str(k),'Color','red','FontSize',8)
        elseif node (k,1)>= max(node(:,1)) && node (k,3)<= min(node(:,3)) 
            text(node(k,1)+0.5*el.dx,-node(k,2)-0*el.dy,node(k,3)+0.1*el.dz,num2str(k),'Color','red','FontSize',8)
        elseif node (k,1)>= max(node(:,1)) && node (k,3)>= max(node(:,3)) 
            text(node(k,1)+0.5*el.dx,-node(k,2)-1.5*el.dy,node(k,3)+1.2*el.dz,num2str(k),'Color','red','FontSize',8)
        elseif node (k,1)<= min(node(:,1)) && node(k,2)>= max(node(:,2))
            text(node(k,1)-1*el.dx,-node(k,2)+0.2*el.dy,node(k,3)+0.1*el.dz,num2str(k),'Color','red','FontSize',8)
        elseif node (k,1)>= max(node(:,1)) && node(k,2)<= min(node(:,2))
            text(node(k,1)+0.2*el.dx,-node(k,2)+0.0*el.dy,node(k,3)+0.2*el.dz,num2str(k),'Color','red','FontSize',8)            
%         else
%             text(node(k,1)+0.1*el.dx,-node(k,3)-0.1*el.dz,node(k,2)-0.1*el.dy,num2str(k))
%         end
        end
    end
end

% % Plot node ID numbers
% if numbers_onoff==1
%     for k = 1:size_node
%         % in text plotting, y and z axes are switched. y is in negative. 
%         if node(k,1) < max(node(:,1)) && node(k,2) > min(node(:,2)) && node(k,3) < max(node(:,3))
%             text(node(k,1)-0.1*el.dx,-node(k,3)+0.1*el.dz,node(k,2)+0.1*el.dy,num2str(k))
%         else
%             text(node(k,1)+0.1*el.dx,-node(k,3)-0.1*el.dz,node(k,2)-0.1*el.dy,num2str(k))
%         end
%     end
% end



end