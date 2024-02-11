function drawCube_v100b1 ( origin, size )

x=([0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0]-0.5)*size(1)+origin(1)+size(1)/2;
y=([0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1]-0.5)*size(2)+origin(2)+size(2)/2;
z=([0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1]-0.5)*size(3)+origin(3)+size(3)/2;
for i=1:6
%     h=patch(x(:,i),y(:,i),z(:,i),'k','FaceColor','k','EdgeColor','w','FaceAlpha',.2);
%     patch(x(:,i),y(:,i),z(:,i),'k','FaceColor','k','EdgeColor','w','FaceAlpha',.15)
%     patch(x(:,i),y(:,i),z(:,i),'k','FaceColor',.8*[1,1,1],'EdgeColor','k','FaceAlpha',1,'linewidth',2)
    patch(x(:,i),y(:,i),z(:,i),'k','FaceColor',[0.9574,0.9574,0.8975],'EdgeColor',rgb('black'),'FaceAlpha',1,'linewidth',2)

%     set(h,'edgecolor','w')
end
% set(gca,'XtickLabel',[],'YtickLabel',[],'ZtickLabel',[]);
axis equal
axis off
view(3)