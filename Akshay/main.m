fc=60;
factor=4;
order=1000;
Output1 = enf4me('D:\StudiesRelated\Projects\SPC\GridData\Grid_C\Power_recordings\Train_Grid_C_P1.wav',fc,0.5,factor,order);
set(gca,'ytick',(fc-1:0.2:fc+1));
if(mod(length(Output1),2)==1)
    Output1=Output1(1:length(Output1)-1);
end;
Output1=wextend(1,'sym',Output1,(2^nextpow2(length(Output1))-length(Output1))/2);
Denoised=func_denoise_sw1d(Output1,4);
subplot(2,1,1);
plot(Output1);
subplot(2,1,2);
plot(Denoised);


