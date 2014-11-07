var tex2=background_get_texture(argument5)
d3d_transform_set_identity();
d3d_transform_add_rotation_x(270)
d3d_transform_add_rotation_y(-rot)
d3d_transform_add_rotation_z(argument4)
d3d_transform_add_translation(argument1,argument2,argument3);
d3d_model_draw(argument0,0,0,0,tex2)
d3d_transform_set_identity();