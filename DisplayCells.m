function DisplayCells(CellData,mean_image)

green=gray;green(:,1)=0;green(:,3)=0;
cell_radius=CellData.radius;
find_figure('Selected_Cells');
clf
n=length(CellData.x);
imagesc(mean_image)
colormap(green)
axis image
hold on
th=0:2*pi/50:2*pi;
xxx=cell_radius*cos(th);yyy=cell_radius*sin(th);

% imcontrast(h)
% htool = imcontrast(CellData,mean_image)
for kk=1:n
%     if kk==CellData.uc.cellnum
%         plot(CellData.x(kk)+xxx,CellData.y(kk)+yyy,'r')
%         %eval(sprintf('plot(text(CellData.x(kk),CellData.y(kk),''%i''),''%s'')',kk,'b'));
%         eval(sprintf('text(CellData.x(kk),CellData.y(kk),''%i'',''HorizontalAlignment'',''center'',''BackgroundColor'',[.7 .9 .7])',kk)); 
%     else
       
        plot(CellData.x(kk)+xxx,CellData.y(kk)+yyy,'b')
          eval(sprintf('text(CellData.x(kk),CellData.y(kk),''%i'',''HorizontalAlignment'',''center'',''BackgroundColor'',[.7 .9 .7])',kk));
%         text(CellData.x(kk),CellData.y(kk),'kk','HorizontalAlignment','center','BackgroundColor',[.7 .9 .7]);
%     end
end