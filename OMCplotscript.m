src = 'F:\michelle\OMCSimulations\NanobeamFEM\BlkTetCompMode_sweepa\';
var = 'a';
dst = 'F:\michelle\OMCSimulations\NanobeamFEM\SweepPlots\';
%%%%%%%%%%%%%%%%%

cla;

fileList = dir([src, '*.mat']);


arr = zeros( length(fileList), 3);

for i = 1:length(fileList)
    
    dat = load([src, fileList(i).name]);
    arr(i,1) = dat.ds.P.(var)*10^9; %in nm
    arr(i,2) = dat.ds.cpl.lambdaGMax * 10^-6; %in Mhz 
    arr(i,3) = dat.ds.cpl.mechFreq* 10^-9; %in GHz
    
end

%sort by column 1
A = sortrows(arr);
disp(A)


%plot freq against OMC coupling
yyaxis left
plot(A(:, 1),A(:, 2), '-o', 'MarkerSize', 7, 'MarkerFaceColor', 'blue');
ylabel('OMC Coupling (MHz)')
%ylim([4, 6])
xlabel([var, ' (nm)']);

yyaxis right
plot(A(:, 1), A(:,3), '-s', 'MarkerSize', 9, 'MarkerFaceColor', 'red');
ylabel('Mech Freq (GHz)')
ylim([4.8, 5.2])

titlestrs = strcat(strsplit(fileList(1).name, '_'), '_');
title({['vary ', var, '; ' titlestrs{2:5}]; [titlestrs{6:12}]})

savefig([dst, 'plot_', var]);
saveas(gcf, [dst, 'plot_', var, '.png']);
