[z Fs]=audioread('D:\StudiesRelated\Projects\SPC\Training_GridsAtoC\Grid_B\Power_recordings\Train_Grid_B_P1.wav');
t=1000*60;
a=0;
w=rectwin(t);
maxi=1;
[S F T P]=spectrogram(z,w,0,t,Fs);
for i=[1:length(S(1,:))]
    A=abs(S(:,i));
    maxi=1;
    for j=[1:length(A)]
        if(A(j)>A(maxi))
            maxi=j;
        end;
    end;
        a(i)=F(maxi);
end;
plot(a);