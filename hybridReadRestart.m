function [var,x,y,z,N,vars,t,step] = hybridReadRestart(filename,myformat,I,J,K,V,display)
%
%  Read hybrid restartfiles, possibly partially
%
printout=0; if exist('display')==1 if max(size(display))>0 printout=1; end;end; clear display


%
%  Semi-naive checking of bigendian -- note that bigendian only generated after version 4.7.10...
%
endian = 'n' ;
fid = fopen(filename,'r','ieee-be') ;
prec = fread(fid,1,'integer*4') ;
fclose(fid) ;
if ( prec == 4 ) | ( prec == 8 )
  endian = 'ieee-be' ;
end
fid = fopen(filename,'r',endian) ;


%
%  Precision and file version
%
format = 50001 ;
if exist('myformat') == 1  if max(size(myformat)) > 0  format=myformat ; end;end; clear myformat
if ( format < 40703 )
  prec = 8 ;
  version = 40702 ;
elseif ( format < 40710 )
  prec = fread(fid,1,'integer*4') ;
  version = 40703 ;
else
  prec = fread(fid,1,'integer*4') ;
  version = fread(fid,1,'integer*4') ;
end
clear format
v3 = mod(version,100) ;
v2 = mod(version-v3,10000) / 100 ;
v1 =    (version-v3-v2*100) / 10000 ;
if ( prec == 8 )
  if printout>0
    disp(['Reading ' , filename , ' in hybrid format ' , int2str(v1) , '.' , int2str(v2) , '.' , int2str(v3) , ' (double)'])
  end
elseif ( prec == 4 )
  if printout>0
    disp(['Reading ' , filename , ' in hybrid format ' , int2str(v1) , '.' , int2str(v2) , '.' , int2str(v3) , ' (float)'])
  end
else
  disp(['Error when trying to read ' , filename , ' -- unknown format'])
end

%
%  Read remaining header integers
%
step = fread(fid,1,'integer*4') ;
N    = fread(fid,3,'integer*4') ;
nvar = fread(fid,1,'integer*4') ;
vars = fread(fid,nvar,'integer*4') ;

%
%  Partial read adjustments
%
i = [1:N(1)] ;
j = [1:N(2)] ;
k = [1:N(3)] ;
v = [1:nvar] ;
if exist('I') == 1  if max(size(I)) > 0  i=I ; end;end
if exist('J') == 1  if max(size(J)) > 0  j=J ; end;end
if exist('K') == 1  if max(size(K)) > 0  k=K ; end;end
if exist('V') == 1  if max(size(V)) > 0  v=V ; end;end
J = [1:length(j)] ;
K = [1:length(k)] ;

%
%  Read header doubles
%
headerFloat=0; if ( prec == 4 ) & ( version < 50001 ) headerFloat=1; end
if ( headerFloat < 0.5 )
  t    = fread(fid,1,'double') ;
  tmp  = fread(fid,N(1),'double') ; x = tmp(i) ;
  tmp  = fread(fid,N(2),'double') ; y = tmp(j) ;
  tmp  = fread(fid,N(3),'double') ; z = tmp(k) ;
else
  t    = fread(fid,1,'float') ;
  tmp  = fread(fid,N(1),'float') ; x = tmp(i) ;
  tmp  = fread(fid,N(2),'float') ; y = tmp(j) ;
  tmp  = fread(fid,N(3),'float') ; z = tmp(k) ;
end

%
%  Read variables in way that compromises memory usage, speed, and flexibility...
%

%  Set up chunks
maxread = 1e7 ;
ni = floor( maxread/N(2)/N(3) ) ; ni = max(ni,1) ; nchunks = ceil( N(1)/ni ) ; clear ni
i1=1;
for chunk=1:nchunks-1,
  nleft = N(1)+1-i1(chunk) ;
  cleft = nchunks+1-chunk ;
  i1(chunk+1) = i1(chunk) + round( nleft/cleft ) ;
end
i1(nchunks+1) = N(1)+1 ;

vvv=0;
for vv=1:nvar,
  if min(abs(vv-v))>0
    fseek(fid,prod(N)*prec,0) ;
  else
    vvv=vvv+1;
    if length(i)==N(1)
      %  Read all i in chunks
      for chunk=1:nchunks,
        ii = [i1(chunk):i1(chunk+1)-1] ;
        ni = length(ii) ;
        if prec==8
          tmp = fread(fid,ni*N(2)*N(3),'double') ;
        else
          tmp = fread(fid,ni*N(2)*N(3),'float') ;
        end
        tmp = permute( reshape(tmp,N(3),N(2),ni) , [3 2 1] ) ;
        var(ii,J,K,vvv) = tmp(:,j,k) ;
      end
    else
      %  Read one i at a time
      iii=0;
      for ii=1:N(1),
        if min(abs(ii-i))>0
          fseek(fid,N(2)*N(3)*prec,0) ;
        else
          if prec==8
            tmp = fread(fid,N(2)*N(3),'double') ;
          else
            tmp = fread(fid,N(2)*N(3),'float') ;
          end
          tmp = permute( reshape(tmp,N(3),N(2)) , [3 2 1] ) ;
          iii=iii+1;
          var(iii,J,K,vvv) = tmp(1,j,k) ;
        end
      end
    end 
  end
end
fclose(fid) ;

%
%  Adjustments
%
N = [length(i) length(j) length(k)]' ;
if min(v)>=0
  vars = vars(v) ;
else
  var = -1 ;
  vars = -1 ;
end


