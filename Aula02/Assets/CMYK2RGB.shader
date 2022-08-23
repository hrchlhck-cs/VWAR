Shader "Custom/Color"
{
    Properties
    {
        _Cyan ("Cyan", Range(0, 1)) = 0.5 
        _Yellow ("Yellow", Range(0, 1)) = 0.5 
        _Magenta ("Magenta", Range(0, 1)) = 0.5 
        _Black ("Black", Range(0, 1)) = 0.5 
    }
    SubShader
    {
        Pass {
        CGPROGRAM
        
        #pragma vertex vert
        #pragma fragment frag

        float4 _Color;
        float _Cyan;
        float _Yellow;
        float _Magenta;
        float _Black;

        float4 vert(float4 vertexPos: POSITION): SV_POSITION {
            return UnityObjectToClipPos(vertexPos);
        }

        float4 frag(): Color {
            float r, g, b;
            r = 1.0 * (1.0 - _Cyan / 1.0) * (1.0 - _Black / 1.0);
            g = 1.0 * (1.0 - _Magenta / 1.0) * (1.0 - _Black / 1.0);
            b = 1.0 * (1.0 - _Yellow / 1.0) * (1.0 - _Black / 1.0);
            return float4(r, g, b, 1);
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
