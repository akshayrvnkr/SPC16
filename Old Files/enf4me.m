function Output = enf4me(wave,fc,d,factor,order)
[Audio, FS] = audioread(wave);

%decimate the original signal

o_f=floor(FS/factor);
dAudio = decimate(Audio(:,1), factor, 'fir'); %decimated 1000Hz to o_f Hz

%band pass the decimated signal 
fAudio = spcfilter(dAudio,o_f,order,fc+d,fc-d);

L = o_f;
frames = enframe(fAudio,2*L,L);

frames = frames';
padding_frames = padarray(frames,3 * L * 2,'post');
padding_frames = padding_frames';

%fft
len  = size(padding_frames);
Output = zeros(len(1),1);

for i = 1:len(1)
    %fft
    Y = fft(padding_frames(i,:),FS);
    Y = abs(Y);
    [~ , I] = max(Y);
    alpha = 20 * log(Y(I-1));
    beta = 20 * log(Y(I));
    gama = 20 * log(Y(I+1));
    Idx = I + 1/2 * (alpha - gama)/(alpha-2*beta+gama);
    Output(i) = Idx * o_f / FS;
end
