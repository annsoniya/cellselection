function sCell_dff=Calc_CausalSmooth_dff(Cell_dff,stf)

[ncells,titers,nframes]=size(Cell_dff);
sCell_dff=Cell_dff;
for jj=1:ncells
    for kk=1:titers
        for ii=[2:stf-1 stf+1:nframes]
            sCell_dff(jj,kk,ii)=mean(Cell_dff(jj,kk,ii-1:ii),3);
        end
    end
end