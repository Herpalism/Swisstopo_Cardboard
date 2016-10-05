// Compiled shader for Android, uncompressed size: 156.0KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/Transparent/DiffuseMinusOne" {
Properties {
 _Color ("Main Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //   gles hw_tier01 : 7 math, 1 texture
 //   gles hw_tier02 : 7 math, 1 texture
 //   gles hw_tier03 : 7 math, 1 texture
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
  GpuProgramID 59856
Program "vp" {
SubProgram "gles hw_tier01 " {
// Stats: 7 math, 1 textures
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  mediump vec3 normal_8;
  normal_8 = worldNormal_1;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normal_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_9);
  x_11.y = dot (unity_SHAg, tmpvar_9);
  x_11.z = dot (unity_SHAb, tmpvar_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_8.xyzz * normal_8.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  res_10 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), res_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = (c_8.xyz + (tmpvar_6.xyz * xlv_TEXCOORD3));
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 7 math, 1 textures
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  mediump vec3 normal_8;
  normal_8 = worldNormal_1;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normal_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_9);
  x_11.y = dot (unity_SHAg, tmpvar_9);
  x_11.z = dot (unity_SHAb, tmpvar_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_8.xyzz * normal_8.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  res_10 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), res_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = (c_8.xyz + (tmpvar_6.xyz * xlv_TEXCOORD3));
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 7 math, 1 textures
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  mediump vec3 normal_8;
  normal_8 = worldNormal_1;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normal_8;
  mediump vec3 res_10;
  mediump vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_9);
  x_11.y = dot (unity_SHAg, tmpvar_9);
  x_11.z = dot (unity_SHAb, tmpvar_9);
  mediump vec3 x1_12;
  mediump vec4 tmpvar_13;
  tmpvar_13 = (normal_8.xyzz * normal_8.yzzx);
  x1_12.x = dot (unity_SHBr, tmpvar_13);
  x1_12.y = dot (unity_SHBg, tmpvar_13);
  x1_12.z = dot (unity_SHBb, tmpvar_13);
  res_10 = (x_11 + (x1_12 + (unity_SHC.xyz * 
    ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y))
  )));
  res_10 = max (((1.055 * 
    pow (max (res_10, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD3 = max (vec3(0.0, 0.0, 0.0), res_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = (c_8.xyz + (tmpvar_6.xyz * xlv_TEXCOORD3));
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
// Stats: 7 math, 1 textures
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].x;
  v_6.y = unity_WorldToObject[1].x;
  v_6.z = unity_WorldToObject[2].x;
  v_6.w = unity_WorldToObject[3].x;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].y;
  v_7.y = unity_WorldToObject[1].y;
  v_7.z = unity_WorldToObject[2].y;
  v_7.w = unity_WorldToObject[3].y;
  highp vec4 v_8;
  v_8.x = unity_WorldToObject[0].z;
  v_8.y = unity_WorldToObject[1].z;
  v_8.z = unity_WorldToObject[2].z;
  v_8.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(((
    (v_6.xyz * _glesNormal.x)
   + 
    (v_7.xyz * _glesNormal.y)
  ) + (v_8.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_9;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 normal_15;
  normal_15 = worldNormal_1;
  highp vec3 col_16;
  highp vec4 ndotl_17;
  highp vec4 lengthSq_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  ndotl_17 = (tmpvar_19 * normal_15.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * normal_15.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * normal_15.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(lengthSq_18)));
  ndotl_17 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (lengthSq_18 * lightAttenSq_14)
  ))));
  col_16 = (lightColor0_10 * tmpvar_23.x);
  col_16 = (col_16 + (lightColor1_11 * tmpvar_23.y));
  col_16 = (col_16 + (lightColor2_12 * tmpvar_23.z));
  col_16 = (col_16 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_3 = col_16;
  mediump vec3 normal_24;
  normal_24 = worldNormal_1;
  mediump vec3 ambient_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_24;
  mediump vec3 res_27;
  mediump vec3 x_28;
  x_28.x = dot (unity_SHAr, tmpvar_26);
  x_28.y = dot (unity_SHAg, tmpvar_26);
  x_28.z = dot (unity_SHAb, tmpvar_26);
  mediump vec3 x1_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = (normal_24.xyzz * normal_24.yzzx);
  x1_29.x = dot (unity_SHBr, tmpvar_30);
  x1_29.y = dot (unity_SHBg, tmpvar_30);
  x1_29.z = dot (unity_SHBb, tmpvar_30);
  res_27 = (x_28 + (x1_29 + (unity_SHC.xyz * 
    ((normal_24.x * normal_24.x) - (normal_24.y * normal_24.y))
  )));
  res_27 = max (((1.055 * 
    pow (max (res_27, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_25 = (tmpvar_3 + max (vec3(0.0, 0.0, 0.0), res_27));
  tmpvar_3 = ambient_25;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = ambient_25;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = (c_8.xyz + (tmpvar_6.xyz * xlv_TEXCOORD3));
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 7 math, 1 textures
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].x;
  v_6.y = unity_WorldToObject[1].x;
  v_6.z = unity_WorldToObject[2].x;
  v_6.w = unity_WorldToObject[3].x;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].y;
  v_7.y = unity_WorldToObject[1].y;
  v_7.z = unity_WorldToObject[2].y;
  v_7.w = unity_WorldToObject[3].y;
  highp vec4 v_8;
  v_8.x = unity_WorldToObject[0].z;
  v_8.y = unity_WorldToObject[1].z;
  v_8.z = unity_WorldToObject[2].z;
  v_8.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(((
    (v_6.xyz * _glesNormal.x)
   + 
    (v_7.xyz * _glesNormal.y)
  ) + (v_8.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_9;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 normal_15;
  normal_15 = worldNormal_1;
  highp vec3 col_16;
  highp vec4 ndotl_17;
  highp vec4 lengthSq_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  ndotl_17 = (tmpvar_19 * normal_15.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * normal_15.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * normal_15.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(lengthSq_18)));
  ndotl_17 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (lengthSq_18 * lightAttenSq_14)
  ))));
  col_16 = (lightColor0_10 * tmpvar_23.x);
  col_16 = (col_16 + (lightColor1_11 * tmpvar_23.y));
  col_16 = (col_16 + (lightColor2_12 * tmpvar_23.z));
  col_16 = (col_16 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_3 = col_16;
  mediump vec3 normal_24;
  normal_24 = worldNormal_1;
  mediump vec3 ambient_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_24;
  mediump vec3 res_27;
  mediump vec3 x_28;
  x_28.x = dot (unity_SHAr, tmpvar_26);
  x_28.y = dot (unity_SHAg, tmpvar_26);
  x_28.z = dot (unity_SHAb, tmpvar_26);
  mediump vec3 x1_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = (normal_24.xyzz * normal_24.yzzx);
  x1_29.x = dot (unity_SHBr, tmpvar_30);
  x1_29.y = dot (unity_SHBg, tmpvar_30);
  x1_29.z = dot (unity_SHBb, tmpvar_30);
  res_27 = (x_28 + (x1_29 + (unity_SHC.xyz * 
    ((normal_24.x * normal_24.x) - (normal_24.y * normal_24.y))
  )));
  res_27 = max (((1.055 * 
    pow (max (res_27, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_25 = (tmpvar_3 + max (vec3(0.0, 0.0, 0.0), res_27));
  tmpvar_3 = ambient_25;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = ambient_25;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = (c_8.xyz + (tmpvar_6.xyz * xlv_TEXCOORD3));
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 7 math, 1 textures
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].x;
  v_6.y = unity_WorldToObject[1].x;
  v_6.z = unity_WorldToObject[2].x;
  v_6.w = unity_WorldToObject[3].x;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].y;
  v_7.y = unity_WorldToObject[1].y;
  v_7.z = unity_WorldToObject[2].y;
  v_7.w = unity_WorldToObject[3].y;
  highp vec4 v_8;
  v_8.x = unity_WorldToObject[0].z;
  v_8.y = unity_WorldToObject[1].z;
  v_8.z = unity_WorldToObject[2].z;
  v_8.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(((
    (v_6.xyz * _glesNormal.x)
   + 
    (v_7.xyz * _glesNormal.y)
  ) + (v_8.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_9;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_10;
  lightColor0_10 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_11;
  lightColor1_11 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_12;
  lightColor2_12 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_13;
  lightColor3_13 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_14;
  lightAttenSq_14 = unity_4LightAtten0;
  highp vec3 normal_15;
  normal_15 = worldNormal_1;
  highp vec3 col_16;
  highp vec4 ndotl_17;
  highp vec4 lengthSq_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_5.x);
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_5.y);
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_5.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  ndotl_17 = (tmpvar_19 * normal_15.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * normal_15.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * normal_15.z));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(lengthSq_18)));
  ndotl_17 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (lengthSq_18 * lightAttenSq_14)
  ))));
  col_16 = (lightColor0_10 * tmpvar_23.x);
  col_16 = (col_16 + (lightColor1_11 * tmpvar_23.y));
  col_16 = (col_16 + (lightColor2_12 * tmpvar_23.z));
  col_16 = (col_16 + (lightColor3_13 * tmpvar_23.w));
  tmpvar_3 = col_16;
  mediump vec3 normal_24;
  normal_24 = worldNormal_1;
  mediump vec3 ambient_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_24;
  mediump vec3 res_27;
  mediump vec3 x_28;
  x_28.x = dot (unity_SHAr, tmpvar_26);
  x_28.y = dot (unity_SHAg, tmpvar_26);
  x_28.z = dot (unity_SHAb, tmpvar_26);
  mediump vec3 x1_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = (normal_24.xyzz * normal_24.yzzx);
  x1_29.x = dot (unity_SHBr, tmpvar_30);
  x1_29.y = dot (unity_SHBg, tmpvar_30);
  x1_29.z = dot (unity_SHBb, tmpvar_30);
  res_27 = (x_28 + (x1_29 + (unity_SHC.xyz * 
    ((normal_24.x * normal_24.x) - (normal_24.y * normal_24.y))
  )));
  res_27 = max (((1.055 * 
    pow (max (res_27, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  ambient_25 = (tmpvar_3 + max (vec3(0.0, 0.0, 0.0), res_27));
  tmpvar_3 = ambient_25;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = ambient_25;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = (c_8.xyz + (tmpvar_6.xyz * xlv_TEXCOORD3));
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat0.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat1 * u_xlat1 + u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat2 * u_xlat1;
    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_5.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_5.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat0.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat1 * u_xlat1 + u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat2 * u_xlat1;
    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_5.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_5.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat0.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat1 * u_xlat1 + u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat2 * u_xlat1;
    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_5.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_5.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on gles"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on gles3"
}
}
 }


 // Stats for Vertex shader:
 //   gles hw_tier01 : 10 avg math (5..17), 2 avg texture (1..3)
 //   gles hw_tier02 : 10 avg math (5..17), 2 avg texture (1..3)
 //   gles hw_tier03 : 10 avg math (5..17), 2 avg texture (1..3)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha One
  ColorMask RGB
  GpuProgramID 93828
Program "vp" {
SubProgram "gles hw_tier01 " {
// Stats: 11 math, 2 textures
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xyz;
  highp float tmpvar_9;
  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
  lowp float tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, vec2(tmpvar_9)).w;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_10);
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_6.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  gl_FragData[0] = c_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 11 math, 2 textures
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xyz;
  highp float tmpvar_9;
  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
  lowp float tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, vec2(tmpvar_9)).w;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_10);
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_6.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  gl_FragData[0] = c_11;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 11 math, 2 textures
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xyz;
  highp float tmpvar_9;
  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
  lowp float tmpvar_10;
  tmpvar_10 = texture2D (_LightTexture0, vec2(tmpvar_9)).w;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_10);
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_6.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  gl_FragData[0] = c_11;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_3;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xx).w;
    u_xlat16_3.xyz = u_xlat10_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_3;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xx).w;
    u_xlat16_3.xyz = u_xlat10_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_3;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xx).w;
    u_xlat16_3.xyz = u_xlat10_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
