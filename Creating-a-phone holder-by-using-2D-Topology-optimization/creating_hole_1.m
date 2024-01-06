clear all
close all
clc

%==========================================================================
%                                DEFINITIONS
%==========================================================================
% 1. PURPOSE: Example for Generating a 3rd Degree Bezier Curve 

% -INPUT PARAMETERS
% n                 : number of u values
% P0, P1, P2, P3    : coordinates of the control points

% -OUTPUT PARAMETERS
% Plots of the curve

% 2. REFERENCES:
% N/A

% 3. OTHERS:
% Modifed Date: 25/01/2022
% By : Recep M. Gorguluarslan and Cemal Ata Uzgören
%                                 Atac Mert Soysal
%                                 Arman Bartu Nas


%==========================================================================
%                             SCRIPT BODY
%==========================================================================
%Depth of the design:
h = 40;

% Generating u values with increments of
incr=0.05;

% Open the topology optimization figure
open top_opt_res.fig
figure (1);
hold on

axis([0 90 0 49])
grid on
xlabel('x')
ylabel('y')

%--------------------------------------------------------------------------
% Curve 1
%--------------------------------------------------------------------------
i=1; % ID of the curve
CVs(1,:,i) = [36,30.3,0];
CVs(2,:,i) = [40,27.5,0];
CVs(3,:,i) = [45,20.3,0];
CVs(4,:,i) = [47,13.3,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 2
%--------------------------------------------------------------------------
i=2; % ID of the curve
k=5.6;
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [48,9,0];
CVs(4,:,i) = [47,7.5,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 3
%--------------------------------------------------------------------------
i=3; % ID of the curve
k=1; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [45,1,0];
CVs(4,:,i) = [42,10,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 1 again for g1 continuity
%--------------------------------------------------------------------------
i=4; % ID of the curve
CVs(1,:,i) = [36,30.3,0];
CVs(2,:,i) = [40,27.5,0];
CVs(3,:,i) = [45,20.3,0];
CVs(4,:,i) = [47,13.3,0];

%--------------------------------------------------------------------------
% Curve 4+1
%--------------------------------------------------------------------------
i=5; % ID of the curve
k=1; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-2);
CVs(2,:,i) = [((CVs(3,1,i-2)-CVs(4,1,i-2))/(-k))+CVs(1,1,i),((CVs(3,2,i-2)-CVs(4,2,i-2))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [((CVs(2,1,i-1)-CVs(1,1,i-1))/(-k))+CVs(1,1,i-1),((CVs(2,2,i-1)-CVs(1,2,i-1))/(-k))+CVs(1,2,i-1),0];
CVs(4,:,i) = [36,30.3,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);



%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% CVs in 3rd direction with depth value of h
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
size_curves = size(CVs,3);
for i = i+1:size_curves*2
    CVs(:,:,i) = CVs(:,:,i-size_curves);
    CVs(:,3,i)=(h)*ones(4,1);
end


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Splitting coords to x y z
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
for i = 1:size_curves
    CVx(:,:,i) = [CVs(:,1,i),CVs(:,1,i+size_curves)];
    CVy(:,:,i) = [CVs(:,2,i),CVs(:,2,i+size_curves)];
    CVz(:,:,i) = [CVs(:,3,i),CVs(:,3,i+size_curves)];
end


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Generate x y z coordinates of the surface
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
for i =1:size(CVx,3)
    [Px(:,:,i) ,Py(:,:,i), Pz(:,:,i)]= BezierLoft (CVx(:,:,i), CVy(:,:,i), CVz(:,:,i), incr);
end

%-----Plotting Surface Models for Right Part
figure (1)
hold on
title('SurfacePlot');   %name of the figure
xlabel('X [mm]');       %dimensions and the axis name
ylabel('Y [mm]');       %dimensions and the axis name
zlabel('Z [mm]');       %dimensions and the axis name
for i =1:size(CVx,3)
    s = surf(Px(:,:,i) ,Py(:,:,i), Pz(:,:,i),'EdgeColor','k','FaceLighting','gouraud');
    if mod(i,3)==1 
        s.FaceColor = 'g';
    elseif mod(i,3)==2
        s.FaceColor = 'b';
    elseif mod(i,3) == 0 
        s.FaceColor = 'r';
    end
end
view(3)

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% STL EXPORT
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%------- OPTION 1 (FOR LOFTED SURFACES ONLY) ---------
% % For STL Export
% for i = 1:size(CVx,3)
%     coordsx(i*size(Px,1)-(size(Px,1)-1):i*size(Px,1),1:size(Px,1)) = Px(:,:,i);
%     coordsy(i*size(Px,1)-(size(Px,1)-1):i*size(Px,1),1:size(Px,1)) = Py(:,:,i);
%     coordsz(i*size(Px,1)-(size(Px,1)-1):i*size(Px,1),1:size(Px,1)) = Pz(:,:,i);
% end
% 
% surf2stl('Model.stl',coordsx,coordsy,coordsz)
%--------------------------------------------------------------------------



%------- OPTION 2 (FOR ANY BEZIER SURFACE) ---------
%Write each surface to STL
str1 = 'Surface';
str2 = '.stl';
for i = 1:size(CVx,3)
    str3 = num2str(i);
    surf2stl(strcat(str1,str3,str2),Px(:,:,i) ,Py(:,:,i), Pz(:,:,i));
end

%Read All STLs
for i = 1:size(CVx,3)
    str3 = num2str(i);
    fv(:,:,i) = stlread(strcat(str1,str3,str2));
end

%Merge All STLs
fvmerged = stlmerge(fv(:,:,1),fv(:,:,2));
for i = 3:size(CVx,3)
    str3 = num2str(i);
    fvmerged = stlmerge(fvmerged,fv(:,:,i));
end

%Write the final STL file
stlwrite('Model_Class_Hole_1.stl',fvmerged)

%Plot the STL model
data = stlread('Model_Class_Hole_1.stl');
stlPlot(data.vertices, data.faces, 'sonuc')
h=plotmesh(data.vertices,data.faces);

%Delete surface patch STL files
for i = 1:size(CVx,3)
    str3 = num2str(i);
    namestl = strcat(str1,str3,str2);
    delete (namestl)
end