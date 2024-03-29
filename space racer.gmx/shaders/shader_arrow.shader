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
// Shader for arrow
//
uniform float f_at;
uniform float f_mHeight;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

void main()
{
float at = f_at+1.0;
    if (v_vPosition.y<at*f_mHeight)
        {
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
        }
}

