Shader "TerraBlend/URP/TerraBlend 8 Textures Manual"
{
    Properties
    {
        _Splat0("Layer 1", 2D) = "white" {}
        _Splat1("Layer 2", 2D) = "white" {}
        _Splat2("Layer 3", 2D) = "white" {}
        _Splat3("Layer 4", 2D) = "white" {}
        _Splat4("Layer 5", 2D) = "white" {}
        _Splat5("Layer 6", 2D) = "white" {}
        _Splat6("Layer 7", 2D) = "white" {}
        _Splat7("Layer 8", 2D) = "white" {}

        _Normal0("Normalmap 1", 2D) = "bump" {}
        _Normal1("Normalmap 2", 2D) = "bump" {}
        _Normal2("Normalmap 3", 2D) = "bump" {}
        _Normal3("Normalmap 4", 2D) = "bump" {}
        _Normal4("Normalmap 5", 2D) = "bump" {}
        _Normal5("Normalmap 6", 2D) = "bump" {}
        _Normal6("Normalmap 7", 2D) = "bump" {}
        _Normal7("Normalmap 8", 2D) = "bump" {}

        _MaskMap0("Mask Map 1", 2D) = "white" {}
        _MaskMap1("Mask Map 2", 2D) = "white" {}
        _MaskMap2("Mask Map 3", 2D) = "white" {}
        _MaskMap3("Mask Map 4", 2D) = "white" {}
        _MaskMap4("Mask Map 5", 2D) = "white" {}
        _MaskMap5("Mask Map 6", 2D) = "white" {}
        _MaskMap6("Mask Map 7", 2D) = "white" {}
        _MaskMap7("Mask Map 8", 2D) = "white" {}

        _Smoothness0("Smoothness 1", Range(0, 1)) = 0.5
        _Smoothness1("Smoothness 2", Range(0, 1)) = 0.5
        _Smoothness2("Smoothness 3", Range(0, 1)) = 0.5
        _Smoothness3("Smoothness 4", Range(0, 1)) = 0.5
        _Smoothness4("Smoothness 5", Range(0, 1)) = 0.5
        _Smoothness5("Smoothness 6", Range(0, 1)) = 0.5
        _Smoothness6("Smoothness 7", Range(0, 1)) = 0.5
        _Smoothness7("Smoothness 8", Range(0, 1)) = 0.5

        _NormalIntensity0("Normal Intensity 1", Range(0.01, 10)) = 1
        _NormalIntensity1("Normal Intensity 2", Range(0.01, 10)) = 1
        _NormalIntensity2("Normal Intensity 3", Range(0.01, 10)) = 1
        _NormalIntensity3("Normal Intensity 4", Range(0.01, 10)) = 1
        _NormalIntensity4("Normal Intensity 5", Range(0.01, 10)) = 1
        _NormalIntensity5("Normal Intensity 6", Range(0.01, 10)) = 1
        _NormalIntensity6("Normal Intensity 7", Range(0.01, 10)) = 1
        _NormalIntensity7("Normal Intensity 8", Range(0.01, 10)) = 1

        _RemapRMinMax0("Metallic Range 1", Vector) = (0, 1, 0, 0)
        _RemapRMinMax1("Metallic Range 2", Vector) = (0, 1, 0, 0)
        _RemapRMinMax2("Metallic Range 3", Vector) = (0, 1, 0, 0)
        _RemapRMinMax3("Metallic Range 4", Vector) = (0, 1, 0, 0)
        _RemapRMinMax4("Metallic Range 5", Vector) = (0, 1, 0, 0)
        _RemapRMinMax5("Metallic Range 6", Vector) = (0, 1, 0, 0)
        _RemapRMinMax6("Metallic Range 7", Vector) = (0, 1, 0, 0)
        _RemapRMinMax7("Metallic Range 8", Vector) = (0, 1, 0, 0)
        _RemapGMinMax0("AO Range 1", Vector) = (0, 1, 0, 0)
        _RemapGMinMax1("AO Range 2", Vector) = (0, 1, 0, 0)
        _RemapGMinMax2("AO Range 3", Vector) = (0, 1, 0, 0)
        _RemapGMinMax3("AO Range 4", Vector) = (0, 1, 0, 0)
        _RemapGMinMax4("AO Range 5", Vector) = (0, 1, 0, 0)
        _RemapGMinMax5("AO Range 6", Vector) = (0, 1, 0, 0)
        _RemapGMinMax6("AO Range 7", Vector) = (0, 1, 0, 0)
        _RemapGMinMax7("AO Range 8", Vector) = (0, 1, 0, 0)
        _RemapAMinMax0("Smoothness Range 1", Vector) = (0, 1, 0, 0)
        _RemapAMinMax1("Smoothness Range 2", Vector) = (0, 1, 0, 0)
        _RemapAMinMax2("Smoothness Range 3", Vector) = (0, 1, 0, 0)
        _RemapAMinMax3("Smoothness Range 4", Vector) = (0, 1, 0, 0)
        _RemapAMinMax4("Smoothness Range 5", Vector) = (0, 1, 0, 0)
        _RemapAMinMax5("Smoothness Range 6", Vector) = (0, 1, 0, 0)
        _RemapAMinMax6("Smoothness Range 7", Vector) = (0, 1, 0, 0)
        _RemapAMinMax7("Smoothness Range 8", Vector) = (0, 1, 0, 0)

        [Toggle] _HeightBlendEnable0("Height Blend Enable 1", Float) = 0
        [Toggle] _HeightBlendEnable1("Height Blend Enable 2", Float) = 0
        [Toggle] _HeightBlendEnable2("Height Blend Enable 3", Float) = 0
        [Toggle] _HeightBlendEnable3("Height Blend Enable 4", Float) = 0
        [Toggle] _HeightBlendEnable4("Height Blend Enable 5", Float) = 0
        [Toggle] _HeightBlendEnable5("Height Blend Enable 6", Float) = 0
        [Toggle] _HeightBlendEnable6("Height Blend Enable 7", Float) = 0
        [Toggle] _HeightBlendEnable7("Height Blend Enable 8", Float) = 0
        _HeightParametrization0("Height Parametrization 1", Float) = 0
        _HeightParametrization1("Height Parametrization 2", Float) = 0
        _HeightParametrization2("Height Parametrization 3", Float) = 0
        _HeightParametrization3("Height Parametrization 4", Float) = 0
        _HeightParametrization4("Height Parametrization 5", Float) = 0
        _HeightParametrization5("Height Parametrization 6", Float) = 0
        _HeightParametrization6("Height Parametrization 7", Float) = 0
        _HeightParametrization7("Height Parametrization 8", Float) = 0
        _HeightAmplitude0("Height Amplitude 1 (cm)", Float) = 1
        _HeightAmplitude1("Height Amplitude 2 (cm)", Float) = 1
        _HeightAmplitude2("Height Amplitude 3 (cm)", Float) = 1
        _HeightAmplitude3("Height Amplitude 4 (cm)", Float) = 1
        _HeightAmplitude4("Height Amplitude 5 (cm)", Float) = 1
        _HeightAmplitude5("Height Amplitude 6 (cm)", Float) = 1
        _HeightAmplitude6("Height Amplitude 7 (cm)", Float) = 1
        _HeightAmplitude7("Height Amplitude 8 (cm)", Float) = 1
        _HeightBase0("Height Base 1 (cm)", Float) = 0
        _HeightBase1("Height Base 2 (cm)", Float) = 0
        _HeightBase2("Height Base 3 (cm)", Float) = 0
        _HeightBase3("Height Base 4 (cm)", Float) = 0
        _HeightBase4("Height Base 5 (cm)", Float) = 0
        _HeightBase5("Height Base 6 (cm)", Float) = 0
        _HeightBase6("Height Base 7 (cm)", Float) = 0
        _HeightBase7("Height Base 8 (cm)", Float) = 0
        _HeightMin0("Height Min 1 (cm)", Float) = 0
        _HeightMin1("Height Min 2 (cm)", Float) = 0
        _HeightMin2("Height Min 3 (cm)", Float) = 0
        _HeightMin3("Height Min 4 (cm)", Float) = 0
        _HeightMin4("Height Min 5 (cm)", Float) = 0
        _HeightMin5("Height Min 6 (cm)", Float) = 0
        _HeightMin6("Height Min 7 (cm)", Float) = 0
        _HeightMin7("Height Min 8 (cm)", Float) = 0
        _HeightMax0("Height Max 1 (cm)", Float) = 1
        _HeightMax1("Height Max 2 (cm)", Float) = 1
        _HeightMax2("Height Max 3 (cm)", Float) = 1
        _HeightMax3("Height Max 4 (cm)", Float) = 1
        _HeightMax4("Height Max 5 (cm)", Float) = 1
        _HeightMax5("Height Max 6 (cm)", Float) = 1
        _HeightMax6("Height Max 7 (cm)", Float) = 1
        _HeightMax7("Height Max 8 (cm)", Float) = 1

        _HeightTransparencyThreshold("Height Transparency Threshold", Range(0, 1)) = 0.5

        _ColorTint0("Color Tint 1", Color) = (1,1,1,1)
        _ColorTint1("Color Tint 2", Color) = (1,1,1,1)
        _ColorTint2("Color Tint 3", Color) = (1,1,1,1)
        _ColorTint3("Color Tint 4", Color) = (1,1,1,1)
        _ColorTint4("Color Tint 5", Color) = (1,1,1,1)
        _ColorTint5("Color Tint 6", Color) = (1,1,1,1)
        _ColorTint6("Color Tint 7", Color) = (1,1,1,1)
        _ColorTint7("Color Tint 8", Color) = (1,1,1,1)

        _Control("Control 1 (Layers 1-4)", 2D) = "white" {}
        _Control2("Control 2 (Layers 5-8)", 2D) = "black" {}

        _SpecularColor("Specular Color", Color) = (0,0,0,0)
        _SpecularStrength("Specular Strength", Range(0, 1)) = 0.5

        _MipMapBias("MipMap Bias", Range(-2, 2)) = 0

        _BlendSmoothness("Control2 Edge Smoothness", Range(0.01, 0.5)) = 0.1

        [Toggle] _LayerVisibility0("Layer 1 Visibility", Float) = 1
        [Toggle] _LayerVisibility1("Layer 2 Visibility", Float) = 1
        [Toggle] _LayerVisibility2("Layer 3 Visibility", Float) = 1
        [Toggle] _LayerVisibility3("Layer 4 Visibility", Float) = 1
        [Toggle] _LayerVisibility4("Layer 5 Visibility", Float) = 1
        [Toggle] _LayerVisibility5("Layer 6 Visibility", Float) = 1
        [Toggle] _LayerVisibility6("Layer 7 Visibility", Float) = 1
        [Toggle] _LayerVisibility7("Layer 8 Visibility", Float) = 1

        [Toggle(ENABLE_NORMAL_INTENSITY)] _EnableNormalIntensity("Normal Intensity", Float) = 1

        [HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
        [HideInInspector] _AlphaCutoff("Alpha Cutoff", Range(0, 1)) = 0.5
        [HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1
        [HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
        [HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
        [HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0
    }

    SubShader
    {
        Tags
        {
            "RenderPipeline" = "UniversalPipeline"
            "RenderType" = "Opaque"
            "Queue" = "Geometry"
            "UniversalMaterialType" = "Lit"
        }

        LOD 0
        Cull Back
        ZWrite On
        ZTest LEqual
        AlphaToMask Off

        HLSLINCLUDE
        #pragma target 4.5
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

        #pragma shader_feature_local ENABLE_NORMAL_INTENSITY
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
        #pragma multi_compile_fragment _ _SHADOWS_SOFT
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile_fog
        #pragma multi_compile_instancing
        #pragma instancing_options renderinglayer

        CBUFFER_START(UnityPerMaterial)
            float4 _Control_ST;
            float4 _Control2_ST;
            float4 _Splat0_ST;
            float4 _Splat1_ST;
            float4 _Splat2_ST;
            float4 _Splat3_ST;
            float4 _Splat4_ST;
            float4 _Splat5_ST;
            float4 _Splat6_ST;
            float4 _Splat7_ST;
            float4 _Normal0_ST;
            float4 _Normal1_ST;
            float4 _Normal2_ST;
            float4 _Normal3_ST;
            float4 _Normal4_ST;
            float4 _Normal5_ST;
            float4 _Normal6_ST;
            float4 _Normal7_ST;
            float4 _MaskMap0_ST;
            float4 _MaskMap1_ST;
            float4 _MaskMap2_ST;
            float4 _MaskMap3_ST;
            float4 _MaskMap4_ST;
            float4 _MaskMap5_ST;
            float4 _MaskMap6_ST;
            float4 _MaskMap7_ST;
            float4 _SpecularColor;
            float _SpecularStrength;
            float4 _ColorTint0, _ColorTint1, _ColorTint2, _ColorTint3;
            float4 _ColorTint4, _ColorTint5, _ColorTint6, _ColorTint7;
            float _Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3;
            float _Smoothness4, _Smoothness5, _Smoothness6, _Smoothness7;
            float _NormalIntensity0, _NormalIntensity1, _NormalIntensity2, _NormalIntensity3;
            float _NormalIntensity4, _NormalIntensity5, _NormalIntensity6, _NormalIntensity7;
            float _MipMapBias;
            float _BlendSmoothness;
            float _LayerVisibility0, _LayerVisibility1, _LayerVisibility2, _LayerVisibility3;
            float _LayerVisibility4, _LayerVisibility5, _LayerVisibility6, _LayerVisibility7;
            float _HeightBlendEnable0, _HeightBlendEnable1, _HeightBlendEnable2, _HeightBlendEnable3;
            float _HeightBlendEnable4, _HeightBlendEnable5, _HeightBlendEnable6, _HeightBlendEnable7;
            float _HeightParametrization0, _HeightParametrization1, _HeightParametrization2, _HeightParametrization3;
            float _HeightParametrization4, _HeightParametrization5, _HeightParametrization6, _HeightParametrization7;
            float _HeightAmplitude0, _HeightAmplitude1, _HeightAmplitude2, _HeightAmplitude3;
            float _HeightAmplitude4, _HeightAmplitude5, _HeightAmplitude6, _HeightAmplitude7;
            float _HeightBase0, _HeightBase1, _HeightBase2, _HeightBase3;
            float _HeightBase4, _HeightBase5, _HeightBase6, _HeightBase7;
            float _HeightMin0, _HeightMin1, _HeightMin2, _HeightMin3;
            float _HeightMin4, _HeightMin5, _HeightMin6, _HeightMin7;
            float _HeightMax0, _HeightMax1, _HeightMax2, _HeightMax3;
            float _HeightMax4, _HeightMax5, _HeightMax6, _HeightMax7;
            float _HeightTransparencyThreshold;
            float4 _RemapRMinMax0, _RemapRMinMax1, _RemapRMinMax2, _RemapRMinMax3;
            float4 _RemapRMinMax4, _RemapRMinMax5, _RemapRMinMax6, _RemapRMinMax7;
            float4 _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3;
            float4 _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7;
            float4 _RemapAMinMax0, _RemapAMinMax1, _RemapAMinMax2, _RemapAMinMax3;
            float4 _RemapAMinMax4, _RemapAMinMax5, _RemapAMinMax6, _RemapAMinMax7;
        CBUFFER_END

        TEXTURE2D(_Control); SAMPLER(sampler_Linear_Clamp);
        TEXTURE2D(_Control2);
        TEXTURE2D(_Splat0); SAMPLER(sampler_Linear_Repeat);
        TEXTURE2D(_Splat1);
        TEXTURE2D(_Splat2);
        TEXTURE2D(_Splat3);
        TEXTURE2D(_Splat4);
        TEXTURE2D(_Splat5);
        TEXTURE2D(_Splat6);
        TEXTURE2D(_Splat7);
        TEXTURE2D(_Normal0);
        TEXTURE2D(_Normal1);
        TEXTURE2D(_Normal2);
        TEXTURE2D(_Normal3);
        TEXTURE2D(_Normal4);
        TEXTURE2D(_Normal5);
        TEXTURE2D(_Normal6);
        TEXTURE2D(_Normal7);
        TEXTURE2D(_MaskMap0);
        TEXTURE2D(_MaskMap1);
        TEXTURE2D(_MaskMap2);
        TEXTURE2D(_MaskMap3);
        TEXTURE2D(_MaskMap4);
        TEXTURE2D(_MaskMap5);
        TEXTURE2D(_MaskMap6);
        TEXTURE2D(_MaskMap7);

        struct VertexInput
        {
            float4 positionOS : POSITION;
            float3 normalOS : NORMAL;
            float4 tangentOS : TANGENT;
            float2 texcoord : TEXCOORD0;
            float2 lightmapUV : TEXCOORD1;
            UNITY_VERTEX_INPUT_INSTANCE_ID
        };

        struct VertexOutput
        {
            float4 positionCS : SV_POSITION;
            float2 uv : TEXCOORD0;
            float3 normalWS : TEXCOORD1;
            float3 tangentWS : TEXcoord2;
            float3 bitangentWS : TEXCOORD3;
            float3 positionWS : TEXcoord4;
            float4 fogFactorAndVertexLight : TEXcoord5;
            float4 shadowCoord : TEXCOORD6;
            float2 lightmapUV : TEXCOORD7;
            UNITY_VERTEX_INPUT_INSTANCE_ID
            UNITY_VERTEX_OUTPUT_STEREO
        };

        float3 AdjustNormalIntensity(float3 normal, float intensity)
        {
            return lerp(normal, float3(0, 0, 1), 1.0 - intensity);
        }

        inline float Remap(float value, float inMin, float inMax, float outMin, float outMax)
        {
            return outMin + (value - inMin) * (outMax - outMin) / (inMax - inMin);
        }

        float ComputeHeightBlendWeight(float height, float weight, float heightEnable, float heightParametrization, float heightAmplitude, float heightBase, float heightMin, float heightMax, float threshold)
        {
            if (heightEnable < 0.5)
                return weight;

            float scaledHeight;
            if (heightParametrization < 0.5)
            {
                scaledHeight = height * heightAmplitude + heightBase;
            }
            else
            {
                scaledHeight = Remap(height, 0.0, 1.0, heightMin, heightMax);
            }

            float transparencyFactor = smoothstep(threshold, 1.0, scaledHeight);
            return weight * (1.0 - transparencyFactor) + weight * scaledHeight * transparencyFactor;
        }

        ENDHLSL

        Pass
        {
            Name "Forward"
            Tags { "LightMode" = "UniversalForward" }

            Blend One Zero
            ZWrite On
            ZTest LEqual

            HLSLPROGRAM
            #pragma vertex vertForward
            #pragma fragment fragForward
            #define SHADERPASS SHADERPASS_FORWARD

            VertexOutput vertForward(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS.xyz);
                VertexNormalInputs normalInput = GetVertexNormalInputs(v.normalOS, v.tangentOS);

                o.positionCS = vertexInput.positionCS;
                o.positionWS = vertexInput.positionWS;
                o.normalWS = normalInput.normalWS;
                o.tangentWS = normalInput.tangentWS;
                o.bitangentWS = normalInput.bitangentWS;
                o.uv = v.texcoord;

                half3 vertexLight = VertexLighting(vertexInput.positionWS, normalInput.normalWS);
                half fogFactor = ComputeFogFactor(vertexInput.positionCS.z);
                o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

                #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
                    o.shadowCoord = GetShadowCoord(vertexInput);
                #endif

                OUTPUT_LIGHTMAP_UV(v.lightmapUV, unity_LightmapST, o.lightmapUV);

                return o;
            }

            half4 fragForward(VertexOutput IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float2 uvControl2 = TRANSFORM_TEX(IN.uv, _Control2);
                float4 weights2 = SAMPLE_TEXTURE2D_BIAS(_Control2, sampler_Linear_Clamp, uvControl2, _MipMapBias);

                weights1.r *= _LayerVisibility0;
                weights1.g *= _LayerVisibility1;
                weights1.b *= _LayerVisibility2;
                weights1.a *= _LayerVisibility3;
                weights2.r *= _LayerVisibility4;
                weights2.g *= _LayerVisibility5;
                weights2.b *= _LayerVisibility6;
                weights2.a *= _LayerVisibility7;

                float2 uvMask0 = TRANSFORM_TEX(IN.uv, _MaskMap0);
                float2 uvMask1 = TRANSFORM_TEX(IN.uv, _MaskMap1);
                float2 uvMask2 = TRANSFORM_TEX(IN.uv, _MaskMap2);
                float2 uvMask3 = TRANSFORM_TEX(IN.uv, _MaskMap3);
                float2 uvMask4 = TRANSFORM_TEX(IN.uv, _MaskMap4);
                float2 uvMask5 = TRANSFORM_TEX(IN.uv, _MaskMap5);
                float2 uvMask6 = TRANSFORM_TEX(IN.uv, _MaskMap6);
                float2 uvMask7 = TRANSFORM_TEX(IN.uv, _MaskMap7);

                float4 maskMap0 = SAMPLE_TEXTURE2D_BIAS(_MaskMap0, sampler_Linear_Repeat, uvMask0, _MipMapBias);
                float4 maskMap1 = SAMPLE_TEXTURE2D_BIAS(_MaskMap1, sampler_Linear_Repeat, uvMask1, _MipMapBias);
                float4 maskMap2 = SAMPLE_TEXTURE2D_BIAS(_MaskMap2, sampler_Linear_Repeat, uvMask2, _MipMapBias);
                float4 maskMap3 = SAMPLE_TEXTURE2D_BIAS(_MaskMap3, sampler_Linear_Repeat, uvMask3, _MipMapBias);
                float4 maskMap4 = SAMPLE_TEXTURE2D_BIAS(_MaskMap4, sampler_Linear_Repeat, uvMask4, _MipMapBias);
                float4 maskMap5 = SAMPLE_TEXTURE2D_BIAS(_MaskMap5, sampler_Linear_Repeat, uvMask5, _MipMapBias);
                float4 maskMap6 = SAMPLE_TEXTURE2D_BIAS(_MaskMap6, sampler_Linear_Repeat, uvMask6, _MipMapBias);
                float4 maskMap7 = SAMPLE_TEXTURE2D_BIAS(_MaskMap7, sampler_Linear_Repeat, uvMask7, _MipMapBias);

                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float heightBlendEnables[8] = { _HeightBlendEnable0, _HeightBlendEnable1, _HeightBlendEnable2, _HeightBlendEnable3,
                                                _HeightBlendEnable4, _HeightBlendEnable5, _HeightBlendEnable6, _HeightBlendEnable7 };
                float heightParametrizations[8] = { _HeightParametrization0, _HeightParametrization1, _HeightParametrization2, _HeightParametrization3,
                                                    _HeightParametrization4, _HeightParametrization5, _HeightParametrization6, _HeightParametrization7 };
                float heightAmplitudes[8] = { _HeightAmplitude0, _HeightAmplitude1, _HeightAmplitude2, _HeightAmplitude3,
                                              _HeightAmplitude4, _HeightAmplitude5, _HeightAmplitude6, _HeightAmplitude7 };
                float heightBases[8] = { _HeightBase0, _HeightBase1, _HeightBase2, _HeightBase3,
                                         _HeightBase4, _HeightBase5, _HeightBase6, _HeightBase7 };
                float heightMins[8] = { _HeightMin0, _HeightMin1, _HeightMin2, _HeightMin3,
                                        _HeightMin4, _HeightMin5, _HeightMin6, _HeightMin7 };
                float heightMaxs[8] = { _HeightMax0, _HeightMax1, _HeightMax2, _HeightMax3,
                                        _HeightMax4, _HeightMax5, _HeightMax6, _HeightMax7 };

                float heights[8];
                float weightsArray[8] = { weights1.r, weights1.g, weights1.b, weights1.a,
                                          weights2.r, weights2.g, weights2.b, weights2.a };

                for (int idxHeight = 0; idxHeight < 8; idxHeight++)
                {
                    bool hasMaskMap = !all(maskMaps[idxHeight] == float4(1,1,1,1));
                    heights[idxHeight] = hasMaskMap ? maskMaps[idxHeight].b : 0.0;
                    weightsArray[idxHeight] = ComputeHeightBlendWeight(heights[idxHeight], weightsArray[idxHeight], heightBlendEnables[idxHeight], heightParametrizations[idxHeight],
                                                                       heightAmplitudes[idxHeight], heightBases[idxHeight], heightMins[idxHeight], heightMaxs[idxHeight], _HeightTransparencyThreshold);
                }

                weights1 = float4(weightsArray[0], weightsArray[1], weightsArray[2], weightsArray[3]);
                weights2 = float4(weightsArray[4], weightsArray[5], weightsArray[6], weightsArray[7]);

                float sumWeights1 = max(weights1.r + weights1.g + weights1.b + weights1.a, 0.001);
                float sumWeights2 = max(weights2.r + weights2.g + weights2.b + weights2.a, 0.001);
                weights1 /= sumWeights1;
                weights2 /= sumWeights2;

                float blendFactor = smoothstep(0.0, _BlendSmoothness, sumWeights2);

                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);

                float4 tex0 = SAMPLE_TEXTURE2D_BIAS(_Splat0, sampler_Linear_Repeat, uv0, _MipMapBias) * _ColorTint0;
                float4 tex1 = SAMPLE_TEXTURE2D_BIAS(_Splat1, sampler_Linear_Repeat, uv1, _MipMapBias) * _ColorTint1;
                float4 tex2 = SAMPLE_TEXTURE2D_BIAS(_Splat2, sampler_Linear_Repeat, uv2, _MipMapBias) * _ColorTint2;
                float4 tex3 = SAMPLE_TEXTURE2D_BIAS(_Splat3, sampler_Linear_Repeat, uv3, _MipMapBias) * _ColorTint3;
                float4 tex4 = SAMPLE_TEXTURE2D_BIAS(_Splat4, sampler_Linear_Repeat, uv4, _MipMapBias) * _ColorTint4;
                float4 tex5 = SAMPLE_TEXTURE2D_BIAS(_Splat5, sampler_Linear_Repeat, uv5, _MipMapBias) * _ColorTint5;
                float4 tex6 = SAMPLE_TEXTURE2D_BIAS(_Splat6, sampler_Linear_Repeat, uv6, _MipMapBias) * _ColorTint6;
                float4 tex7 = SAMPLE_TEXTURE2D_BIAS(_Splat7, sampler_Linear_Repeat, uv7, _MipMapBias) * _ColorTint7;

                float4 albedo1 = tex0 * weights1.r + tex1 * weights1.g + tex2 * weights1.b + tex3 * weights1.a;
                float4 albedo2 = tex4 * weights2.r + tex5 * weights2.g + tex6 * weights2.b + tex7 * weights2.a;

                float3 baseColor = lerp(albedo1.rgb, albedo2.rgb, blendFactor);

                float3 normal0 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal0, sampler_Linear_Repeat, uv0, _MipMapBias), 1.0);
                float3 normal1 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal1, sampler_Linear_Repeat, uv1, _MipMapBias), 1.0);
                float3 normal2 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal2, sampler_Linear_Repeat, uv2, _MipMapBias), 1.0);
                float3 normal3 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal3, sampler_Linear_Repeat, uv3, _MipMapBias), 1.0);
                float3 normal4 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal4, sampler_Linear_Repeat, uv4, _MipMapBias), 1.0);
                float3 normal5 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal5, sampler_Linear_Repeat, uv5, _MipMapBias), 1.0);
                float3 normal6 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal6, sampler_Linear_Repeat, uv6, _MipMapBias), 1.0);
                float3 normal7 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal7, sampler_Linear_Repeat, uv7, _MipMapBias), 1.0);

                #ifdef ENABLE_NORMAL_INTENSITY
                    normal0 = AdjustNormalIntensity(normal0, _NormalIntensity0);
                    normal1 = AdjustNormalIntensity(normal1, _NormalIntensity1);
                    normal2 = AdjustNormalIntensity(normal2, _NormalIntensity2);
                    normal3 = AdjustNormalIntensity(normal3, _NormalIntensity3);
                    normal4 = AdjustNormalIntensity(normal4, _NormalIntensity4);
                    normal5 = AdjustNormalIntensity(normal5, _NormalIntensity5);
                    normal6 = AdjustNormalIntensity(normal6, _NormalIntensity6);
                    normal7 = AdjustNormalIntensity(normal7, _NormalIntensity7);
                #endif

                float4 blendedNormal1 = weights1.r * float4(normal0, 0) + weights1.g * float4(normal1, 0) +
                                        weights1.b * float4(normal2, 0) + weights1.a * float4(normal3, 0);
                float4 blendedNormal2 = weights2.r * float4(normal4, 0) + weights2.g * float4(normal5, 0) +
                                        weights2.b * float4(normal6, 0) + weights2.a * float4(normal7, 0);
                float3 normalTS = lerp(blendedNormal1.xyz, blendedNormal2.xyz, blendFactor);
                normalTS = normalize(normalTS);

                float3x3 tangentToWorld = float3x3(IN.tangentWS, IN.bitangentWS, IN.normalWS);
                float3 normalWS = TransformTangentToWorld(normalTS, tangentToWorld);
                normalWS = NormalizeNormalPerPixel(normalWS);

                float metallic[8];
                float occlusion[8];
                float smoothness[8];
                float4 remapRMinMax[8] = { _RemapRMinMax0, _RemapRMinMax1, _RemapRMinMax2, _RemapRMinMax3,
                                           _RemapRMinMax4, _RemapRMinMax5, _RemapRMinMax6, _RemapRMinMax7 };
                float4 remapGMinMax[8] = { _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3,
                                           _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7 };
                float4 remapAMinMax[8] = { _RemapAMinMax0, _RemapAMinMax1, _RemapAMinMax2, _RemapAMinMax3,
                                           _RemapAMinMax4, _RemapAMinMax5, _RemapAMinMax6, _RemapAMinMax7 };
                float defaultSmoothness[8] = { _Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3,
                                               _Smoothness4, _Smoothness5, _Smoothness6, _Smoothness7 };

                for (int idxPBR = 0; idxPBR < 8; idxPBR++)
                {
                    bool hasMaskMap = !all(maskMaps[idxPBR] == float4(1,1,1,1));
                    if (hasMaskMap)
                    {
                        metallic[idxPBR] = Remap(maskMaps[idxPBR].r, 0.0, 1.0, remapRMinMax[idxPBR].x, remapRMinMax[idxPBR].y);
                        occlusion[idxPBR] = Remap(maskMaps[idxPBR].g, 0.0, 1.0, remapGMinMax[idxPBR].x, remapGMinMax[idxPBR].y);
                        smoothness[idxPBR] = Remap(maskMaps[idxPBR].a, 0.0, 1.0, remapAMinMax[idxPBR].x, remapAMinMax[idxPBR].y);
                    }
                    else
                    {
                        metallic[idxPBR] = 0.0;
                        occlusion[idxPBR] = 1.0;
                        smoothness[idxPBR] = defaultSmoothness[idxPBR];
                    }
                }

                float finalMetallic = 0.0;
                float finalOcclusion = 1.0;
                float finalSmoothness = 0.0;
                for (int idxBlend1 = 0; idxBlend1 < 4; idxBlend1++)
                {
                    finalMetallic += metallic[idxBlend1] * weights1[idxBlend1] * (1.0 - blendFactor);
                    finalOcclusion *= lerp(1.0, occlusion[idxBlend1], weights1[idxBlend1] * (1.0 - blendFactor));
                    finalSmoothness += smoothness[idxBlend1] * weights1[idxBlend1] * (1.0 - blendFactor);
                }
                for (int idxBlend2 = 4; idxBlend2 < 8; idxBlend2++)
                {
                    finalMetallic += metallic[idxBlend2] * weights2[idxBlend2 - 4] * blendFactor;
                    finalOcclusion *= lerp(1.0, occlusion[idxBlend2], weights2[idxBlend2 - 4] * blendFactor);
                    finalSmoothness += smoothness[idxBlend2] * weights2[idxBlend2 - 4] * blendFactor;
                }

                baseColor *= finalOcclusion;

                float3 viewDirWS = SafeNormalize(_WorldSpaceCameraPos.xyz - IN.positionWS);
                float3 lightDirWS = _MainLightPosition.xyz;
                float3 halfwayDir = SafeNormalize(lightDirWS + viewDirWS);
                float specFactor = pow(max(dot(normalWS, halfwayDir), 0.0), finalSmoothness * 128.0);
                float3 specularContrib = _SpecularColor.rgb * specFactor * _SpecularStrength;
                baseColor += specularContrib;

                InputData inputData = (InputData)0;
                inputData.positionWS = IN.positionWS;
                inputData.viewDirectionWS = SafeNormalize(_WorldSpaceCameraPos.xyz - IN.positionWS);
                inputData.normalWS = normalWS;

                #if defined(_MAIN_LIGHT_SHADOWS_SCREEN) && !defined(_SURFACE_TYPE_TRANSPARENT)
                    inputData.shadowCoord = ComputeScreenPos(IN.positionCS);
                #elif defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
                    inputData.shadowCoord = IN.shadowCoord;
                #else
                    inputData.shadowCoord = TransformWorldToShadowCoord(IN.positionWS);
                #endif

                inputData.fogCoord = IN.fogFactorAndVertexLight.x;
                inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
                inputData.bakedGI = SAMPLE_GI(IN.lightmapUV, IN.normalWS, IN.normalWS);
                inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);
                inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUV);

                SurfaceData surfaceData = (SurfaceData)0;
                surfaceData.albedo = baseColor;
                surfaceData.specular = _SpecularColor.rgb * _SpecularStrength;
                surfaceData.metallic = finalMetallic;
                surfaceData.smoothness = finalSmoothness;
                surfaceData.occlusion = 1.0;
                surfaceData.emission = 0;
                surfaceData.alpha = 1;
                surfaceData.normalTS = normalTS;

                half4 color = UniversalFragmentPBR(inputData, surfaceData);
                color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);

                return color;
            }
            ENDHLSL
        }

        Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }

            ZWrite On
            ZTest LEqual
            ColorMask 0

            HLSLPROGRAM
            #pragma vertex vertShadow
            #pragma fragment fragShadow
            #define SHADERPASS SHADERPASS_SHADOWCASTER
            #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

            struct VertexOutputShadow
            {
                float4 positionCS : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            VertexOutputShadow vertShadow(VertexInput v)
            {
                VertexOutputShadow o = (VertexOutputShadow)0;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                float3 positionWS = TransformObjectToWorld(v.positionOS.xyz);
                o.positionCS = TransformWorldToHClip(positionWS);
                return o;
            }

            half fragShadow(VertexOutputShadow IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
                return 0;
            }
            ENDHLSL
        }

        Pass
        {
            Name "DepthOnly"
            Tags { "LightMode" = "DepthOnly" }

            ZWrite On
            ColorMask 0

            HLSLPROGRAM
            #pragma vertex vertDepth
            #pragma fragment fragDepth
            #define SHADERPASS SHADERPASS_DEPTHONLY

            struct VertexOutputDepth
            {
                float4 positionCS : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            VertexOutputDepth vertDepth(VertexInput v)
            {
                VertexOutputDepth o = (VertexOutputDepth)0;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                float3 positionWS = TransformObjectToWorld(v.positionOS.xyz);
                o.positionCS = TransformWorldToHClip(positionWS);
                return o;
            }

            half fragDepth(VertexOutputDepth IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
                return 0;
            }
            ENDHLSL
        }

        Pass
        {
            Name "DepthNormals"
            Tags { "LightMode" = "DepthNormals" }

            ZWrite On
            ZTest LEqual

            HLSLPROGRAM
            #pragma vertex vertDepthNormals
            #pragma fragment fragDepthNormals
            #define SHADERPASS SHADERPASS_DEPTHNORMALS

            struct VertexOutputDepthNormals
            {
                float4 positionCS : SV_POSITION;
                float3 normalWS : TEXCOORD1;
                float3 tangentWS : TEXCOORD2;
                float3 bitangentWS : TEXCOORD3;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            VertexOutputDepthNormals vertDepthNormals(VertexInput v)
            {
                VertexOutputDepthNormals o = (VertexOutputDepthNormals)0;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS.xyz);
                VertexNormalInputs normalInput = GetVertexNormalInputs(v.normalOS, v.tangentOS);

                o.positionCS = vertexInput.positionCS;
                o.normalWS = normalInput.normalWS;
                o.tangentWS = normalInput.tangentWS;
                o.bitangentWS = normalInput.bitangentWS;
                o.uv = v.texcoord;

                return o;
            }

            float4 fragDepthNormals(VertexOutputDepthNormals IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float2 uvControl2 = TRANSFORM_TEX(IN.uv, _Control2);
                float4 weights2 = SAMPLE_TEXTURE2D_BIAS(_Control2, sampler_Linear_Clamp, uvControl2, _MipMapBias);

                weights1.r *= _LayerVisibility0;
                weights1.g *= _LayerVisibility1;
                weights1.b *= _LayerVisibility2;
                weights1.a *= _LayerVisibility3;
                weights2.r *= _LayerVisibility4;
                weights2.g *= _LayerVisibility5;
                weights2.b *= _LayerVisibility6;
                weights2.a *= _LayerVisibility7;

                float2 uvMask0 = TRANSFORM_TEX(IN.uv, _MaskMap0);
                float2 uvMask1 = TRANSFORM_TEX(IN.uv, _MaskMap1);
                float2 uvMask2 = TRANSFORM_TEX(IN.uv, _MaskMap2);
                float2 uvMask3 = TRANSFORM_TEX(IN.uv, _MaskMap3);
                float2 uvMask4 = TRANSFORM_TEX(IN.uv, _MaskMap4);
                float2 uvMask5 = TRANSFORM_TEX(IN.uv, _MaskMap5);
                float2 uvMask6 = TRANSFORM_TEX(IN.uv, _MaskMap6);
                float2 uvMask7 = TRANSFORM_TEX(IN.uv, _MaskMap7);

                float4 maskMap0 = SAMPLE_TEXTURE2D_BIAS(_MaskMap0, sampler_Linear_Repeat, uvMask0, _MipMapBias);
                float4 maskMap1 = SAMPLE_TEXTURE2D_BIAS(_MaskMap1, sampler_Linear_Repeat, uvMask1, _MipMapBias);
                float4 maskMap2 = SAMPLE_TEXTURE2D_BIAS(_MaskMap2, sampler_Linear_Repeat, uvMask2, _MipMapBias);
                float4 maskMap3 = SAMPLE_TEXTURE2D_BIAS(_MaskMap3, sampler_Linear_Repeat, uvMask3, _MipMapBias);
                float4 maskMap4 = SAMPLE_TEXTURE2D_BIAS(_MaskMap4, sampler_Linear_Repeat, uvMask4, _MipMapBias);
                float4 maskMap5 = SAMPLE_TEXTURE2D_BIAS(_MaskMap5, sampler_Linear_Repeat, uvMask5, _MipMapBias);
                float4 maskMap6 = SAMPLE_TEXTURE2D_BIAS(_MaskMap6, sampler_Linear_Repeat, uvMask6, _MipMapBias);
                float4 maskMap7 = SAMPLE_TEXTURE2D_BIAS(_MaskMap7, sampler_Linear_Repeat, uvMask7, _MipMapBias);

                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float heightBlendEnables[8] = { _HeightBlendEnable0, _HeightBlendEnable1, _HeightBlendEnable2, _HeightBlendEnable3,
                                                _HeightBlendEnable4, _HeightBlendEnable5, _HeightBlendEnable6, _HeightBlendEnable7 };
                float heightParametrizations[8] = { _HeightParametrization0, _HeightParametrization1, _HeightParametrization2, _HeightParametrization3,
                                                    _HeightParametrization4, _HeightParametrization5, _HeightParametrization6, _HeightParametrization7 };
                float heightAmplitudes[8] = { _HeightAmplitude0, _HeightAmplitude1, _HeightAmplitude2, _HeightAmplitude3,
                                              _HeightAmplitude4, _HeightAmplitude5, _HeightAmplitude6, _HeightAmplitude7 };
                float heightBases[8] = { _HeightBase0, _HeightBase1, _HeightBase2, _HeightBase3,
                                         _HeightBase4, _HeightBase5, _HeightBase6, _HeightBase7 };
                float heightMins[8] = { _HeightMin0, _HeightMin1, _HeightMin2, _HeightMin3,
                                        _HeightMin4, _HeightMin5, _HeightMin6, _HeightMin7 };
                float heightMaxs[8] = { _HeightMax0, _HeightMax1, _HeightMax2, _HeightMax3,
                                        _HeightMax4, _HeightMax5, _HeightMax6, _HeightMax7 };

                float heights[8];
                float weightsArray[8] = { weights1.r, weights1.g, weights1.b, weights1.a,
                                          weights2.r, weights2.g, weights2.b, weights2.a };

                for (int idxHeight = 0; idxHeight < 8; idxHeight++)
                {
                    bool hasMaskMap = !all(maskMaps[idxHeight] == float4(1,1,1,1));
                    heights[idxHeight] = hasMaskMap ? maskMaps[idxHeight].b : 0.0;
                    weightsArray[idxHeight] = ComputeHeightBlendWeight(heights[idxHeight], weightsArray[idxHeight], heightBlendEnables[idxHeight], heightParametrizations[idxHeight],
                                                                       heightAmplitudes[idxHeight], heightBases[idxHeight], heightMins[idxHeight], heightMaxs[idxHeight], _HeightTransparencyThreshold);
                }

                weights1 = float4(weightsArray[0], weightsArray[1], weightsArray[2], weightsArray[3]);
                weights2 = float4(weightsArray[4], weightsArray[5], weightsArray[6], weightsArray[7]);

                float sumWeights1 = max(weights1.r + weights1.g + weights1.b + weights1.a, 0.001);
                float sumWeights2 = max(weights2.r + weights2.g + weights2.b + weights2.a, 0.001);
                weights1 /= sumWeights1;
                weights2 /= sumWeights2;

                float blendFactor = smoothstep(0.0, _BlendSmoothness, sumWeights2);

                float2 uv0 = TRANSFORM_TEX(IN.uv, _Normal0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Normal1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Normal2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Normal3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Normal4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Normal5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Normal6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Normal7);

                float3 normal0 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal0, sampler_Linear_Repeat, uv0, _MipMapBias), 1.0);
                float3 normal1 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal1, sampler_Linear_Repeat, uv1, _MipMapBias), 1.0);
                float3 normal2 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal2, sampler_Linear_Repeat, uv2, _MipMapBias), 1.0);
                float3 normal3 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal3, sampler_Linear_Repeat, uv3, _MipMapBias), 1.0);
                float3 normal4 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal4, sampler_Linear_Repeat, uv4, _MipMapBias), 1.0);
                float3 normal5 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal5, sampler_Linear_Repeat, uv5, _MipMapBias), 1.0);
                float3 normal6 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal6, sampler_Linear_Repeat, uv6, _MipMapBias), 1.0);
                float3 normal7 = UnpackNormalScale(SAMPLE_TEXTURE2D_BIAS(_Normal7, sampler_Linear_Repeat, uv7, _MipMapBias), 1.0);

                #ifdef ENABLE_NORMAL_INTENSITY
                    normal0 = AdjustNormalIntensity(normal0, _NormalIntensity0);
                    normal1 = AdjustNormalIntensity(normal1, _NormalIntensity1);
                    normal2 = AdjustNormalIntensity(normal2, _NormalIntensity2);
                    normal3 = AdjustNormalIntensity(normal3, _NormalIntensity3);
                    normal4 = AdjustNormalIntensity(normal4, _NormalIntensity4);
                    normal5 = AdjustNormalIntensity(normal5, _NormalIntensity5);
                    normal6 = AdjustNormalIntensity(normal6, _NormalIntensity6);
                    normal7 = AdjustNormalIntensity(normal7, _NormalIntensity7);
                #endif

                float4 blendedNormal1 = weights1.r * float4(normal0, 0) + weights1.g * float4(normal1, 0) +
                                        weights1.b * float4(normal2, 0) + weights1.a * float4(normal3, 0);
                float4 blendedNormal2 = weights2.r * float4(normal4, 0) + weights2.g * float4(normal5, 0) +
                                        weights2.b * float4(normal6, 0) + weights2.a * float4(normal7, 0);
                float3 normalTS = lerp(blendedNormal1.xyz, blendedNormal2.xyz, blendFactor);
                normalTS = normalize(normalTS);

                float3x3 tangentToWorld = float3x3(IN.tangentWS, IN.bitangentWS, IN.normalWS);
                float3 normalWS = TransformTangentToWorld(normalTS, tangentToWorld);
                normalWS = NormalizeNormalPerPixel(normalWS);

                return float4(normalWS, 0);
            }
            ENDHLSL
        }

        Pass
        {
            Name "Meta"
            Tags { "LightMode" = "Meta" }

            Cull Off

            HLSLPROGRAM
            #pragma vertex vertMeta
            #pragma fragment fragMeta
            #define SHADERPASS SHADERPASS_META
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"

            struct VertexOutputMeta
            {
                float4 positionCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            VertexOutputMeta vertMeta(VertexInput v)
            {
                VertexOutputMeta o = (VertexOutputMeta)0;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.positionCS = MetaVertexPosition(v.positionOS, v.texcoord, v.lightmapUV, unity_LightmapST, unity_DynamicLightmapST);
                o.uv = v.texcoord;
                return o;
            }

            half4 fragMeta(VertexOutputMeta IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float2 uvControl2 = TRANSFORM_TEX(IN.uv, _Control2);
                float4 weights2 = SAMPLE_TEXTURE2D_BIAS(_Control2, sampler_Linear_Clamp, uvControl2, _MipMapBias);

                weights1.r *= _LayerVisibility0;
                weights1.g *= _LayerVisibility1;
                weights1.b *= _LayerVisibility2;
                weights1.a *= _LayerVisibility3;
                weights2.r *= _LayerVisibility4;
                weights2.g *= _LayerVisibility5;
                weights2.b *= _LayerVisibility6;
                weights2.a *= _LayerVisibility7;

                float2 uvMask0 = TRANSFORM_TEX(IN.uv, _MaskMap0);
                float2 uvMask1 = TRANSFORM_TEX(IN.uv, _MaskMap1);
                float2 uvMask2 = TRANSFORM_TEX(IN.uv, _MaskMap2);
                float2 uvMask3 = TRANSFORM_TEX(IN.uv, _MaskMap3);
                float2 uvMask4 = TRANSFORM_TEX(IN.uv, _MaskMap4);
                float2 uvMask5 = TRANSFORM_TEX(IN.uv, _MaskMap5);
                float2 uvMask6 = TRANSFORM_TEX(IN.uv, _MaskMap6);
                float2 uvMask7 = TRANSFORM_TEX(IN.uv, _MaskMap7);

                float4 maskMap0 = SAMPLE_TEXTURE2D_BIAS(_MaskMap0, sampler_Linear_Repeat, uvMask0, _MipMapBias);
                float4 maskMap1 = SAMPLE_TEXTURE2D_BIAS(_MaskMap1, sampler_Linear_Repeat, uvMask1, _MipMapBias);
                float4 maskMap2 = SAMPLE_TEXTURE2D_BIAS(_MaskMap2, sampler_Linear_Repeat, uvMask2, _MipMapBias);
                float4 maskMap3 = SAMPLE_TEXTURE2D_BIAS(_MaskMap3, sampler_Linear_Repeat, uvMask3, _MipMapBias);
                float4 maskMap4 = SAMPLE_TEXTURE2D_BIAS(_MaskMap4, sampler_Linear_Repeat, uvMask4, _MipMapBias);
                float4 maskMap5 = SAMPLE_TEXTURE2D_BIAS(_MaskMap5, sampler_Linear_Repeat, uvMask5, _MipMapBias);
                float4 maskMap6 = SAMPLE_TEXTURE2D_BIAS(_MaskMap6, sampler_Linear_Repeat, uvMask6, _MipMapBias);
                float4 maskMap7 = SAMPLE_TEXTURE2D_BIAS(_MaskMap7, sampler_Linear_Repeat, uvMask7, _MipMapBias);

                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float heightBlendEnables[8] = { _HeightBlendEnable0, _HeightBlendEnable1, _HeightBlendEnable2, _HeightBlendEnable3,
                                                _HeightBlendEnable4, _HeightBlendEnable5, _HeightBlendEnable6, _HeightBlendEnable7 };
                float heightParametrizations[8] = { _HeightParametrization0, _HeightParametrization1, _HeightParametrization2, _HeightParametrization3,
                                                    _HeightParametrization4, _HeightParametrization5, _HeightParametrization6, _HeightParametrization7 };
                float heightAmplitudes[8] = { _HeightAmplitude0, _HeightAmplitude1, _HeightAmplitude2, _HeightAmplitude3,
                                              _HeightAmplitude4, _HeightAmplitude5, _HeightAmplitude6, _HeightAmplitude7 };
                float heightBases[8] = { _HeightBase0, _HeightBase1, _HeightBase2, _HeightBase3,
                                         _HeightBase4, _HeightBase5, _HeightBase6, _HeightBase7 };
                float heightMins[8] = { _HeightMin0, _HeightMin1, _HeightMin2, _HeightMin3,
                                        _HeightMin4, _HeightMin5, _HeightMin6, _HeightMin7 };
                float heightMaxs[8] = { _HeightMax0, _HeightMax1, _HeightMax2, _HeightMax3,
                                        _HeightMax4, _HeightMax5, _HeightMax6, _HeightMax7 };

                float heights[8];
                float weightsArray[8] = { weights1.r, weights1.g, weights1.b, weights1.a,
                                          weights2.r, weights2.g, weights2.b, weights2.a };

                for (int idxHeight = 0; idxHeight < 8; idxHeight++)
                {
                    bool hasMaskMap = !all(maskMaps[idxHeight] == float4(1,1,1,1));
                    heights[idxHeight] = hasMaskMap ? maskMaps[idxHeight].b : 0.0;
                    weightsArray[idxHeight] = ComputeHeightBlendWeight(heights[idxHeight], weightsArray[idxHeight], heightBlendEnables[idxHeight], heightParametrizations[idxHeight],
                                                                       heightAmplitudes[idxHeight], heightBases[idxHeight], heightMins[idxHeight], heightMaxs[idxHeight], _HeightTransparencyThreshold);
                }

                weights1 = float4(weightsArray[0], weightsArray[1], weightsArray[2], weightsArray[3]);
                weights2 = float4(weightsArray[4], weightsArray[5], weightsArray[6], weightsArray[7]);

                float sumWeights1 = max(weights1.r + weights1.g + weights1.b + weights1.a, 0.001);
                float sumWeights2 = max(weights2.r + weights2.g + weights2.b + weights2.a, 0.001);
                weights1 /= sumWeights1;
                weights2 /= sumWeights2;

                float blendFactor = smoothstep(0.0, _BlendSmoothness, sumWeights2);

                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);

                float4 tex0 = SAMPLE_TEXTURE2D_BIAS(_Splat0, sampler_Linear_Repeat, uv0, _MipMapBias) * _ColorTint0;
                float4 tex1 = SAMPLE_TEXTURE2D_BIAS(_Splat1, sampler_Linear_Repeat, uv1, _MipMapBias) * _ColorTint1;
                float4 tex2 = SAMPLE_TEXTURE2D_BIAS(_Splat2, sampler_Linear_Repeat, uv2, _MipMapBias) * _ColorTint2;
                float4 tex3 = SAMPLE_TEXTURE2D_BIAS(_Splat3, sampler_Linear_Repeat, uv3, _MipMapBias) * _ColorTint3;
                float4 tex4 = SAMPLE_TEXTURE2D_BIAS(_Splat4, sampler_Linear_Repeat, uv4, _MipMapBias) * _ColorTint4;
                float4 tex5 = SAMPLE_TEXTURE2D_BIAS(_Splat5, sampler_Linear_Repeat, uv5, _MipMapBias) * _ColorTint5;
                float4 tex6 = SAMPLE_TEXTURE2D_BIAS(_Splat6, sampler_Linear_Repeat, uv6, _MipMapBias) * _ColorTint6;
                float4 tex7 = SAMPLE_TEXTURE2D_BIAS(_Splat7, sampler_Linear_Repeat, uv7, _MipMapBias) * _ColorTint7;

                float4 albedo1 = tex0 * weights1.r + tex1 * weights1.g + tex2 * weights1.b + tex3 * weights1.a;
                float4 albedo2 = tex4 * weights2.r + tex5 * weights2.g + tex6 * weights2.b + tex7 * weights2.a;

                float3 baseColor = lerp(albedo1.rgb, albedo2.rgb, blendFactor);

                float occlusion[8];
                float4 remapGMinMax[8] = { _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3,
                                           _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7 };

                for (int idxOcclusion = 0; idxOcclusion < 8; idxOcclusion++)
                {
                    bool hasMaskMap = !all(maskMaps[idxOcclusion] == float4(1,1,1,1));
                    occlusion[idxOcclusion] = hasMaskMap ? Remap(maskMaps[idxOcclusion].g, 0.0, 1.0, remapGMinMax[idxOcclusion].x, remapGMinMax[idxOcclusion].y) : 1.0;
                }

                float finalOcclusion = 1.0;
                for (int idxBlend1 = 0; idxBlend1 < 4; idxBlend1++)
                {
                    finalOcclusion *= lerp(1.0, occlusion[idxBlend1], weights1[idxBlend1] * (1.0 - blendFactor));
                }
                for (int idxBlend2 = 4; idxBlend2 < 8; idxBlend2++)
                {
                    finalOcclusion *= lerp(1.0, occlusion[idxBlend2], weights2[idxBlend2 - 4] * blendFactor);
                }

                baseColor *= finalOcclusion;

                MetaInput metaInput = (MetaInput)0;
                metaInput.Albedo = baseColor;
                metaInput.Emission = 0;
                return MetaFragment(metaInput);
            }
            ENDHLSL
        }
    }

    FallBack "Hidden/Universal Render Pipeline/FallbackError"
    CustomEditor "CustomShaderGUI.EightTextureShaderGUI"
}