// Stats: 5 math, 1 textures
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 5 math, 1 textures
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 5 math, 1 textures
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  lowp vec4 c_7;
  lowp vec4 c_8;
  lowp float diff_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_9 = tmpvar_10;
  c_8.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_9);
  c_8.w = tmpvar_6.w;
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
// Stats: 17 math, 3 textures
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_WorldToLight * tmpvar_8);
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((tmpvar_9.xy / tmpvar_9.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (tmpvar_9.xyz, tmpvar_9.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  highp float tmpvar_14;
  tmpvar_14 = ((float(
    (tmpvar_9.z > 0.0)
  ) * tmpvar_10.w) * tmpvar_13.w);
  atten_3 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_7.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 17 math, 3 textures
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_WorldToLight * tmpvar_8);
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((tmpvar_9.xy / tmpvar_9.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (tmpvar_9.xyz, tmpvar_9.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  highp float tmpvar_14;
  tmpvar_14 = ((float(
    (tmpvar_9.z > 0.0)
  ) * tmpvar_10.w) * tmpvar_13.w);
  atten_3 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_7.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 17 math, 3 textures
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp float atten_3;
  lowp vec3 tmpvar_4;
  lowp vec3 lightDir_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_5 = tmpvar_6;
  tmpvar_4 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = xlv_TEXCOORD2;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_WorldToLight * tmpvar_8);
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((tmpvar_9.xy / tmpvar_9.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (tmpvar_9.xyz, tmpvar_9.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  highp float tmpvar_14;
  tmpvar_14 = ((float(
    (tmpvar_9.z > 0.0)
  ) * tmpvar_10.w) * tmpvar_13.w);
  atten_3 = tmpvar_14;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  tmpvar_1 = (tmpvar_1 * atten_3);
  lowp vec4 c_15;
  lowp vec4 c_16;
  lowp float diff_17;
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_4, tmpvar_2));
  diff_17 = tmpvar_18;
  c_16.xyz = ((tmpvar_7.xyz * tmpvar_1) * diff_17);
  c_16.w = tmpvar_7.w;
  c_15.w = c_16.w;
  c_15.xyz = c_16.xyz;
  gl_FragData[0] = c_15;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
uniform lowp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
lowp float u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
lowp float u_xlat10_12;
mediump float u_xlat16_15;
void main()
{
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_12 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat10_2 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat10_2 = u_xlat10_12 * u_xlat10_2;
    u_xlat10_2 = u_xlat10_0.x * u_xlat10_2;
    u_xlat16_3.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
uniform lowp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
lowp float u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
lowp float u_xlat10_12;
mediump float u_xlat16_15;
void main()
{
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_12 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat10_2 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat10_2 = u_xlat10_12 * u_xlat10_2;
    u_xlat10_2 = u_xlat10_0.x * u_xlat10_2;
    u_xlat16_3.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
uniform lowp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
lowp float u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
lowp float u_xlat10_12;
mediump float u_xlat16_15;
void main()
{
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_12 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat10_2 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat10_2 = u_xlat10_12 * u_xlat10_2;
    u_xlat10_2 = u_xlat10_0.x * u_xlat10_2;
    u_xlat16_3.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
// Stats: 12 math, 3 textures
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xyz;
  highp float tmpvar_9;
  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
  lowp float tmpvar_10;
  tmpvar_10 = (texture2D (_LightTextureB0, vec2(tmpvar_9)).w * textureCube (_LightTexture0, tmpvar_8).w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_10);
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_6.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  gl_FragData[0] = c_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 12 math, 3 textures
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xyz;
  highp float tmpvar_9;
  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
  lowp float tmpvar_10;
  tmpvar_10 = (texture2D (_LightTextureB0, vec2(tmpvar_9)).w * textureCube (_LightTexture0, tmpvar_8).w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_10);
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_6.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  gl_FragData[0] = c_11;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 12 math, 3 textures
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2));
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xyz;
  highp float tmpvar_9;
  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
  lowp float tmpvar_10;
  tmpvar_10 = (texture2D (_LightTextureB0, vec2(tmpvar_9)).w * textureCube (_LightTexture0, tmpvar_8).w);
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_10);
  lowp vec4 c_11;
  lowp vec4 c_12;
  lowp float diff_13;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_13 = tmpvar_14;
  c_12.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_13);
  c_12.w = tmpvar_6.w;
  c_11.w = c_12.w;
  c_11.xyz = c_12.xyz;
  gl_FragData[0] = c_11;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp float u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xyz).w;
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat6)).w;
    u_xlat16_0.x = u_xlat10_0.x * u_xlat10_2;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp float u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xyz).w;
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat6)).w;
    u_xlat16_0.x = u_xlat10_0.x * u_xlat10_2;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp float u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat6;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xyz).w;
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat6)).w;
    u_xlat16_0.x = u_xlat10_0.x * u_xlat10_2;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
