function xl=spcfilter(x,fs,M,fl,fh)

N=length(x)-2*M;
[i, ~]=size(x);
if i~=1
    x=x';
end
k=1:M;
w=0.5+0.5*cos(pi*k/M);

wl=2*pi*fl/fs;
wh=2*pi*fh/fs;
h(1)=(wh-wl)/pi;
h(2:M+1)=(sin(wh*k)-sin(wl*k))./(pi*k).*w;

for k=1:N
    kk=k-1+M;
    xl(k)=x(kk+1)*h(1)+sum(h(2:M+1).*(x(kk+2:kk+M+1)+x(kk:-1:kk-M+1)));
end
if i~=1
    xl=xl';
end