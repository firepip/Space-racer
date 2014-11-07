//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;

uniform sampler2D second_texture;

void main()
{
if (texture2D(second_texture, v_vTexcoord )==vec4(1,1,1,1))
  {
  gl_FragColor = v_vColour;
  gl_FragColor.a = (v_vPosition.y*-1.0)/100.0;
  }
else
  {
    gl_FragColor = v_vColour;
    gl_FragColor = v_vColour;
    gl_FragColor.a = (v_vPosition.y*-1.0)/100.0;
    //gl_FragColor = vec4(0.0,0.0,0.8,0.2) ;
  }
}
