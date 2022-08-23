Shader "Custom/Color"
{
    Properties
    {
        _Hue ("Hue", Range(0, 360.0)) = 0.0
        _Saturation ("Saturation", Range(0, 1.0)) = 0.0
        _Brightness ("Brightness", Range(0, 1.0)) = 0.0
    }
    SubShader
    {
        Pass {
        CGPROGRAM
        
        #pragma vertex vert
        #pragma fragment frag

        float _Hue;
        float _Saturation;
        float _Brightness;

        float4 vert(float4 vertexPos: POSITION): SV_POSITION {
            return UnityObjectToClipPos(vertexPos);
        }

        float4 frag(): Color {
            // Source: https://en.wikipedia.org/wiki/HSL_and_HSV
            float c = _Brightness * _Saturation;
            float h = _Hue / 60;
            float x = c * (1 - abs(h % 2 - 1));

            if (0 <= h && h < 1) return float4(c, x, 0, 1);
            else if (1 <= h && h < 2) return float4(x, c, 0, 1);
            else if (2 <= h && h < 3) return float4(0, c, x, 1);
            else if (3 <= h && h < 4) return float4(0, x, c, 1);
            else if (4 <= h && h < 5) return float4(x, 0, c, 1);
            else if (5 <= h && h < 6) return float4(c, 0, x, 1);
            else return float4(0, 0, 0, 0);
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
