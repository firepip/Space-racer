var inde=argument0;
var zdist = pathpz[inde]-atz;
var xdist = pathpx[inde]-atx;
var ddist = power(power(zdist,2)+power(xdist,2),0.5);
var dangle = radtodeg(arcsin(xdist/ddist));
var mult=1;
if atx<pathpx[inde]
  mult=-1
if inde=1
  mult=-1
if inde=3
  mult=-1
if inde=4
  mult=-1
if inde=5
  mult=-1
if inde=7
  mult=-1
d3d_transform_add_rotation_y(180+dangle*mult)