// Stats: 8 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec2 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xy;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_LightTexture0, tmpvar_8).w;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_9);
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_6.w;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
// Stats: 8 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec2 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xy;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_LightTexture0, tmpvar_8).w;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_9);
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_6.w;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
// Stats: 8 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec3 lightDir_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_4 = tmpvar_5;
  tmpvar_3 = xlv_TEXCOORD1;
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = xlv_TEXCOORD2;
  highp vec2 tmpvar_8;
  tmpvar_8 = (unity_WorldToLight * tmpvar_7).xy;
  lowp float tmpvar_9;
  tmpvar_9 = texture2D (_LightTexture0, tmpvar_8).w;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_4;
  tmpvar_1 = (tmpvar_1 * tmpvar_9);
  lowp vec4 c_10;
  lowp vec4 c_11;
  lowp float diff_12;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_3, tmpvar_2));
  diff_12 = tmpvar_13;
  c_11.xyz = ((tmpvar_6.xyz * tmpvar_1) * diff_12);
  c_11.w = tmpvar_6.w;
  c_10.w = c_11.w;
  c_10.xyz = c_11.xyz;
  gl_FragData[0] = c_10;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4unity_WorldToLight[3].xy;
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xy).w;
    u_xlat16_1.xyz = u_xlat10_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_7 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_1.xyz = vec3(u_xlat16_7) * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4unity_WorldToLight[3].xy;
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xy).w;
    u_xlat16_1.xyz = u_xlat10_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_7 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_1.xyz = vec3(u_xlat16_7) * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	lowp vec4 _Color;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4unity_WorldToLight[3].xy;
    u_xlat10_0.x = texture(_LightTexture0, u_xlat0.xy).w;
    u_xlat16_1.xyz = u_xlat10_0.xxx * _LightColor0.xyz;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_7 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_1.xyz = vec3(u_xlat16_7) * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT" }
"// shader disassembly not supported on gles"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on gles"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier03 " {
Keywords { "SPOT" }
"// shader disassembly not supported on gles"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SPOT" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on gles"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on gles"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on gles"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on gles3"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on gles3"
}
}
 }
}
Fallback "Legacy Shaders/Transparent/VertexLit"
}