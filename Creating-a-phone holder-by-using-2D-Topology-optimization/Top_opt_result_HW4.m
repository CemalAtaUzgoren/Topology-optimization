
close all
clc

%==========================================================================
% INPUTS
%==========================================================================
% MBB Beam and Bracket example
% nelx = 120; %Number of elements in x direction
% nely = 40; % Number of elements in y direciton
% volfrac = 0.5; %Volume fraction
qua=1;
% %Phone Stand Example
nelx = 90*qua; %Number of elements in x direction
nely = 49*qua; % Number of elements in y direciton
volfrac = 0.10; %Volume fraction

% Other Inputs (can be the same)
penal = 3; %penalizaiton constant
rmin = 1.5; % filter radius
ft = 3; % filter type %density filtering alone if ft=1, 
% whereas ft=2 or ft=3 also allows the projection (1), 
% with eta and beta as parameters.
ftBC = 'N'; % filter boundary conditions 
%(’N’ for zero- Neumann or ’D’ for zero-Dirichlect)
eta = 1; %filter 2 parameter
beta=1; %filter 3 parameter
move=0.3; % step size to update design variables
maxit=500; % maximum number of iterations

%Figure of domain
figure (1);
% xPhys = ones(nely*nelx,1); %xPhys(2:2:end,:) = 0.5;
% colormap( gray ); imagesc( 1 - reshape( xPhys, nely, nelx ) );
% caxis([0 1]); axis equal on; drawnow;
x = 0:1:nelx;
y = nely:-1:0;
[x,y] = meshgrid(x,y);
z = ones (nely+1,nelx+1);
mesh(x,y,z);
axis equal on;
view(2)

nEl = nelx * nely;        % number of elements
nodeNrs = int32( reshape( 1 : (1 + nelx) * (1 + nely), 1+nely, 1+nelx ) ); %Matrix of node IDs
nDof = ( 1 + nely ) * ( 1 + nelx ) * 2;  %Number of degree of freedoms

%--------------------------------------------------------------------------
% BCs and LCs for the Phone Stand Example solved in the class
%--------------------------------------------------------------------------
%Nodes for boundary conditions
BCnode = nodeNrs(end,:); 
bc = [2*BCnode-1, 2*BCnode]; % 2 DOFs for each node

%Nodes for Forces
Fnode_left =[2251,2252,2302,2303,2353,2354,2405,2406,2456,2457,2508,2559,2560,2611, ...
  2662,2663,2713,2714,2765,2816,2817,2868,2919,2920,2970,2971,3022,3073,3074,3125, ...
  3176,3177,3227,3228,3279,3280,3330,3331,3381,3382,3433,3434,3484,3485,3536,3537,3587,...
  3588,3638,3639];
Fnode_bottom = [3639,3689,3688,3738,3737,3787,3836,3886,3885,3935,3934,3984,4033,4083,4082,4132,4131,4181,4230];
Fnode_right = [4230,4229,4179,4178,4127,4126,4075]; 
%Degree of freedoms
lcDof_left = [2*Fnode_left-1 ];
lcDof_bottom = [ 2*Fnode_bottom-1 ];
lcDof_right = [ 2*Fnode_right ];
lcDof = [lcDof_left lcDof_right lcDof_bottom];


%Force vector
Fm = zeros (nDof,1);
Fm(lcDof,1) = -1;
F = fsparse(Fm);

% F = fsparse( lcDof', 1, -1, [ nDof, 1 ] );




%--------------------------------------------------------------------------
% BCs and LCs for the MBB beam example in the paper
%--------------------------------------------------------------------------
% BCnode = nodeNrs(:,1)' ; 
% bc = [2*BCnode-1 2*nodeNrs( end, end )];
% % bc_old = union( 1 : 2 : 2*( nely + 1 ), 2 * nodeNrs( end, end ) );
% 
% Fnode = 2 * nodeNrs( 1, 1 ); 
% lcDof = 2*Fnode; % DOF to apply load
% F = fsparse( lcDof', 1, -1, [ nDof, 1 ] ); %Load matrix

%--------------------------------------------------------------------------
% BCs and LCs for the bracket example in Autodesk Fusion 360
%--------------------------------------------------------------------------
% One node BC and LC
% BCnode = [36, 1157]; 
% bc = [2*BCnode-1, 2*BCnode]; % 2 DOFs for each node
% Fnode = [6841];
% lcDof = 2*Fnode;
% F = fsparse( lcDof', 1, -1, [ nDof, 1 ] );

% Multiple Load BCs and LC
% BCnode = [34,35,36,37,38, 1155, 1156, 1157, 1158, 1159];
% bc = [2*BCnode-1, 2*BCnode]; % DOFs to fix (2 DOFs for each node)
% Fnode = [6841, 6784, 6727, 6670, 6613, 6556, 6499, 6442, 6385, 6328, ...
%          6271, 6214, 6157, 6100, 6043, 5986, 5929, 5872];
% lcDof = 2*Fnode; % DOF to apply load
% F = fsparse( lcDof', 1, -1, [ nDof, 1 ] ); %Load matrix

%--------------------------------------------------------------------------
% Function call
%--------------------------------------------------------------------------
top99neo_modified(nelx,nely,volfrac,penal,rmin,ft,ftBC,eta,beta,move,maxit, bc, F);

axis on
%set(gca,'YDir','normal')
axis([0 nelx 0 nely])