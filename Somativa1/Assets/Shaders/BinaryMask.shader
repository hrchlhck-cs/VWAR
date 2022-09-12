Shader "Hidden/BinaryMask"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

            // Imagem original
			sampler2D _MainTex;

            // Máscara
			sampler2D _Mask;

			float4 frag (v2f i) : SV_Target
			{
                // apelido para i.uv
				float2 uv = i.uv;

                // Pega os canais RGB da textura
                float3 mask = tex2D(_Mask, uv).rgb;

                // Filtra os pixeis pretos da máscara binária, retornando somente valores pretos
                if (mask.r == 0.0 && mask.g == 0.0 && mask.b == 0.0) return float4(mask, 1);
                
                // Retorna a cena nos pixeis brancos
                return tex2D(_MainTex, uv);
			}
			ENDCG
		}
	}
}