Shader "Custom/Color"
{
    Properties
    {
        _Red ("Red", Range(0, 1)) = 0.5 
        _Green ("Green", Range(0, 1)) = 0.5 
        _Blue ("Blue", Range(0, 1)) = 0.5 
        _Alpha ("Alpha", Range( 0, 1)) = 1.0
    }
    SubShader
    {
        Pass {
        CGPROGRAM
        
        #pragma vertex vert
        #pragma fragment frag

        float _Red;
        float _Green;
        float _Blue;
        float _Alpha;

        float4 vert(float4 vertexPos: POSITION): SV_POSITION {
            return UnityObjectToClipPos(vertexPos);
        }

        float4 frag(): Color {
            return float4(_Red , _Green ,  _Blue , _Alpha);
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
