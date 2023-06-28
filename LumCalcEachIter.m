function lum_of_cells=LumCalcEachIter(passed_allims,celldat,PP_PARAMS)

ptt=[0:0.1:2*pi];
[titers,nframes,nr,nc]=size(passed_allims);
num_iters = nframes./PP_PARAMS.protocol.stim_protocol.total_frames_lines;%number of iters
num_frm = PP_PARAMS.protocol.stim_protocol.total_frames_lines;
rshp_allims = reshape(passed_allims,[num_iters,num_frm,nr,nc]);
allims=zeros(nr,nc,num_frm,num_iters);
for jj=1:num_iters
    for kk=1:num_frm
        allims(:,:,kk,jj)=rshp_allims(jj,kk,:,:);
    end
end
radius=celldat.radius;

lum_of_cells=zeros(length(celldat.x),num_iters,num_frm);


% di=ceil(art_ax/100);
% if di <=2
%     art=ceil(art_ax*0.1)+((di+2)*ceil((art_ax*0.01)));
% else
%     art=ceil(art_ax*0.1)-((di-2)*ceil((art_ax*0.01)));
% end

for jj=1:length(celldat.x)
    xxi=sin(ptt)*radius+celldat.x(jj);
    yyi=cos(ptt)*radius+celldat.y(jj);
    for kk=1:num_iters
        for fr=1:num_frm
            [sx,x11,y11]=roipoly(allims(:,:,fr,kk),xxi,yyi);
            [xx,yy]=find(sx);
            %            if  (min(xx)<=art && fr==stf1)%||( min(xx)<=art && fr==stf1-1)||(min(xx)<=art && fr==stf1+1)
            %                lum_of_cells(jj,kk,fr)=mean(mean(allims(xx,yy,fr-1,kk)));
            %            else
            lum_of_cells(jj,kk,fr)=mean(mean(allims(xx,yy,fr,kk)));
        end
    end
end

end


%
% ptt=[0:0.1:2*pi];
% [rows,cols,nframes,lpset]=size(tavimall);
%
% lumsum1=zeros(celldat.cellno,lpset,nframes);
%
% for jj=1:celldat.cellno
%     for kk=1:lpset
%        for fr=1:nframes
%            xxi=sin(ptt)*dia+celldat.cell_coordsx(jj);
%            yyi=cos(ptt)*dia+celldat.cell_coordsy(jj);
%            [sx,x11,y11]=roipoly(tavimall(:,:,fr,kk),xxi,yyi);
%            [xx,yy]=find(sx);
%            lumsum1(jj,kk,fr)=mean(mean(tavimall(xx,yy,fr,kk)));
%
%        end
%     end
%
% end