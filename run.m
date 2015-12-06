files=dir('D:\StudiesRelated\Projects\SPC\TestSimul\*.wav');
for j=[16:111]
    [denoised,output]=main(sprintf('%s%s','D:\StudiesRelated\Projects\SPC\TestSimul\',files(j).name));
    save(sprintf('%s%s%s','D:\StudiesRelated\Projects\SPC\OTestA1\',files(j).name,'.mat'),'output','denoised');
    clear denoised output;
end;


