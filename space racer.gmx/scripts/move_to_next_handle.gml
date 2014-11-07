var trak=0;
if at=7
  trak=-1000
if point_distance_3d(pathpx[at],pathpy[at],(pathpz[at]+trak),atx,aty,atz)>pathpr[at]*6 and debugg<1
  {
var speedd=15;
speedd=point_distance_3d(pathpx[at],pathpy[at],(pathpz[at]+trak),pathpx[at-1],pathpy[at-1],pathpz[at-1])/speedd
speedd=min(speedd,abs(point_distance_3d(pathpx[at],pathpy[at],(pathpz[at]+trak),atx,aty,atz)-pathpr[at]*6))

if speedd=abs(point_distance_3d(pathpx[at],pathpy[at],(pathpz[at]+trak),atx,aty,atz)-pathpr[at]*6)
  {
  debugg++
  }
var vx=pathpx[at]-atx;
var vy=pathpy[at]-aty;
var vz=(pathpz[at]+trak)-atz;
var dist=point_distance_3d(0,0,0,vx,vy,vz);
var enx=vx/dist;
var eny=vy/dist;
var enz=vz/dist;
if enx*speedd>0
  atx=min(pathpx[at]-atx,enx*speedd)+atx
else
  atx=max(pathpx[at]-atx,enx*speedd)+atx
if eny*speedd>0
  aty=min(pathpy[at]-aty,eny*speedd)+aty
else
  aty=max(pathpy[at]-aty,eny*speedd)+aty
if enz*speedd>0
  atz=min((pathpz[at]+trak)-atz,enz*speedd)+atz
else
  atz=max((pathpz[at]+trak)-atz,enz*speedd)+atz


  
  
  
  
  
if point_distance_3d(pathpx[at],pathpy[at],(pathpz[at]+trak),px,py,pz)>0
  {
var speedd=8;
speedd=point_distance_3d(pathpx[at],pathpy[at],(pathpz[at]+trak),pathpx[at-1],pathpy[at-1],pathpz[at-1])/speedd

    
var vx=pathpx[at]-px;
var vy=pathpy[at]-py;
var vz=(pathpz[at]+trak)-pz;
var dist=point_distance_3d(0,0,0,vx,vy,vz);
var enx=vx/dist;
var eny=vy/dist;
var enz=vz/dist;
if enx*speedd>0
  px=min(pathpx[at]-px,enx*speedd)+px
else
  px=max(pathpx[at]-px,enx*speedd)+px
if eny*speedd>0
  py=min(pathpy[at]-py,eny*speedd)+py
else
  py=max(pathpy[at]-py,eny*speedd)+py
if enz*speedd>0
  pz=min((pathpz[at]+trak)-pz,enz*speedd)+pz
else
  pz=max((pathpz[at]+trak)-pz,enz*speedd)+pz
}
  }
else
    {
    //scanlines
    traise=true
    }
