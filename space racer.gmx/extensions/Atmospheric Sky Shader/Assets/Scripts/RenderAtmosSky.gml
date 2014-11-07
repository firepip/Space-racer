/// RenderAtmosSky(view, fov, zNear, zFar, sunAlpha, sunBeta, eyeBeta, skyVB)
// Render Sky Dome on a screen-space plane.
//
// author: Patryk "PsichiX" Budzynski.
// contact: fb.com/PsichiX
//
// argument0:   target view ID.
// argument1:   field of view angle (degrees).
// argument2:   Z-near (default: 1).
// argument3:   Z-far (default: 11).
// argument4:   sun alpha direction angle.
// argument5:   sun beta direction angle.
// argument6:   eye beta angle.
// argument7:   sky dome vertex buffer ID.
//
// return:      false if invalid values are provided, true otherwise.
//

if(view_current != argument0)
    return false;

if(view_hview[argument0] <= 0.0 || argument1 <= 0.0)
    return false;

// calculate aspect ratio.
var aspect = view_wview[argument0] / view_hview[argument0];

// calculate perspective projection matrix.
var fov = 1.0 / tan(degtorad(argument1));
var zr = argument2 - argument3;
var proj00 = fov / aspect;
var proj01 = 0.0;
var proj02 = 0.0;
var proj03 = 0.0;
var proj10 = 0.0;
var proj11 = fov;
var proj12 = 0.0;
var proj13 = 0.0;
var proj20 = 0.0;
var proj21 = 0.0;
var proj22 = (argument3 + argument2) / zr;
var proj23 = -1.0;
var proj30 = 0.0;
var proj31 = 0.0;
var proj32 = (2.0 * argument3 * argument2) / zr;
var proj33 = 0.0;

// calculate eye transform matrix.
var eye = matrix_build(0.0, 0.0, 0.0, 0.0, argument6, 0.0, 1, 1, 1);

// obtain shader uniforms.
var uProjMat0 = shader_get_uniform(fxAtmos, "uProjMat0");
var uProjMat1 = shader_get_uniform(fxAtmos, "uProjMat1");
var uProjMat2 = shader_get_uniform(fxAtmos, "uProjMat2");
var uProjMat3 = shader_get_uniform(fxAtmos, "uProjMat3");
var uEyeMat0 = shader_get_uniform(fxAtmos, "uEyeMat0");
var uEyeMat1 = shader_get_uniform(fxAtmos, "uEyeMat1");
var uEyeMat2 = shader_get_uniform(fxAtmos, "uEyeMat2");
var uEyeMat3 = shader_get_uniform(fxAtmos, "uEyeMat3");
var uSunPos = shader_get_uniform(fxAtmos, "uSunPos");
var uSkyColor = shader_get_uniform(fxAtmos, "uSkyColor");
var uSkyColorRed = shader_get_uniform(fxAtmos, "uSkyColorRed");
var uSunColorYellow = shader_get_uniform(fxAtmos, "uSunColorYellow");
var uSunColorAura = shader_get_uniform(fxAtmos, "uSunColorAura");
var uSunPosFactor = shader_get_uniform(fxAtmos, "uSunPosFactor");
var uSunHorFactor = shader_get_uniform(fxAtmos, "uSunHorFactor");
var uSunVertFactor = shader_get_uniform(fxAtmos, "uSunVertFactor");
var uPosHorFactor = shader_get_uniform(fxAtmos, "uPosHorFactor");
var uScale = shader_get_uniform(fxAtmos, "uScale");

// calculate sun position.
var sunX = cos(degtorad(argument4)) * cos(degtorad(argument5));
var sunY = sin(degtorad(argument4)) * cos(degtorad(argument5));
var sunZ = sin(degtorad(argument5));

// bind shader.
shader_set(fxAtmos);

// send uniforms to shader program.
shader_set_uniform_f(uProjMat0, proj00, proj01, proj02, proj03);
shader_set_uniform_f(uProjMat1, proj10, proj11, proj12, proj13);
shader_set_uniform_f(uProjMat2, proj20, proj21, proj22, proj23);
shader_set_uniform_f(uProjMat3, proj30, proj31, proj32, proj33);
shader_set_uniform_f(uEyeMat0, eye[0], eye[4], eye[8], eye[12]);
shader_set_uniform_f(uEyeMat1, eye[1], eye[5], eye[9], eye[13]);
shader_set_uniform_f(uEyeMat2, eye[2], eye[6], eye[10], eye[14]);
shader_set_uniform_f(uEyeMat3, eye[3], eye[7], eye[11], eye[15]);
shader_set_uniform_f(uSunPos, sunX, sunY, sunZ);
shader_set_uniform_f(
    uSkyColor,
    0.42745098039215686274509803921569,
    0.51372549019607843137254901960784,
    0.85490196078431372549019607843137
);
shader_set_uniform_f(uSkyColorRed, 1.0, 0.5, 0.0);
shader_set_uniform_f(uSunColorYellow, 1.0, 1.0, 0.0);
shader_set_uniform_f(uSunColorAura, 1.0, 1.0, 0.25);
shader_set_uniform_f(uSunPosFactor, 100.0);
shader_set_uniform_f(uSunHorFactor, 20.0);
shader_set_uniform_f(uSunVertFactor, 10.0);
shader_set_uniform_f(uPosHorFactor, 30.0);
shader_set_uniform_f(uScale, aspect * aspect * aspect);

// draw rectangle (shader will draw it in screen-space).
vertex_submit(argument7, pr_trianglelist, -1);

// reset to main shader.
shader_reset();

return true;

