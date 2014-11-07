attribute vec3 in_Position;

uniform vec4 uProjMat0;             // projection matrix column 0.
uniform vec4 uProjMat1;             // projection matrix column 1.
uniform vec4 uProjMat2;             // projection matrix column 2.
uniform vec4 uProjMat3;             // projection matrix column 3.
uniform vec4 uEyeMat0;              // eye matrix column 0.
uniform vec4 uEyeMat1;              // eye matrix column 1.
uniform vec4 uEyeMat2;              // eye matrix column 2.
uniform vec4 uEyeMat3;              // eye matrix column 3.
uniform vec3 uSunPos;               // sun position on sky dome.
uniform float uSunHorFactor;        // horizontal sun factor.
uniform float uSunVertFactor;       // vertical sun factor.
uniform float uScale;               // image scale.

varying vec3 vPosition;             // output current vertex position of dome.
varying vec3 vSunPos;               // output sun position on sky dome.
varying float vSunHorIntensity;     // output horizontal sun intensity factor.
varying float vSunHorIntensityP;    // output horizontal sun powered intensity factor.
varying float vSunVertIntensity;    // output vertical sun intensity factor.
varying float vSunVertIntensityNP;  // output vertical sun powered inversed instensity factor.

void main()
{
    // assemble projection matrix.
    mat4 proj = mat4(uProjMat0, uProjMat1, uProjMat2, uProjMat3);
    
    // assemble eye matrix.
    mat4 eye = mat4(uEyeMat0, uEyeMat1, uEyeMat2, uEyeMat3);
    
    // write vertex position of dome to fragment shader.
    vPosition = (eye * vec4(1.0, in_Position.xy, 1.0)).xyz;
    
    // write sun position to fragment shader.
    vSunPos = uSunPos;
    
    // calculate sun horizontal normal intensity and powered intensity values to fragment shader.
    vSunHorIntensity = dot(normalize(vec3(uSunPos.xy, 0.0)), normalize(uSunPos));
    vSunHorIntensity = clamp(vSunHorIntensity, 0.0, 1.0);
    vSunHorIntensityP = pow(vSunHorIntensity, uSunHorFactor);
    
    // calculate sun vertical normal intensity and powered inversed intensity values to fragment shader.
    vSunVertIntensity = dot(vec3(0.0, 0.0, 1.0), normalize(uSunPos));
    vSunVertIntensity = abs(clamp(vSunVertIntensity, -1.0, 0.0));
    vSunVertIntensityNP = pow(1.0 - vSunVertIntensity, uSunVertFactor);
    
    // calculate final vertex position in screen space and write to output.
    vec3 vp = vec3(in_Position.x * uScale, in_Position.y * uScale, -1.0);
    gl_Position = proj * vec4(vp, 1.0);
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform vec3 uSkyColor;
uniform vec3 uSkyColorRed;
uniform vec3 uSunColorYellow;
uniform vec3 uSunColorAura;
uniform float uSunPosFactor;
uniform float uPosHorFactor;
varying vec3 vPosition;
varying vec3 vSunPos;
varying float vSunHorIntensity;
varying float vSunHorIntensityP;
varying float vSunVertIntensity;
varying float vSunVertIntensityNP;

void main()
{
    // calculate sun main intensity (between current mapped point on sky dome and sun position).
    float sunInt = dot(normalize(vPosition), normalize(vSunPos));
    sunInt = clamp(sunInt, 0.0, 1.0);
    float sunIntP = pow(sunInt, uSunPosFactor);
    
    // calculate sun horizontal intensity (depends on how high on sky dome the sun is positioned).
    float horPosInt = dot(normalize(vec3(vPosition.xy, 0.0)), normalize(vPosition));
    horPosInt = clamp(horPosInt, 0.0, 1.0);
    float horPosIntP = pow(horPosInt, uPosHorFactor);
    
    // set default sky color.
    vec4 sky = vec4(uSkyColor, vSunVertIntensityNP);
    
    // calculate sky redness (depends on how low on sky dome the sun is positioned).
    float f = horPosInt * vSunHorIntensityP * sunInt;
    sky += vec4(uSkyColorRed - uSkyColor, 1.0) * vec4(clamp(f, 0.0, 1.0));
    
    // calculate horizontal sky color (depends on how low on sky dome the sun is positioned).
    sky += vec4(uSunColorAura, 1.0) * vec4(horPosIntP * 0.5 * (1.0 - vSunVertIntensity));
    
    // calculate sun color (depends on sun position on sky dome) and add to sky color.
    sky += vec4(mix(vec3(sunIntP), uSunColorYellow * vec3(sunIntP), vec3(vSunHorIntensity)), sunIntP);
    
    // write final sky color to output.
    gl_FragColor = sky;
}

