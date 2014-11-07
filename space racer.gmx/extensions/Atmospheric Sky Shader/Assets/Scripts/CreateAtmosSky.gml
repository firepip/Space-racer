/// CreateAtmosSky()
// Create Sky Dome vertex buffer.
//
// author: Patryk "PsichiX" Budzynski.
// contact: fb.com/PsichiX
//
// return:      vertex buffer ID.
//

vertex_format_begin();
vertex_format_add_position_3d();
var fmt = vertex_format_end();

var vb = vertex_create_buffer_ext(4);
vertex_begin(vb, fmt);
vertex_position_3d(vb, -1, -1, 0.0);
vertex_position_3d(vb, 1, -1, 0.0);
vertex_position_3d(vb, 1, 1, 0.0);
vertex_position_3d(vb, 1, 1, 0.0);
vertex_position_3d(vb, -1, 1, 0.0);
vertex_position_3d(vb, -1, -1, 0.0);
vertex_end(vb);
vertex_freeze(vb);

return vb;

