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
% By : Recep M. Gorguluarslan


%==========================================================================
%                             SCRIPT BODY
%==========================================================================
%Depth of the design:
h = 40;

% Generating u values with increments of
incr=0.05;

% Open the topology optimization figure
open Top_opt_result_HW4.m
figure (1);
hold on

axis([0 60 0 60])
grid on
xlabel('x')
ylabel('y')

%--------------------------------------------------------------------------
% Curve 1
%--------------------------------------------------------------------------
i=1; % ID of the curve
CVs(1,:,i) = [0,60,0];
CVs(2,:,i) = [1,60,0];
CVs(3,:,i) = [3,60,0];
CVs(4,:,i) = [4,60,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 2
%--------------------------------------------------------------------------
i=2; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [10,45,0];
CVs(3,:,i) = [22,34,0];
CVs(4,:,i) = [30,28,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 3
%--------------------------------------------------------------------------
i=3; % ID of the curve
k=4.5; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [34,CVs(2,2,i),0];
CVs(4,:,i) = [35,28,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 4
%--------------------------------------------------------------------------
i=4; % ID of the curve
k=0.2; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [51,48,0];
CVs(4,:,i) = [58,60,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 5
%--------------------------------------------------------------------------
i=5; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [59,60,0];
CVs(3,:,i) = [59.5,60,0];
CVs(4,:,i) = [60,60,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 6
%--------------------------------------------------------------------------
i=6; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [60,59,0];
CVs(3,:,i) = [60,58,0];
CVs(4,:,i) = [60,57,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 7
%--------------------------------------------------------------------------
i=7; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [51,44,0];
CVs(3,:,i) = [45,38,0];
CVs(4,:,i) = [42,31,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 8
%--------------------------------------------------------------------------
i=8; % ID of the curve
k=4; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [39,24,0];
CVs(4,:,i) = [52,21,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);


%--------------------------------------------------------------------------
% Curve 9
%--------------------------------------------------------------------------
i=9; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [51,20,0];
CVs(3,:,i) = [50.5,19,0];
CVs(4,:,i) = [49.5,17,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 10
%--------------------------------------------------------------------------
i=10; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [49,17.2,0];
CVs(3,:,i) = [48.5,17.6,0];
CVs(4,:,i) = [48,18,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);


%--------------------------------------------------------------------------
% Curve 11
%--------------------------------------------------------------------------
i=11; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [49,19,0];
CVs(3,:,i) = [49.5,19.5,0];
CVs(4,:,i) = [50,20,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);


%--------------------------------------------------------------------------
% Curve 12
%--------------------------------------------------------------------------
i=12; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [48,21,0];
CVs(3,:,i) = [45,22,0];
CVs(4,:,i) = [41,24,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 13
%--------------------------------------------------------------------------
i=13; % ID of the curve
k=5; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [35,14,0];
CVs(4,:,i) = [27,0,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);


%--------------------------------------------------------------------------
% Curve 14
%--------------------------------------------------------------------------
i=14; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [26,0,0];
CVs(3,:,i) = [25.5,0,0];
CVs(4,:,i) = [25,0,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 15
%--------------------------------------------------------------------------
i=15; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [22,12,0];
CVs(3,:,i) = [20,17,0];
CVs(4,:,i) = [19,22,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);


%--------------------------------------------------------------------------
% Curve 16
%--------------------------------------------------------------------------
i=16; % ID of the curve
k=1; % G1 continuity constant
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [((CVs(3,1,i-1)-CVs(4,1,i-1))/(-k))+CVs(1,1,i),((CVs(3,2,i-1)-CVs(4,2,i-1))/(-k))+CVs(1,2,i),0];
CVs(3,:,i) = [15,40,0];
CVs(4,:,i) = [0,56,0];
 
% Bezier Curve and Plot
coords = BezierCurvePlot(i,CVs,incr);

%--------------------------------------------------------------------------
% Curve 17
%--------------------------------------------------------------------------
i=17; % ID of the curve
CVs(1,:,i) = CVs(4,:,i-1);
CVs(2,:,i) = [0,57,0];
CVs(3,:,i) = [0,59,0];
CVs(4,:,i) = CVs(1,:,1);
 
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
stlwrite('Model_Class.stl',fvmerged)

%Plot the STL model
data = stlread('Model_Class.stl');
stlPlot(data.vertices, data.faces, 'sonuc')
h=plotmesh(data.vertices,data.faces);

%Delete surface patch STL files
for i = 1:size(CVx,3)
    str3 = num2str(i);
    namestl = strcat(str1,str3,str2);
    delete (namestl)
end