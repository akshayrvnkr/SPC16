fc=[50,60,100,120];
factor=4;
order=1000;
   mindiff=100;
    Output=0;
    Denoised=0;
    [z,Fs]=audioread('D:\StudiesRelated\Projects\SPC\GridData\Train_Grid_B_A1.wav');
    zfft=fft(z);
    t=[1:length(z)/2];
    f=t*Fs/length(z);
    for i=[1:4]
        if(fc(i)==60||fc(i)==50)
            order=10;
        else
            order=1000;
        end;
        [~,F]=max(zfft(fc(i)-5:fc(i)+5));
        Output1 = enf4me('D:\StudiesRelated\Projects\SPC\GridData\Train_Grid_B_A1.wav',F,0.5,factor,order);
        temp=diff(Output1);
        if(max(temp)<mindiff)
            mindiff=max(temp);
            Output=Output1;
        end;
    end;
    if(mod(length(Output),2)==1)
        Output=Output(1:length(Output)-1);
    end;
    Output=wextend(1,'sym',Output,(2^nextpow2(length(Output))-length(Output))/2);
    %Output=medfilt1(Output,25);
    %Denoised=func_denoise_sw1d(Output,5);
    Denoised=wden(Output,'heursure','s','one',4,'sym8');
    plot(Denoised);


