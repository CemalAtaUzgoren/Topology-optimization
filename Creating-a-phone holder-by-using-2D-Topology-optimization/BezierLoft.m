function [Px,Py,Pz] = BezierLoft(CVx,CVy,CVz,incr)

M_u = [-1 3 -3 1;3 -6 3 0;-3 3 0 0;1 0 0 0];
M_w = [-1 1;1 0];
i=1;
    for u=0:incr:1
        j=1;
       for w=0:incr:1
           U = [u^3 u^2 u 1];
           W = transpose([w  1]);
           Px(i,j)= U*M_u*CVx*M_w*W;
           Py(i,j)= U*M_u*CVy*M_w*W;
           Pz(i,j)= U*M_u*CVz*M_w*W;
           j=j+1;
       end
       i=i+1;
    end
end