files=dir('D:\StudiesRelated\Projects\SPC\OTestA1\*P5.wav.mat');
figure;
for i=[1:9]
    load(sprintf('%s%s','D:\StudiesRelated\Projects\SPC\OTestA1\',files(i).name));
    if(mean(denoised)<130&&mean(denoised)>90)
          denoised=denoised/2;
    elseif(mean(denoised)<250&&mean(denoised)>90)
          denoised=denoised/4;
    end;
    subplot(3,3,i);
    plot(denoised);
end;