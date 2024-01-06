function coords = BezierCurvePlot(i,CVs,incr)

% Calculate the blending function values for each u
u = 0:incr:1;
B(:,1) = (1-u).^3;
B(:,2) = 3*((1-u).^2).*u;
B(:,3) = 3*(1-u).*u.^2;
B(:,4) = u.^3;

%Plot of the CVs 
p = plot(CVs(:,1,i),CVs(:,2,i)); 
if mod(i,2)==1, p.Color = 'r'; p.LineStyle = '-'; p.Marker = '*'; 
else, p.Color = 'b'; p.LineStyle = '-'; p.Marker = '*'; end

% Calculate the point coordinates on the Bezier curve
for j = 1:size(u,2)
    coords(j,1,i) = B(j,:)*CVs(:,1,i);
    coords(j,2,i) = B(j,:)*CVs(:,2,i);
    coords(j,3,i) = B(j,:)*CVs(:,3,i);
end

% Plot the Bezier Curve
figure (1);
hold on
p = plot(coords(:,1,i),coords(:,2,i));
if mod(i,2)==1, p.Color = 'g'; p.LineStyle = '-'; p.LineWidth=2; 
else, p.Color = 'y'; p.LineStyle = '-'; p.LineWidth=2; end

end