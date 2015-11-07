function sigDEN = func_denoise_sw1d(SIG,l)
wname = 'haar';
level = l;
% Denoising parameters.
%----------------------
% meth = 'sqtwolog';
% scal_OR_alfa = one;
sorh = 's';    % Specified soft or hard thresholding
thrSettings =  {...
    [...
    1.000000000000000   4096.000000000000000      0.562480395456473; ...
    ]; ...
    [...
    1.000000000000000   4096.000000000000000      0.677045184847093; ...
    ]; ...
    [...
    1.000000000000000   4096.000000000000000      0.815129752160284; ...
    ]; ...
    [...
    1.000000000000000   4096.000000000000000      1.267427828151786; ...
    ]; ...
    [...
    1.000000000000000   4096.000000000000000      1.970863297323307; ...
    ]; ...
    };

% Decompose using SWT.
%---------------------
wDEC = swt(SIG,level,wname);

% Denoise.
%---------
len = length(SIG);
for k = 1:level
    thr_par = thrSettings{k};
    if ~isempty(thr_par)
        NB_int = size(thr_par,1);
        x      = [thr_par(:,1) ; thr_par(NB_int,2)];
        x      = round(x);
        x(x<1) = 1;
        x(x>len) = len;
        thr = thr_par(:,3);
        for j = 1:NB_int
            if j==1 , d_beg = 0; else d_beg = 1; end
            j_beg = x(j)+d_beg;
            j_end = x(j+1);
            j_ind = (j_beg:j_end);
            wDEC(k,j_ind) = wthresh(wDEC(k,j_ind),sorh,thr(j));
        end
    end
end

% Reconstruct the denoise signal using ISWT.
%-------------------------------------------
sigDEN = iswt(wDEC,wname);