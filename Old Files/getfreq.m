function F=getfreq(file,thresh)
    [z,Fs]=audioread(file);
    zfft=abs(fft(z));
    F=0;
    maxi=0;
    zfft=zfft([1:length(zfft/2)]);
    f=[55,100,120];
    for i=1:3
        frange=[f(i)-thresh:Fs/length(z):f(i)+thresh];
        zrange=round(frange*length(z)/Fs);
        zffttemp=zfft(zrange);
        [freqmax,F(i)]=max(zffttemp);
        F(i)=F(i)*Fs/length(z)+f(i)-thresh;
        if maxi<freqmax
            maxi=freqmax;
        Freq=F(i);
    end;
    
end
        