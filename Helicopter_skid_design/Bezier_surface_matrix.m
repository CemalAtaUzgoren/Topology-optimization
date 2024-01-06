function [Px,Py,Pz] = Bezier_surface_matrix(CvX,CvY,CvZ,u)
% This function recives control vertices's coordinates and incrment value
%then returns the coordinate matrixes which contains the 3th degree bezier
%surface's coordinates.

U = [-1,3,-3,1;
      3,-6,3,0;
     -3,3,0,0;
      1,0,0,0];

W=transpose(U);

cv_coor_x=zeros(4,4);
cv_coor_y=zeros(4,4);
cv_coor_z=zeros(4,4);
counter=0;
for i=1:1:4
    for j=1:1:4
        counter=counter+1;
        cv_coor_x(i,j)=CvX(counter,:);
        cv_coor_y(i,j)=CvY(counter,:);
        cv_coor_z(i,j)=CvZ(counter,:);
    end
end

x_coor=zeros(1,1);
y_coor=zeros(1,1);
z_coor=zeros(1,1);

counter_u=1;
counter_w=1;

for g=0:u:1
    mtx_w = [g.^3 ;g.^2 ;g ;1];
    for h=0:u:1
        mtx_u = [h.^3 ,h.^2 ,h ,1];
        x = mtx_u * U * cv_coor_x * W * mtx_w;
        y = mtx_u * U * cv_coor_y * W * mtx_w;
        z = mtx_u * U * cv_coor_z * W * mtx_w;

        x_coor(counter_w,counter_u)=x;
        y_coor(counter_w,counter_u)=y;
        z_coor(counter_w,counter_u)=z;

        counter_u=counter_u+1;
    end
    counter_w=counter_w+1;
    counter_u=1;
end
Px=x_coor;
Py=y_coor;
Pz=z_coor;
end