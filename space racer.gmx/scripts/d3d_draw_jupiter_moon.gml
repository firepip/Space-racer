var tex2=background_get_texture(argument4)
d3d_transform_set_identity();
d3d_transform_add_rotation_x(270)
d3d_transform_add_rotation_y(-rot/(argument3/1700)+argument1)
d3d_transform_add_rotation_z(argument2)
d3d_transform_add_translation(pathpx[5],pathpy[5],pathpz[5]);
d3d_model_draw(argument0,0,argument3,0,tex2)
d3d_transform_set_identity();