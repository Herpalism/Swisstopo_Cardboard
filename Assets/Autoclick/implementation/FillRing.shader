﻿
Shader "AutoClick/FillRing" {
  Properties {
    _InnerRing ("InnerRing", float) = 1
    _OuterRing ("OuterRing", float) = 2.0
    _Distance ("Distance", float) = 5.0
  }

  SubShader {
    Tags { "Queue"="Overlay" "IgnoreProjector"="True" "RenderType"="Transparent" }
    Pass {
      Blend SrcAlpha OneMinusSrcAlpha
      AlphaTest Off
      Cull Back
      Lighting Off
      ZWrite Off
      ZTest Always

      CGPROGRAM

      #pragma vertex vert
      #pragma fragment frag

      #include "UnityCG.cginc"

      uniform float _InnerRing;
      uniform float _OuterRing;
      uniform float _Distance;

      struct appdata {
        float4 vertex : POSITION;
        fixed4 color : COLOR;
      };

      struct v2f{
          float4 vertex : SV_POSITION;
          fixed4 color : COLOR;
      };

      v2f vert(appdata v) {

        v2f myv2f;
        myv2f.color=v.color;

        float scale = lerp(_OuterRing, _InnerRing, v.vertex.z);
        float4 vert = float4(v.vertex.x * scale, v.vertex.y * scale, _Distance, 1.0);
        myv2f.vertex = mul (UNITY_MATRIX_MVP, vert);

        return myv2f;
      }

      fixed4 frag(v2f i) : SV_Target {
        return i.color;       
      }

      ENDCG
    }
  }
}