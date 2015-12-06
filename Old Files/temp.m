[z Fs]=audioread('C:\Users\chaithya\Documents\Sound recordings\Recording.m4a');
t=1000*60;
a=0;
w=rectwin(t);
spectrogram(z,w,0,t,Fs);