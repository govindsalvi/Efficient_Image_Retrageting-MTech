function [ga,gb,gc]=grad1(a,b,c)
% sz=size(a);
%  gax=zeros(sz(1),sz(2));
%  gbx=zeros(sz(1),sz(2));
%  gcx=zeros(sz(1),sz(2));
%  gay=zeros(sz(1),sz(2));
%  gby=zeros(sz(1),sz(2));
%  gcy=zeros(sz(1),sz(2));
 
 [gax,gay]=gradient(a);
 [gbx,gby]=gradient(b);
 [gcx,gcy]=gradient(c);
ga=gax+gay;
gb=gbx+gby;
gc=gcx+gcy;
end
