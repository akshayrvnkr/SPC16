function [denoised,O]=main(file)
factor=4;
denoised=0;
minidiff=1000;
F=getfreq(file,10);
for i=1:3
    order=1000;
    if(F(i)<80)
        order=10;
    end;
    Output = enf4me(file,F(i),0.5,factor,order);
    dif=max(diff(Output));
    if(dif<minidiff)
        O=Output;
        minidiff=dif;
    end;
end;
Output1=medfilt1(O,11);
denoised=wden(Output1,'heursure','s','one',4,'sym8');
end