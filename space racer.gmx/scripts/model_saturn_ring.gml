saturn_ring_moded=d3d_model_create()
var inderradius=100*10
var outerradius=100*20
var prec=64
var radi
var radi2
d3d_model_primitive_begin(saturn_ring_moded, pr_trianglelist );
for (i=0;i<360;i+=360/prec)
  {
        
        radi=degtorad(i)
        radi2=degtorad(i+360/prec)
        //left inner
        d3d_model_vertex_normal_texture(saturn_ring_moded,cos(radi)*inderradius,sin(radi)*inderradius,0, 0,0,0,1,1);
        //left outer
        d3d_model_vertex_normal_texture(saturn_ring_moded,cos(radi)*outerradius,sin(radi)*outerradius,0, 0,0,0,0,1);
        //Right outer
        d3d_model_vertex_normal_texture(saturn_ring_moded,cos(radi2)*outerradius,sin(radi2)*outerradius,0, 0,0,0,0,0);
        
        //Right outer
        d3d_model_vertex_normal_texture(saturn_ring_moded,cos(radi2)*outerradius,sin(radi2)*outerradius,0, 0,0,0,0,0);
        //Right inner
        d3d_model_vertex_normal_texture(saturn_ring_moded,cos(radi2)*inderradius,sin(radi2)*inderradius,0, 0,0,0,1,0);
        //left inner
        d3d_model_vertex_normal_texture(saturn_ring_moded,cos(radi)*inderradius,sin(radi)*inderradius,0, 0,0,0,1,1);
        
  }
d3d_model_primitive_end(saturn_ring_moded);