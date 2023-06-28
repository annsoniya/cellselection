function Cell_dff = Sort_Celldff(lum_of_cells, PP_PARAMS)

[ncells, titers, nframes] = size(lum_of_cells);
bsf = 4 : PP_PARAMS.protocol.stim_protocol.stim_start -1;
blim = mean(lum_of_cells(:,:,bsf),3);
blim = repmat(blim, [1,1, nframes]);
Cell_dff = (lum_of_cells-blim)./blim;
end

% stim_pos = ordering_stim(PP_PARAMS);
% [~,n] = size(PP_PARAMS.AUD_IMG_STIM.STIMS.store_stim_order);
% 
% Cell_dff = zeros(ncells, titers, nframes);
% ps =1;
% for ii = 1 : n
%     pos_sing_stim = stim_pos(ii,:);
%     for pp = 1 : length(pos_sing_stim)
%         Cell_dff(:,ps,:) = Celldff(:,pos_sing_stim(pp),:);
%         ps = ps+1;
%     end
% end








