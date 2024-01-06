%==========================================================================
%                                DEFINITIONS
%==========================================================================
% 1. PURPOSE: Example for Generating a 3rd Degree Bezier Curve 

% -INPUT PARAMETERS
% P0, P1, P2, P3    : coordinates of the control points
% j; % scale
% L; %zy düzleminde uzunluk
% W; %zy düzleminde genişlik
% T; % tetha value
% H; % x ekseninde yükseklik
% u; %number of u values
% -OUTPUT PARAMETERS
% Plots of the curve

% 2. REFERENCES:
% N/A

% 3. OTHERS:
% Modifed Date: 15/04/2022
% By : Ataç Mert SOYSAL , Cemal Ata UZGÖREN, Arman Bartu NAS


%==========================================================================
%                             SCRIPT BODY
%==========================================================================
%Open top opt result
open 'volume_fraction%7.fig'
figure(1);
hold on
xlabel('[X] mm')
ylabel('[Y] mm')
zlabel('[Z] mm')
%Fitting surfaces

j=0; % scale
L=2.9+j; %zy düzleminde uzunluk
W=28+j; %zy düzleminde genişlik
T=30; % tetha value
H=65; % x ekseninde yükseklik
u=0.05;

cv_coordinates_x=zeros(3,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  SKİD-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P00
P00x=W;
P00y=36.3274; 
P00z=L;
cv_coordinates_x(1,1)=P00x;
cv_coordinates_x(2,1)=P00y;
cv_coordinates_x(3,1)=P00z;
plot3(P00x,P00y,P00z,'ko')
hold on
%coordinates of the point P10
P10x=(P00x-6);
P10y=P00y;
P10z=P00z;
cv_coordinates_x(1,2)=P10x;
cv_coordinates_x(2,2)=P10y;
cv_coordinates_x(3,2)=P10z;
plot3(P10x,P10y,P10z,'ko')
%coordinates of the point P20
P20x=P10x;
P20y=P00y;
P20z=-1.5;
cv_coordinates_x(1,3)=P20x;
cv_coordinates_x(2,3)=P20y;
cv_coordinates_x(3,3)=P20z;
plot3(P20x,P20y,P20z,'ko')
%coordinates of the point P30
P30x=P00x;
P30y=P00y;
P30z=P20z;
cv_coordinates_x(1,4)=P30x;
cv_coordinates_x(2,4)=P30y;
cv_coordinates_x(3,4)=P30z;
plot3(P30x,P30y,P30z,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P01
P01x=W;
P01y=43;
P01z=L;
cv_coordinates_x(1,1)=P01x;
cv_coordinates_x(2,1)=P01y;
cv_coordinates_x(3,1)=P01z;
plot3(P01x,P01y,P01z,'ko')
%coordinates of the point P11
P11x=P00x-6;
P11y=P01y;
P11z=P00z;
cv_coordinates_x(1,2)=P11x;
cv_coordinates_x(2,2)=P11y;
cv_coordinates_x(3,2)=P11z;
plot3(P11x,P11y,P11z,'ko')
%coordinates of the point P21
P21x=P00x-6;
P21y=P01y;
P21z=-1.5;
cv_coordinates_x(1,3)=P21x;
cv_coordinates_x(2,3)=P21y;
cv_coordinates_x(3,3)=P21z;
plot3(P21x,P21y,P21z,'ko')
%coordinates of the point P31
P31x=W;
P31y=P01y;
P31z=-1.5;
cv_coordinates_x(1,4)=P31x;
cv_coordinates_x(2,4)=P31y;
cv_coordinates_x(3,4)=P31z;
plot3(P31x,P31y,P31z,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P02
P02x=P00x;
P02y=45.3333;
P02z=P00z;
cv_coordinates_x(1,1)=P02x;
cv_coordinates_x(2,1)=P02y;
cv_coordinates_x(3,1)=P02z;
plot3(P02x,P02y,P02z,'ko')
%coordinates of the point P12
P12x=P11x;
P12y=45.3333;
P12z=L;
cv_coordinates_x(1,2)=P12x;
cv_coordinates_x(2,2)=P12y;
cv_coordinates_x(3,2)=P12z;
plot3(P12x,P12y,P12z,'ko')
%coordinates of the point P22
P22x=P00x-6;
P22y=45.3333;
P22z=-1.5;
cv_coordinates_x(1,3)=P22x;
cv_coordinates_x(2,3)=P22y;
cv_coordinates_x(3,3)=P22z;
plot3(P22x,P22y,P22z,'ko')
%coordinates of the point P32
P32x=P00x;
P32y=45.3333;
P32z=-1.5;
cv_coordinates_x(1,4)=P32x;
cv_coordinates_x(2,4)=P32y;
cv_coordinates_x(3,4)=P32z;
plot3(P32x,P32y,P32z,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P03
P03x=P02x;
P03y=H+9-27;
P03z=P02z;
cv_coordinates_x(1,1)=P03x;
cv_coordinates_x(2,1)=P03y;
cv_coordinates_x(3,1)=P03z;
plot3(P03x,P03y,P03z,'ko')
%coordinates of the point P13
P13x=P12x;
P13y=H+9-27;
P13z=P12z;
cv_coordinates_x(1,2)=P13x;
cv_coordinates_x(2,2)=P13y;
cv_coordinates_x(3,2)=P13z;
plot3(P13x,P13y,P13z,'ko')
%coordinates of the point P23
P23x=P22x;
P23y=H+9-27;
P23z=-1.5;
cv_coordinates_x(1,3)=P23x;
cv_coordinates_x(2,3)=P23y;
cv_coordinates_x(3,3)=P23z;
plot3(P23x,P23y,P23z,'ko')
%coordinates of the point P33
P33x=P02x;
P33y=H+9-27;
P33z=-1.5;
cv_coordinates_x(1,4)=P33x;
cv_coordinates_x(2,4)=P33y;
cv_coordinates_x(3,4)=P33z;
plot3(P33x,P33y,P33z,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
% Ploting the vertical elements of green surface's polyhedron
plot3([P30x P33x], [P30y P33y], [P30z P33z],'--r')
plot3([P20x P23x], [P20y P23y], [P20z P23z],'--r')
plot3([P10x P13x], [P10y P13y], [P10z P13z],'--r')
plot3([P00x P03x], [P00y P03y], [P00z P03z],'--r')
%ploting the green curve
CV_x=[P00x;P10x;P20x;P30x;P01x;P11x;P21x;P31x;P02x;P12x;P22x;P32x;P03x;P13x;P23x;P33x];
CV_y=[P00y;P10y;P20y;P30y;P01y;P11y;P21y;P31y;P02y;P12y;P22y;P32y;P03y;P13y;P23y;P33y];
CV_z=[P00z;P10z;P20z;P30z;P01z;P11z;P21z;P31z;P02z;P12z;P22z;P32z;P03z;P13z;P23z;P33z];

[Px(:,:,1) ,Py(:,:,1), Pz(:,:,1)]=Bezier_surface_matrix(CV_x,CV_y,CV_z,u);
[Px(:,:,2) ,Py(:,:,2), Pz(:,:,2)]=Bezier_surface_matrix(-CV_x+56,CV_y,CV_z,u);
surf(Px(:,:,1) ,Py(:,:,1), Pz(:,:,1),'FaceColor','g')
surf(Px(:,:,2) ,Py(:,:,2), Pz(:,:,2),'FaceColor','g')
hold on



[Px(:,:,3) ,Py(:,:,3), Pz(:,:,3)]=Bezier_surface_matrix(-CV_x+2,CV_y,CV_z,u);
surf(Px(:,:,3) ,Py(:,:,3), Pz(:,:,3),'FaceColor','g')
[Px(:,:,4) ,Py(:,:,4), Pz(:,:,4)]=Bezier_surface_matrix(CV_x-54,CV_y,CV_z,u);
surf(Px(:,:,4) ,Py(:,:,4), Pz(:,:,4),'FaceColor','g')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Corner-1-Right
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P00
P00xc=P03x;
P00yc=P03y; 
P00zc=P03z;
cv_coordinates_x(1,1)=P00xc;
cv_coordinates_x(2,1)=P00yc;
cv_coordinates_x(3,1)=P00zc;
plot3(P00xc,P00yc,P00zc,'ko')
hold on
%coordinates of the point P10
P10xc=P13x;
P10yc=P13y;
P10zc=P13z;
cv_coordinates_x(1,2)=P10xc;
cv_coordinates_x(2,2)=P10yc;
cv_coordinates_x(3,2)=P10zc;
plot3(P10xc,P10yc,P10zc,'ko')
%coordinates of the point P20
P20xc=P23x;
P20yc=P23y;
P20zc=P23z;
cv_coordinates_x(1,3)=P20xc;
cv_coordinates_x(2,3)=P20yc;
cv_coordinates_x(3,3)=P20zc;
plot3(P20xc,P20yc,P20zc,'ko')
%coordinates of the point P30
P30xc=P33x;
P30yc=P33y;
P30zc=P33z;
cv_coordinates_x(1,4)=P30xc;
cv_coordinates_x(2,4)=P30yc;
cv_coordinates_x(3,4)=P30zc;
plot3(P30xc,P30yc,P30zc,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=0.06;
%coordinates of the point P01
P01xc=((P02x-P03x)/(-k))+P03x;
P01yc=((P02y-P03y)/(-k))+P03y;
P01zc=((P02z-P03z)/(-k))+P03z;
cv_coordinates_x(1,1)=P01xc;
cv_coordinates_x(2,1)=P01yc;
cv_coordinates_x(3,1)=P01zc;
plot3(P01xc,P01yc,P01zc,'ko')
%coordinates of the point P11
P11xc=((P12x-P13x)/(-k))+P13x;
P11yc=((P12y-P13y)/(-k))+P13y;
P11zc=((P12z-P13z)/(-k))+P13z;
cv_coordinates_x(1,2)=P11xc;
cv_coordinates_x(2,2)=P11yc;
cv_coordinates_x(3,2)=P11zc;
plot3(P11xc,P11yc,P11zc,'ko')
%coordinates of the point P21
P21xc=((P22x-P23x)/(-k))+P23x;
P21yc=((P22y-P23y)/(-k))+P23y;
P21zc=((P22z-P23z)/(-k))+P23z;
cv_coordinates_x(1,3)=P21xc;
cv_coordinates_x(2,3)=P21yc;
cv_coordinates_x(3,3)=P21zc;
plot3(P21xc,P21yc,P21zc,'ko')
%coordinates of the point P31
P31xc=((P32x-P33x)/(-k))+P33x;
P31yc=((P32y-P33y)/(-k))+P33y;
P31zc=((P32z-P33z)/(-k))+P33z;
cv_coordinates_x(1,4)=P31xc;
cv_coordinates_x(2,4)=P31yc;
cv_coordinates_x(3,4)=P31zc;
plot3(P31xc,P31yc,P31zc,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P02
P02xc=28;
P02yc=76;
P02zc=4;
cv_coordinates_x(1,1)=P02xc;
cv_coordinates_x(2,1)=P02yc;
cv_coordinates_x(3,1)=P02zc;
plot3(P02xc,P02yc,P02zc,'ko')
%coordinates of the point P12
P12xc=17;
P12yc=76;
P12zc=4;
cv_coordinates_x(1,2)=P12xc;
cv_coordinates_x(2,2)=P12yc;
cv_coordinates_x(3,2)=P12zc;
plot3(P12xc,P12yc,P12zc,'ko')
%coordinates of the point P22
P22xc=17;
P22yc=110;
P22zc=4;
cv_coordinates_x(1,3)=P22xc;
cv_coordinates_x(2,3)=P22yc;
cv_coordinates_x(3,3)=P22zc;
plot3(P22xc,P22yc,P22zc,'ko')
%coordinates of the point P32
P32xc=28;
P32yc=110;
P32zc=4;
cv_coordinates_x(1,4)=P32xc;
cv_coordinates_x(2,4)=P32yc;
cv_coordinates_x(3,4)=P32zc;
plot3(P32xc,P32yc,P32zc,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P03
P03xc=28;
P03yc=70+3;
P03zc=7.6;
cv_coordinates_x(1,1)=P03xc;
cv_coordinates_x(2,1)=P03yc;
cv_coordinates_x(3,1)=P03zc;
plot3(P03xc,P03yc,P03zc,'ko')
%coordinates of the point P13
P13xc=17-4;
P13yc=70+2;
P13zc=7.6;
cv_coordinates_x(1,2)=P13xc;
cv_coordinates_x(2,2)=P13yc;
cv_coordinates_x(3,2)=P13zc;
plot3(P13xc,P13yc,P13zc,'ko')
%coordinates of the point P23
P23xc=17-2;
P23yc=87;
P23zc=7.6;
cv_coordinates_x(1,3)=P23xc;
cv_coordinates_x(2,3)=P23yc;
cv_coordinates_x(3,3)=P23zc;
plot3(P23xc,P23yc,P23zc,'ko')
%coordinates of the point P33
P33xc=28;
P33yc=87;
P33zc=7.6;
cv_coordinates_x(1,4)=P33xc;
cv_coordinates_x(2,4)=P33yc;
cv_coordinates_x(3,4)=P33zc;
plot3(P33xc,P33yc,P33zc,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
% Ploting the vertical elements of green surface's polyhedron
% plot3([P30xc P33xc], [P30yc P33yc], [P30zc P33zc],'--r')
% plot3([P20xc P23xc], [P20yc P23yc], [P20zc P23zc],'--r')
% plot3([P10xc P13xc], [P10yc P13yc], [P10zc P13zc],'--r')
% plot3([P00xc P03xc], [P00yc P03yc], [P00zc P03zc],'--r')
%ploting the green curve
CV_x=[P00xc;P10xc;P20xc;P30xc;P01xc;P11xc;P21xc;P31xc;P02xc;P12xc;P22xc;P32xc;P03xc;P13xc;P23xc;P33xc];
CV_y=[P00yc;P10yc;P20yc;P30yc;P01yc;P11yc;P21yc;P31yc;P02yc;P12yc;P22yc;P32yc;P03yc;P13yc;P23yc;P33yc];
CV_z=[P00zc;P10zc;P20zc;P30zc;P01zc;P11zc;P21zc;P31zc;P02zc;P12zc;P22zc;P32zc;P03zc;P13zc;P23zc;P33zc];

[Px(:,:,5) ,Py(:,:,5), Pz(:,:,5)]=Bezier_surface_matrix(CV_x,CV_y,CV_z,u);
[Px(:,:,6) ,Py(:,:,6), Pz(:,:,6)]=Bezier_surface_matrix(CV_x,-CV_y+83.3274,CV_z,u);
surf(Px(:,:,5) ,Py(:,:,5), Pz(:,:,5),'FaceColor','g')
surf(Px(:,:,6) ,Py(:,:,6), Pz(:,:,6),'FaceColor','g')
hold on
[Px(:,:,7) ,Py(:,:,7), Pz(:,:,7)]=Bezier_surface_matrix(-CV_x+2,CV_y,CV_z,u);
surf(Px(:,:,7) ,Py(:,:,7), Pz(:,:,7),'FaceColor','g')
[Px(:,:,8) ,Py(:,:,8), Pz(:,:,8)]=Bezier_surface_matrix(-CV_x+2,-CV_y+(83.3274),CV_z,u);
surf(Px(:,:,8) ,Py(:,:,8), Pz(:,:,8),'FaceColor','g')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Corner-1-Right-Miror
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P00
P00xcm=(W-P00xc)+W;
P00ycm=P03y; 
P00zcm=P03z;
cv_coordinates_x(1,1)=P00xcm;
cv_coordinates_x(2,1)=P00ycm;
cv_coordinates_x(3,1)=P00zcm;
plot3(P00xcm,P00ycm,P00zcm,'ko')
hold on
%coordinates of the point P10
P10xcm=(W-P10x)+W;
P10ycm=P13y;
P10zcm=P13z;
cv_coordinates_x(1,2)=P10xcm;
cv_coordinates_x(2,2)=P10ycm;
cv_coordinates_x(3,2)=P10zcm;
plot3(P10xc,P10yc,P10zc,'ko')
%coordinates of the point P20
P20xcm=(W-P20x)+W;
P20ycm=P23y;
P20zcm=P23z;
cv_coordinates_x(1,3)=P20xcm;
cv_coordinates_x(2,3)=P20ycm;
cv_coordinates_x(3,3)=P20zcm;
plot3(P20xcm,P20ycm,P20zcm,'ko')
%coordinates of the point P30
P30xcm=P33x;
P30ycm=P33y;
P30zcm=P33z;
cv_coordinates_x(1,4)=P30xcm;
cv_coordinates_x(2,4)=P30ycm;
cv_coordinates_x(3,4)=P30zcm;
plot3(P30xcm,P30ycm,P30zcm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=0.06;
%coordinates of the point P01
P01xcm=((P02x-P03x)/(-k))+P03x;
P01ycm=((P02y-P03y)/(-k))+P03y;
P01zcm=((P02z-P03z)/(-k))+P03z;
cv_coordinates_x(1,1)=P01xcm;
cv_coordinates_x(2,1)=P01ycm;
cv_coordinates_x(3,1)=P01zcm;
plot3(P01xcm,P01ycm,P01zcm,'ko')
%coordinates of the point P11
P11xcm=(W-(((P12x-P13x)/(-k))+P13x))+W;
P11ycm=((P12y-P13y)/(-k))+P13y;
P11zcm=((P12z-P13z)/(-k))+P13z;
cv_coordinates_x(1,2)=P11xcm;
cv_coordinates_x(2,2)=P11ycm;
cv_coordinates_x(3,2)=P11zcm;
plot3(P11xcm,P11ycm,P11zcm,'ko')
%coordinates of the point P21
P21xcm=(W-(((P22x-P23x)/(-k))+P23x))+W;
P21ycm=((P22y-P23y)/(-k))+P23y;
P21zcm=((P22z-P23z)/(-k))+P23z;
cv_coordinates_x(1,3)=P21xcm;
cv_coordinates_x(2,3)=P21ycm;
cv_coordinates_x(3,3)=P21zcm;
plot3(P21xcm,P21ycm,P21zcm,'ko')
%coordinates of the point P31
P31xcm=((P32x-P33x)/(-k))+P33x;
P31ycm=((P32y-P33y)/(-k))+P33y;
P31zcm=((P32z-P33z)/(-k))+P33z;
cv_coordinates_x(1,4)=P31xcm;
cv_coordinates_x(2,4)=P31ycm;
cv_coordinates_x(3,4)=P31zcm;
plot3(P31xcm,P31ycm,P31zcm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P02
P02xcm=28;
P02ycm=76;
P02zcm=4;
cv_coordinates_x(1,1)=P02xcm;
cv_coordinates_x(2,1)=P02ycm;
cv_coordinates_x(3,1)=P02zcm;
plot3(P02xcm,P02ycm,P02zcm,'ko')
%coordinates of the point P12
P12xcm=47;
P12ycm=P12yc;
P12zcm=4;
cv_coordinates_x(1,2)=P12xcm;
cv_coordinates_x(2,2)=P12ycm;
cv_coordinates_x(3,2)=P12zcm;
plot3(P12xcm,P12ycm,P12zcm,'ko')
%coordinates of the point P22
P22xcm=47;
P22ycm=P22yc;
P22zcm=4;
cv_coordinates_x(1,3)=P22xcm;
cv_coordinates_x(2,3)=P22ycm;
cv_coordinates_x(3,3)=P22zcm;
plot3(P22xcm,P22ycm,P22zcm,'ko')
%coordinates of the point P32
P32xcm=28;
P32ycm=110;
P32zcm=4;
cv_coordinates_x(1,4)=P32xcm;
cv_coordinates_x(2,4)=P32ycm;
cv_coordinates_x(3,4)=P32zcm;
plot3(P32xcm,P32ycm,P32zcm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P03
P03xcm=28;
P03ycm=73;
P03zcm=7.6;
cv_coordinates_x(1,1)=P03xcm;
cv_coordinates_x(2,1)=P03ycm;
cv_coordinates_x(3,1)=P03zcm;
plot3(P03xcm,P03ycm,P03zcm,'ko')
%coordinates of the point P13
P13xcm=31;
P13ycm=P03yc;
P13zcm=P13zc;
cv_coordinates_x(1,2)=P13xcm;
cv_coordinates_x(2,2)=P13ycm;
cv_coordinates_x(3,2)=P13zcm;
plot3(P13xcm,P13ycm,P13zcm,'ko')
%coordinates of the point P23
P23xcm=((W-17)+W)-5;
P23ycm=87;
P23zcm=7.6;
cv_coordinates_x(1,3)=P23xcm;
cv_coordinates_x(2,3)=P23ycm;
cv_coordinates_x(3,3)=P23zcm;
plot3(P23xcm,P23ycm,P23zcm,'ko')
%coordinates of the point P33
P33xcm=28;
P33ycm=87;
P33zcm=7.6;
cv_coordinates_x(1,4)=P33xcm;
cv_coordinates_x(2,4)=P33ycm;
cv_coordinates_x(3,4)=P33zcm;
plot3(P33xcm,P33ycm,P33zcm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
% Ploting the vertical elements of green surface's polyhedron
% plot3([P30xc P33xc], [P30yc P33yc], [P30zc P33zc],'--r')
% plot3([P20xc P23xc], [P20yc P23yc], [P20zc P23zc],'--r')
% plot3([P10xc P13xc], [P10yc P13yc], [P10zc P13zc],'--r')
% plot3([P00xc P03xc], [P00yc P03yc], [P00zc P03zc],'--r')
%ploting the green curve
CV_x=[P00xcm;P10xcm;P20xcm;P30xcm;P01xcm;P11xcm;P21xcm;P31xcm;P02xcm;P12xcm;P22xcm;P32xcm;P03xcm;P13xcm;P23xcm;P33xcm];
CV_y=[P00ycm;P10ycm;P20ycm;P30ycm;P01ycm;P11ycm;P21ycm;P31ycm;P02ycm;P12ycm;P22ycm;P32ycm;P03ycm;P13ycm;P23ycm;P33ycm];
CV_z=[P00zcm;P10zcm;P20zcm;P30zcm;P01zcm;P11zcm;P21zcm;P31zcm;P02zcm;P12zcm;P22zcm;P32zcm;P03zcm;P13zcm;P23zcm;P33zcm];

[Px(:,:,9) ,Py(:,:,9), Pz(:,:,9)]=Bezier_surface_matrix(CV_x,CV_y,CV_z,u);
[Px(:,:,10) ,Py(:,:,10), Pz(:,:,10)]=Bezier_surface_matrix(CV_x,-CV_y+83.3274,CV_z,u);
surf(Px(:,:,9) ,Py(:,:,9), Pz(:,:,9),'FaceColor','g')
surf(Px(:,:,10) ,Py(:,:,10), Pz(:,:,10),'FaceColor','g')
hold on

[Px(:,:,11) ,Py(:,:,11), Pz(:,:,11)]=Bezier_surface_matrix(-CV_x+2,CV_y,CV_z,u);
surf(Px(:,:,11) ,Py(:,:,11), Pz(:,:,11),'FaceColor','g')
[Px(:,:,12) ,Py(:,:,12), Pz(:,:,12)]=Bezier_surface_matrix(-CV_x+2,-CV_y+(83.3274),CV_z,u);
surf(Px(:,:,12) ,Py(:,:,12), Pz(:,:,12),'FaceColor','g')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Right Bar 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ro=4.15;
nn=-20;
%coordinates of the point P00
P00xr=P03xc;
P00yr=P03yc; 
P00zr=P03zc;
cv_coordinates_x(1,1)=P00xr;
cv_coordinates_x(2,1)=P00yr;
cv_coordinates_x(3,1)=P00zr;
plot3(P00xr,P00yr,P00zr,'ko')
hold on
%coordinates of the point P10
P10xr=P13xc;
P10yr=P13yc;
P10zr=P13zc;
cv_coordinates_x(1,2)=P10xr;
cv_coordinates_x(2,2)=P10yr;
cv_coordinates_x(3,2)=P10zr;
plot3(P10xr,P10yr,P10zr,'ko')
%coordinates of the point P20
P20xr=P23xc;
P20yr=P23yc;
P20zr=P23zc;
cv_coordinates_x(1,3)=P20xr;
cv_coordinates_x(2,3)=P20yr;
cv_coordinates_x(3,3)=P20zr;
plot3(P20xr,P20yr,P20zr,'ko')
%coordinates of the point P30
P30xr=P33xc;
P30yr=P33yc;
P30zr=P33zc;
cv_coordinates_x(1,4)=P30xr;
cv_coordinates_x(2,4)=P30yr;
cv_coordinates_x(3,4)=P30zr;
plot3(P30xr,P30yr,P30zr,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2;
%coordinates of the point P01
P01xr=((P02xc-P03xc)/(-k))+P03xc;
P01yr=((P02yc-P03yc)/(-k))+P03yc;
P01zr=((P02zc-P03zc)/(-k))+P03zc;
cv_coordinates_x(1,1)=P01xr;
cv_coordinates_x(2,1)=P01yr;
cv_coordinates_x(3,1)=P01zr;
plot3(P01xr,P01yr,P01zr,'ko')
%coordinates of the point P11
P11xr=((P12xc-P13xc)/(-k))+P13xc;
P11yr=((P12yc-P13yc)/(-k))+P13yc;
P11zr=((P12zc-P13zc)/(-k))+P13zc;
cv_coordinates_x(1,2)=P11xr;
cv_coordinates_x(2,2)=P11yr;
cv_coordinates_x(3,2)=P11zr;
plot3(P11xr,P11yr,P11zr,'ko')
%coordinates of the point P21
P21xr=((P22xc-P23xc)/(-k))+P23xc;
P21yr=((P22yc-P23yc)/(-k))+P23yc;
P21zr=((P22zc-P23zc)/(-k))+P23zc;
cv_coordinates_x(1,3)=P21xr;
cv_coordinates_x(2,3)=P21yr;
cv_coordinates_x(3,3)=P21zr;
plot3(P21xr,P21yr,P21zr,'ko')
%coordinates of the point P31
P31xr=((P32xc-P33xc)/(-k))+P33xc;
P31yr=((P32yc-P33yc)/(-k))+P33yc;
P31zr=((P32zc-P33zc)/(-k))+P33zc;
cv_coordinates_x(1,4)=P31xr;
cv_coordinates_x(2,4)=P31yr;
cv_coordinates_x(3,4)=P31zr;
plot3(P31xr,P31yr,P31zr,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P02
P02xr=16.458;
P02yr=70;
P02zr=13;
cv_coordinates_x(1,1)=P02xr;
cv_coordinates_x(2,1)=P02yr;
cv_coordinates_x(3,1)=P02zr;
plot3(P02xr,P02yr,P02zr,'ko')
%coordinates of the point P12
P12xr=15;
P12yr=65;
P12zr=13;
cv_coordinates_x(1,2)=P12xr;
cv_coordinates_x(2,2)=P12yr;
cv_coordinates_x(3,2)=P12zr;
plot3(P12xr,P12yr,P12zr,'ko')
%coordinates of the point P22
P22xr=15;
P22yr=80;
P22zr=13;
cv_coordinates_x(1,3)=P22xr;
cv_coordinates_x(2,3)=P22yr;
cv_coordinates_x(3,3)=P22zr;
plot3(P22xr,P22yr,P22zr,'ko')
%coordinates of the point P32
P32xr=19.98;
P32yr=83;
P32zr=13;
cv_coordinates_x(1,4)=P32xr;
cv_coordinates_x(2,4)=P32yr;
cv_coordinates_x(3,4)=P32zr;
plot3(P32xr,P32yr,P32zr,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P03
P03xr=1;
P03yr=57; 
P03zr=P03zcm+3*ro;
cv_coordinate_x(1,1)=P03xr;
cv_coordinates_x(2,1)=P03yr;
cv_coordinates_x(3,1)=P03zr;
plot3(P03xr,P03yr,P03zr,'ko')
%coordinates of the point P13
P13xr=1;
P13yr=55;
P13zr=P13zcm+3*ro-11;
cv_coordinates_x(1,2)=P13xr;
cv_coordinates_x(2,2)=P13yr;
cv_coordinates_x(3,2)=P13zr;
plot3(P13xr,P13yr,P13zr,'ko')
%coordinates of the point P23
P23xr=1;
P23yr=70;
P23zr=P13zcm+3*ro-11;
cv_coordinates_x(1,3)=P23xr;
cv_coordinates_x(2,3)=P23yr;
cv_coordinates_x(3,3)=P23zr;
plot3(P23xr,P23yr,P23zr,'ko')
%coordinates of the point P33
P33xr=1;
P33yr=68;
P33zr=P33zcm+3*ro;
cv_coordinates_x(1,4)=P33xr;
cv_coordinates_x(2,4)=P33yr;
cv_coordinates_x(3,4)=P33zr;
plot3(P33xr,P33yr,P33zr,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
% Ploting the vertical elements of green surface's polyhedron
% plot3([P30xc P33xc], [P30yc P33yc], [P30zc P33zc],'--r')
% plot3([P20xc P23xc], [P20yc P23yc], [P20zc P23zc],'--r')
% plot3([P10xc P13xc], [P10yc P13yc], [P10zc P13zc],'--r')
% plot3([P00xc P03xc], [P00yc P03yc], [P00zc P03zc],'--r')
%ploting the green curve
CV_x=[P00xr;P10xr;P20xr;P30xr;P01xr;P11xr;P21xr;P31xr;P02xr;P12xr;P22xr;P32xr;P03xr;P13xr;P23xr;P33xr];
CV_y=[P00yr;P10yr;P20yr;P30yr;P01yr;P11yr;P21yr;P31yr;P02yr;P12yr;P22yr;P32yr;P03yr;P13yr;P23yr;P33yr];
CV_z=[P00zr;P10zr;P20zr;P30zr;P01zr;P11zr;P21zr;P31zr;P02zr;P12zr;P22zr;P32zr;P03zr;P13zr;P23zr;P33zr];

[Px(:,:,13) ,Py(:,:,13), Pz(:,:,13)]=Bezier_surface_matrix(CV_x,CV_y,CV_z,u);
[Px(:,:,14) ,Py(:,:,14), Pz(:,:,14)]=Bezier_surface_matrix(CV_x,-CV_y+83.3274,CV_z,u);
surf(Px(:,:,13) ,Py(:,:,13), Pz(:,:,13),'FaceColor','g')
surf(Px(:,:,14) ,Py(:,:,14), Pz(:,:,14),'FaceColor','g')
hold on
[Px(:,:,15) ,Py(:,:,15), Pz(:,:,15)]=Bezier_surface_matrix(-CV_x+2,CV_y,CV_z,u);
surf(Px(:,:,15) ,Py(:,:,15), Pz(:,:,15),'FaceColor','g')
[Px(:,:,16) ,Py(:,:,16), Pz(:,:,16)]=Bezier_surface_matrix(-CV_x+2,-CV_y+(83.3274),CV_z,u);
surf(Px(:,:,16) ,Py(:,:,16), Pz(:,:,16),'FaceColor','g')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Right Bar miror
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ro=4.15;
%coordinates of the point P00
P00xrm=P03xcm;
P00yrm=P03ycm; 
P00zrm=P03zcm;
cv_coordinates_x(1,1)=P00xrm;
cv_coordinates_x(2,1)=P00yrm;
cv_coordinates_x(3,1)=P00zrm;
plot3(P00xrm,P00yrm,P00zrm,'ko')
hold on
%coordinates of the point P10
P10xrm=P13xcm;
P10yrm=P13ycm;
P10zrm=P13zcm;
cv_coordinates_x(1,2)=P10xrm;
cv_coordinates_x(2,2)=P10yrm;
cv_coordinates_x(3,2)=P10zrm;
plot3(P10xrm,P10yrm,P10zrm,'ko')
%coordinates of the point P20
P20xrm=P23xcm;
P20yrm=P23ycm;
P20zrm=P23zcm;
cv_coordinates_x(1,3)=P20xrm;
cv_coordinates_x(2,3)=P20yrm;
cv_coordinates_x(3,3)=P20zrm;
plot3(P20xrm,P20yrm,P20zrm,'ko')
%coordinates of the point P30
P30xrm=P33xcm;
P30yrm=P33ycm;
P30zrm=P33zcm;
cv_coordinates_x(1,4)=P30xrm;
cv_coordinates_x(2,4)=P30yrm;
cv_coordinates_x(3,4)=P30zrm;
plot3(P30xrm,P30yrm,P30zrm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2;
%coordinates of the point P01
P01xrm=((P02xcm-P03xcm)/(-k))+P03xcm;
P01yrm=((P02ycm-P03ycm)/(-k))+P03ycm;
P01zrm=((P02zcm-P03zcm)/(-k))+P03zcm;
cv_coordinates_x(1,1)=P01xrm;
cv_coordinates_x(2,1)=P01yrm;
cv_coordinates_x(3,1)=P01zrm;
plot3(P01xrm,P01yrm,P01zrm,'ko')
%coordinates of the point P11
P11xrm=((P12xcm-P13xcm)/(-k))+P13xcm;
P11yrm=((P12ycm-P13ycm)/(-k))+P13ycm;
P11zrm=((P12zcm-P13zcm)/(-k))+P13zcm;
cv_coordinates_x(1,2)=P11xrm;
cv_coordinates_x(2,2)=P11yrm;
cv_coordinates_x(3,2)=P11zrm;
plot3(P11xrm,P11yrm,P11zrm,'ko')
%coordinates of the point P21
P21xrm=((P22xcm-P23xcm)/(-k))+P23xcm;
P21yrm=((P22ycm-P23ycm)/(-k))+P23ycm;
P21zrm=((P22zcm-P23zcm)/(-k))+P23zcm;
cv_coordinates_x(1,3)=P21xrm;
cv_coordinates_x(2,3)=P21yrm;
cv_coordinates_x(3,3)=P21zrm;
plot3(P21xrm,P21yrm,P21zrm,'ko')
%coordinates of the point P31
P31xrm=((P32xcm-P33xcm)/(-k))+P33xcm;
P31yrm=((P32ycm-P33ycm)/(-k))+P33ycm;
P31zrm=((P32zcm-P33zcm)/(-k))+P33zcm;
cv_coordinates_x(1,4)=P31xrm;
cv_coordinates_x(2,4)=P31yrm;
cv_coordinates_x(3,4)=P31zrm;
plot3(P31xrm,P31yrm,P31zrm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P02
P02xrm=P02xr;
P02yrm=P02yr;
P02zrm=P32zr;
cv_coordinates_x(1,1)=P02xrm;
cv_coordinates_x(2,1)=P02yrm;
cv_coordinates_x(3,1)=P02zrm;
plot3(P02xrm,P02yrm,P02zrm,'ko')
%coordinates of the point P12
P12xrm=32;
P12yrm=72;
P12zrm=P32zr;
cv_coordinates_x(1,2)=P12xrm;
cv_coordinates_x(2,2)=P12yrm;
cv_coordinates_x(3,2)=P12zrm;
plot3(P12xrm,P12yrm,P12zrm,'ko')
%coordinates of the point P22
P22xrm=27;
P22yrm=87.5;
P22zrm=P32zr;
cv_coordinates_x(1,3)=P22xrm;
cv_coordinates_x(2,3)=P22yrm;
cv_coordinates_x(3,3)=P22zrm;
plot3(P22xrm,P22yrm,P22zrm,'ko')
%coordinates of the point P32
P32xrm=P32xr;
P32yrm=P32yr;
P32zrm=P32zr;
cv_coordinates_x(1,4)=P32xrm;
cv_coordinates_x(2,4)=P32yrm;
cv_coordinates_x(3,4)=P32zrm;
plot3(P32xrm,P32yrm,P32zrm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth Flat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%coordinates of the point P03
P03xrm=P03xr;
P03yrm=P03yr;
P03zrm=P03zr;
cv_coordinates_x(1,1)=P03xrm;
cv_coordinates_x(2,1)=P03yrm;
cv_coordinates_x(3,1)=P03zrm;
plot3(P03xrm,P03yrm,P03zrm,'ko')
%coordinates of the point P13
P13xrm=21;
P13yrm=63;
P13zrm=20;
cv_coordinates_x(1,2)=P13xrm;
cv_coordinates_x(2,2)=P13yrm;
cv_coordinates_x(3,2)=P13zrm;
plot3(P13xrm,P13yrm,P13zrm,'ko')
%coordinates of the point P23
P23xrm=20;
P23yrm=82;
P23zrm=20;
cv_coordinates_x(1,3)=P23xrm;
cv_coordinates_x(2,3)=P23yrm;
cv_coordinates_x(3,3)=P23zrm;
plot3(P23xrm,P23yrm,P23zrm,'ko')
%coordinates of the point P33
P33xrm=P33xr;
P33yrm=P33yr;
P33zrm=P33zr;
cv_coordinates_x(1,4)=P33xrm;
cv_coordinates_x(2,4)=P33yrm;
cv_coordinates_x(3,4)=P33zrm;
plot3(P33xrm,P33yrm,P33zrm,'ko')
plot3(cv_coordinates_x(1,:),cv_coordinates_x(2,:),cv_coordinates_x(3,:),'--r')
% Ploting the vertical elements of green surface's polyhedron
% plot3([P30xc P33xc], [P30yc P33yc], [P30zc P33zc],'--r')
% plot3([P20xc P23xc], [P20yc P23yc], [P20zc P23zc],'--r')
% plot3([P10xc P13xc], [P10yc P13yc], [P10zc P13zc],'--r')
% plot3([P00xc P03xc], [P00yc P03yc], [P00zc P03zc],'--r')
%ploting the green curve
CV_x=[P00xrm;P10xrm;P20xrm;P30xrm;P01xrm;P11xrm;P21xrm;P31xrm;P02xrm;P12xrm;P22xrm;P32xrm;P03xrm;P13xrm;P23xrm;P33xrm];
CV_y=[P00yrm;P10yrm;P20yrm;P30yrm;P01yrm;P11yrm;P21yrm;P31yrm;P02yrm;P12yrm;P22yrm;P32yrm;P03yrm;P13yrm;P23yrm;P33yrm];
CV_z=[P00zrm;P10zrm;P20zrm;P30zrm;P01zrm;P11zrm;P21zrm;P31zrm;P02zrm;P12zrm;P22zrm;P32zrm;P03zrm;P13zrm;P23zrm;P33zrm];

[Px(:,:,17) ,Py(:,:,17), Pz(:,:,17)]=Bezier_surface_matrix(CV_x,CV_y,CV_z,u);
[Px(:,:,18) ,Py(:,:,18), Pz(:,:,18)]=Bezier_surface_matrix(CV_x,-CV_y+83.3274,CV_z,u);
surf(Px(:,:,17) ,Py(:,:,17), Pz(:,:,17),'FaceColor','g')
surf(Px(:,:,18) ,Py(:,:,18), Pz(:,:,18),'FaceColor','g')
hold on
[Px(:,:,19) ,Py(:,:,19), Pz(:,:,19)]=Bezier_surface_matrix(-CV_x+2,CV_y,CV_z,u);
surf(Px(:,:,19) ,Py(:,:,19), Pz(:,:,19),'FaceColor','g')
hold on
[Px(:,:,20) ,Py(:,:,20), Pz(:,:,20)]=Bezier_surface_matrix(-CV_x+2,-CV_y+(83.3274),CV_z,u);
surf(Px(:,:,20) ,Py(:,:,20), Pz(:,:,20),'FaceColor','g')
axis equal


%------- OPTION 2 (FOR ANY BEZIER SURFACE) ---------
%Write each surface to STL
str1 = 'Surface';
str2 = '.stl';
for i = 1:20%size(CV_x,3)
    str3 = num2str(i);
    surf2stl(strcat(str1,str3,str2),Px(:,:,i) ,Py(:,:,i), Pz(:,:,i));
end

%Read All STLs
for i = 1:20%size(CV_x,3)
    str3 = num2str(i);
    fv(:,:,i) = stlread(strcat(str1,str3,str2));
end

%Merge All STLs
fvmerged = stlmerge(fv(:,:,1),fv(:,:,1));
for i = 2:20%size(CV_x,3)
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
for i = 1:20%size(CV_x,3)
    str3 = num2str(i);
    namestl = strcat(str1,str3,str2);
    delete (namestl)
end