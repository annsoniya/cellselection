% imaging cell selection 
result_folder = 'E:\ANN SONIYA M MICHEAL\ann_analysis\cell_sel_results';
curr_dir=pwd;
dname = uigetdir;
cd(dname);
[p,filename_n]=fileparts(dname);
file=dir('*.tif*');
[size_file, ~]=size(file);
num_iters=1;%number of iters
cell_radius=5;%input('Enter the cell radius');
nCell_dff = [];
for n_s=1:num_iters
    for n_f=1:size_file
        st1=[];
        st1=strcat(file(n_f).name);
        imx=[];
        imx=imread(st1);
        allims(n_s,n_f,:,:)=imx; % my roi size is 137*228 frame period = 196 ms 
        % so alims is 1*( 80 iters having 40 framnes each =3200)*137*228
    end
  
end
cd (curr_dir)
%%%%%%%%%%%% x-y correction
[allims,~]=imgxycorrect(allims);
mean_image=squeeze(mean(squeeze(allims),1));
%%%%%%%cell selection%%%%%%%%%
CellData=Cell_Select_IV(mean_image,cell_radius);

%%%%%%%display cells%%%%%%%%%%%%%
DisplayCells(CellData,mean_image)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%calculate luminance%%%%%%%%%%
lum_of_cells=LumCalcEachIter(allims,CellData,PP_PARAMS);
% lum_of_cells = nof of cellss*80iters*40frames each iter

 lum_of_cells=squeeze(lum_of_cells);
% ncells=size(lum_of_cells,1);
% nrep=size(lum_of_cells,2);
% nframs=size(lum_of_cells,3);

%%%%%%%%%%%%%%%%5
Cell_dff = Sort_Celldff(lum_of_cells,PP_PARAMS);

stimcode=PP_PARAMS.AUD_IMG_STIM.STIMS.stimcode ;


%%%%%%%%%%5
% med_cell_lum=nanmedian(squeeze(nanmedian(lum_of_cells,2)),2);
% Cell_dff=(lum_of_cells-repmat(med_cell_lum,[1 nrep nframs]))./repmat(med_cell_lum,[1 nrep nframs]);
% nCell_dff(:,:,:)=Cell_dff;
sCell_dff=squeeze(Calc_CausalSmooth_dff(Cell_dff,1));
cd(result_folder)
resultfile=strcat('OAR_',file(n_f).name(1:25))
eval(sprintf('save %s lum_of_cells Cell_dff sCell_dff mean_image CellData PP_PARAMS stimcode ',resultfile))
cd(curr_dir)