% This procedure loads a sequence of images
%
% Arguments:
%   'path', refers to a directory which contains a sequence of JPEG or PPM
%   images
%   'reduce' is an optional parameter that controls downsampling, e.g., reduce = .5
%   downsamples all images by a factor of 2.
%
% tom.mertens@gmail.com, August 2007
%

function I = load_im(path)

% find all JPEG or PPM files in directory
files = dir([path '/*.jpg']);
N = length(files);
if (N == 0)
    files = dir([path '/*.ppm']);
    N = length(files);
    if (N == 0)
        error('no files found');
    end
end

% allocate memory
sz = size(imread([path '/' files(1).name]));
r = sz(1);
c = sz(2);
I = zeros(r,c,3,N);

% read all files
for i = 1:N
    
    % load image
    filename = [path '/' files(i).name];
    im = double(imread(filename)) / 255;
    if (size(im,1) ~= sz(1) || size(im,2) ~= sz(2))
        error('images must all have the same size');
    end    
    I(:,:,:,i) = im;
end
