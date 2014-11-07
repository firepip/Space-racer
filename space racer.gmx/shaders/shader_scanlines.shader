//
// Scanlines shader
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
// Scanlines shader
//

uniform float f_mHeight;
uniform float f_at;

varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;

void main()
{
    float number = 8.0;
    float check = 0.0;
    float linesize = 0.4;
    float at = ((1.0-f_at))*(f_mHeight/number);
    linesize = (1.0-linesize)*2.0;
    for (float i=0.0;i<=f_mHeight;i+=f_mHeight/number){
    if (v_vPosition.y>i-(f_mHeight/number/2.0)*(linesize)-at)
      {
      if (v_vPosition.y<=i-at)
        {
        check=1.0;
        }
      }
    }
    if (v_vPosition.y<-(f_mHeight/number/2.0)*(linesize)-at){
    check=1.0;
    }
if (check==1.0){
      gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
      }
}
