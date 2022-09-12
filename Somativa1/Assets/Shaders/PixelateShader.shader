Shader "Somativa1/Pixelate"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    sampler2D _MainTex;
    int _PixelSize;

    half4 pixel(half2 uv)
    {

        half2 screenPos = floor(uv * _ScreenParams.xy / _PixelSize) * _PixelSize;
        return tex2D(_MainTex, screenPos / _ScreenParams.xy);
    }

    half4 frag(v2f_img i) : SV_Target
    {
        return pixel(i.uv);
    }

    ENDCG

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }

    }

    FallBack off
}
