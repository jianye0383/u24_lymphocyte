function get_tumor_pos_neg_map(svs_name, username, width, height, mark_file)
% width, height are the size of the slide

PosLabel = 'LymPos';
NegLabel = 'LymNeg';
HeatPixelSize = 4;
% to downscale the heatmap 4 times from the size of the slide
% 1 pixel in the heatmap corresponds to 4 pixel in the slide
PatchHeatPixelN = 25;	% how to use this param???? --> look in func: get_tumor_region_extract. 25 to give 100x100 patches
PatchHeatPixelN = 25; 	% change to 50 to get 200x200 patches
PatchSampleRate = 50;

tumor = get_labeled_im_high_res(mark_file, width, height, HeatPixelSize, PosLabel, NegLabel);
% size(tumor) = 1/HeatPixelSize * size(slide)

image_path = sprintf('tumor_heatmaps/%s.%s.png', svs_name, username);
imwrite(tumor', image_path);
get_tumor_region_extract(svs_name, username, image_path, width, height, PatchHeatPixelN, PatchSampleRate);

