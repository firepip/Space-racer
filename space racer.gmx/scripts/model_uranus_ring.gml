uranus_ring_model=d3d_model_create()
var inderradius=100*4
var outerradius=100*8
var prec=64
var radi
var radi2
d3d_model_primitive_begin(uranus_ring_model, pr_trianglelist );
for (i=0;i<360;i+=360/prec)
  {
        
        radi=degtorad(i)
        radi2=degtorad(i+360/prec)
        //left inner
        d3d_model_vertex_normal_texture(uranus_ring_model,cos(radi)*inderradius,sin(radi)*inderradius,0, 0,0,0,1,1);
        //left outer
        d3d_model_vertex_normal_texture(uranus_ring_model,cos(radi)*outerradius,sin(radi)*outerradius,0, 0,0,0,0,1);
        //Right outer
        d3d_model_vertex_normal_texture(uranus_ring_model,cos(radi2)*outerradius,sin(radi2)*outerradius,0, 0,0,0,0,0);
        
        //Right outer
        d3d_model_vertex_normal_texture(uranus_ring_model,cos(radi2)*outerradius,sin(radi2)*outerradius,0, 0,0,0,0,0);
        //Right inner
        d3d_model_vertex_normal_texture(uranus_ring_model,cos(radi2)*inderradius,sin(radi2)*inderradius,0, 0,0,0,1,0);
        //left inner
        d3d_model_vertex_normal_texture(uranus_ring_model,cos(radi)*inderradius,sin(radi)*inderradius,0, 0,0,0,1,1);
        
  }
d3d_model_primitive_end(uranus_ring_model);