function main()
files=dir('D:\StudiesRelated\Projects\SPC\TestSimul\*wav');
fc=[50,60,100,120];
factor=4;
order=1000;
mindiff=100;

for j=[1:111]
    mindiff=100;
    Output=0;
    Denoised=0;
    for i=[1:4]
        if(fc(i)==60||fc(i)==50)
            order=10;
        else
            order=1000;
        end;
        F=fc(i);
        Output1 = enf4me(sprintf('%s%s','D:\StudiesRelated\Projects\SPC\TestSimul\',files(j).name),fc(i),2,factor,order);
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
    Output=medfilt1(Output,25);
    %Denoised=func_denoise_sw1d(Output,5);
    Denoised=wden(Output,'heursure','s','one',4,'sym8');
    save(sprintf('%s%s%s','D:\StudiesRelated\Projects\SPC\OutputSimul2withmedfilt\',files(j).name,'.mat'),'Output','Denoised');
    clear temp Output1 Output Denoised mindiff;
end;
end


