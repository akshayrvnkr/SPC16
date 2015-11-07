fc=50;
factor=5;
order=100;
Output1 = enf4me('/home/akshayrevankar/SPC Grid Data/Grid_B/Power_recordings/Train_Grid_B_P1.wav',fc,0.5,factor,order);
set(gca,'ytick',(fc-1:0.2:fc+1));
plot(Output1);