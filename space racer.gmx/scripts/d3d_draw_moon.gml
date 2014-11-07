var tex2=background_get_texture(moonmap)
d3d_transform_set_identity();
d3d_transform_add_rotation_x(270)
d3d_transform_add_rotation_y(-rot)
d3d_transform_add_rotation_z(0)
d3d_transform_add_translation(pathpx[3],pathpy[3],pathpz[3]);
d3d_model_draw(modelmoon,0,300,0,tex2)
d3d_transform_set_identity();