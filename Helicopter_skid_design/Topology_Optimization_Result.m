%==========================================================================
%                                DEFINITIONS
%==========================================================================
% 1. PURPOSE: Density-based Topology Optimization using top3D125.m in Ref.[1]
% All units are in mm and N (MPa)

% -INPUT PARAMETERS
% Z   Y
% |  /
% | /
% |/_ _ _X
% lx : % thickness of the beam (in x direction)
% ly : % width of the beam (in y direction)
% lz : % Length of the beam (in z direction)
% dx : % Mesh size
% dy : % Mesh size
% dz : % Mesh size

% -OUTPUT PARAMETERS
% Density_Opt: Optimized Densities
% D_Opt: Optimized Diameters
% Plot of optimized structure

% 2. REFERENCES:
% [1]. Ferrari, F. and Sigmund, O., 2020. A new generation 99 line Matlab 
% code for compliance topology optimization and its extension to 3D. 
% Structural and Multidisciplinary Optimization, 62(4), pp.2211-2228.

% 3. OTHERS:
% Modifed Date: 02/28/2022
% By : Recep M. Gorguluarslan
%==========================================================================
%                              FUNCTION BODY
%==========================================================================
clear all
clc
close all

%==========================================================================
% INPUTS
%==========================================================================
%==========================================================================
% USER-DEFINED GRID DIMENSIONS
% Z   Y
% |  /
% | /
% |/_ _ _X
el.lx = 82;  % length of the beam (in x direction)
el.ly = 64/2;  % height of the beam (in y direction)
el.lz = 20;  % depth of the beam (in z direction)

el.dx = 1; % Mesh size
el.dy = 1; % Mesh size
el.dz = 1; % Mesh size

el.nelx = el.lx/el.dx; % number of elements in x-direction
el.nely = el.ly/el.dy; % number of elements in y-direction
el.nelz = el.lz/el.dz; % number of elements in z-direction
nelx = el.nelx;
nely=el.nely;
nelz=el.nelz;

% USER-DEFINED OPTIMIZATION PARAMETERS
volfrac = 0.07; %Volume fraction
penal = 3; %penalizaiton constant
rmin = sqrt(3);%1.2; %sqrt(3); %1.5; % filter radius
ft = 1; % filter type %density filtering alone if ft=1, 
% whereas ft=2 or ft=3 also allows the projection (1), 
% with eta and beta as parameters.
ftBC = 'N'; % filter boundary conditions 
%(’N’ for zero- Neumann or ’D’ for zero-Dirichlect)
eta = 0.5; %filter 2 or 3 parameter
beta=1 ; %filter 2 or 3 parameter
move=0.2; % step size to update design variables
maxit=100; % maximum number of iterations

%==========================================================================
%                    GRID GENERATION FOR FEA and Plot
%==========================================================================
numbers_onoff = 1; %1: on, 0:off
[node,elNrs,nodeNrs] = grid_gen(el,numbers_onoff);
nDof = ( 1 + nely ) * ( 1 + nelz ) * ( 1 + nelx ) * 3;                      % total number of DoFs
 
% nodeNrs : % x:3rd, y:1st (rows), z:2nd (columns)

%==========================================================================
% BCs and LCs for the example in Ferrari et al. (2020) (Ref. [1] in line 25
%==========================================================================
% % Boundary condition nodes - left YZ plane is fixed
% BCnode = reshape(nodeNrs(1:16,8:10,18:22),1,[]); % My order
% % BCnode = 1 : ( nely + 1 ) * ( nelz + 1 ); % Original cod
% 
% bc = [3*BCnode-2 3*BCnode-1 3*BCnode]; % 3 DOFs for each node
% 
% %Loading condition nodes - right bottom nodes in Y are loaded in Z
% Fnode = reshape(nodeNrs( :, 1, end ),[],1);
% lcDof = 3 * Fnode;
% Fm = zeros (nDof,1);
% Fm(lcDof,1) = -1; 
% % Fm(lcDof,1) = -sin((0:nely)/nely*pi)';
% F = fsparse(Fm);% define load vector
% 
% %Same as above but from original code
% % lcDof = 3 * nodeNrs( 1 : nely + 1, 1, nelx + 1 );
% % F = fsparse( lcDof, 1, -sin((0:nely)/nely*pi)', [ nDof, 1 ] );             % define load vector
% % F1 = fsparse( lcDof, 1, -ones(size(lcDof,1),1), [ nDof, 1 ] );             % define load vector
% 
% % Void Elements
% % VoidEl = reshape(elNrs( :,16:end,16:19 ),[],1);
% VoidEl =[]; %Use this if no void element exist

%==========================================================================
% HELİCOPTER SKİDS DESİGN
%==========================================================================
%Nodes for boundary conditions
BCnode = [nodeNrs(1:2,20:21,19:20) nodeNrs( 1:2,20:21,64:65)]; 
bc = [3*BCnode-2 3*BCnode-1 3*BCnode]; % 2 DOFs for each node
%         X           Y          Z
%Nodes for Forces
Fnode_z = [reshape(nodeNrs( 31:33,1:2,1:3 ),[],1); reshape(nodeNrs( 31:33,1:2,81:83),[],1)];
lcDof_z = [3 * Fnode_z ];
                   
Fnode_y = [reshape(nodeNrs( 31:33,1:2,1:3 ),[],1); reshape(nodeNrs( 31:33,1:2,81:83),[],1)];
lcDof_y = [3 * Fnode_y-1];

% %Nodes for Forces
% Fnode_right = reshape(nodeNrs( :,15:20,20 ),[],1);
% Fnode_right = [reshape(nodeNrs( 1:11,8:9,10 ),[],1); reshape(nodeNrs( 1:7,10:11,5 ),[],1)] ;
% 
% lcDof_right = [3 * Fnode_right-2];
% 
 lcDof = [lcDof_z lcDof_y];

%Force vector
Fm = zeros (nDof,1);
Fm(lcDof,1) = -1;
%Fm(lcDof_right,1) = 1;
F = fsparse(Fm);% define load vector

% Void Elements
% elNrs : % x:2rd, y:1st (rows), z:3nd (columns)
%VoidEl = reshape(elNrs(1:15,:,1:3),[],1);      
VoidEl =[]; %Use this if no void element exist

%==========================================================================
% Function call
%==========================================================================
% top3D125(nelx,nely,volfrac,penal,rmin,ft,ftBC,eta,beta,move,maxit, bc, F);
tic;
xPhys = top3D125_modified(nelx,nely,nelz,volfrac,penal,rmin,ft,ftBC,eta,beta,move,maxit,F,bc,VoidEl);
toc
%==========================================================================
% PLOT ISO SURFACE
%==========================================================================

figure (1);
hold on
axis on

xlabel('y')
ylabel('x')
zlabel('z')

rho = reshape( xPhys, nely, nelz, nelx ); %optimized relative densities
isovals = shiftdim( rho, 2 );
isovals = smooth3( isovals, 'box', 1 );
patch(isosurface(isovals, .5),'FaceColor','b','EdgeColor','none');
patch(isocaps(isovals, .5),'FaceColor','r','EdgeColor','none');
drawnow; view( [ 120, 30 ] ); axis equal tight; grid on;

%==========================================================================
% PLOT DENSITIES
%==========================================================================
figure (4)
rho = reshape( xPhys, nely, nelz, nelx ); %optimized relative densities
%display_3D(rho,el)
view([30,30])
axis on
xlabel('x')
ylabel('y')
zlabel('z')