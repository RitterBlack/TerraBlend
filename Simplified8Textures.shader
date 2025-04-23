Shader "TerraBlend/URP/TerraBlend 8 Textures Manual"
{
    Properties
    {
        // Texture properties for the eight layers
        _Splat0("Layer 1", 2D) = "white" {}
        _Splat1("Layer 2", 2D) = "white" {}
        _Splat2("Layer 3", 2D) = "white" {}
        _Splat3("Layer 4", 2D) = "white" {}
        _Splat4("Layer 5", 2D) = "white" {}
        _Splat5("Layer 6", 2D) = "white" {}
        _Splat6("Layer 7", 2D) = "white" {}
        _Splat7("Layer 8", 2D) = "white" {}

        // Normal maps for the eight layers
        _Normal0("Normalmap 1", 2D) = "bump" {}
        _Normal1("Normalmap 2", 2D) = "bump" {}
        _Normal2("Normalmap 3", 2D) = "bump" {}
        _Normal3("Normalmap 4", 2D) = "bump" {}
        _Normal4("Normalmap 5", 2D) = "bump" {}
        _Normal5("Normalmap 6", 2D) = "bump" {}
        _Normal6("Normalmap 7", 2D) = "bump" {}
        _Normal7("Normalmap 8", 2D) = "bump" {}

        // Mask maps for the eight layers
        _MaskMap0("Mask Map 1", 2D) = "white" {}
        _MaskMap1("Mask Map 2", 2D) = "white" {}
        _MaskMap2("Mask Map 3", 2D) = "white" {}
        _MaskMap3("Mask Map 4", 2D) = "white" {}
        _MaskMap4("Mask Map 5", 2D) = "white" {}
        _MaskMap5("Mask Map 6", 2D) = "white" {}
        _MaskMap6("Mask Map 7", 2D) = "white" {}
        _MaskMap7("Mask Map 8", 2D) = "white" {}

        // Smoothness values for each layer
        _Smoothness0("Smoothness 1", Range(0, 1)) = 0.5
        _Smoothness1("Smoothness 2", Range(0, 1)) = 0.5
        _Smoothness2("Smoothness 3", Range(0, 1)) = 0.5
        _Smoothness3("Smoothness 4", Range(0, 1)) = 0.5
        _Smoothness4("Smoothness 5", Range(0, 1)) = 0.5
        _Smoothness5("Smoothness 6", Range(0, 1)) = 0.5
        _Smoothness6("Smoothness 7", Range(0, 1)) = 0.5
        _Smoothness7("Smoothness 8", Range(0, 1)) = 0.5

        // Normal intensity for each layer
        _NormalIntensity0("Normal Intensity 1", Range(0.01, 10)) = 1
        _NormalIntensity1("Normal Intensity 2", Range(0.01, 10)) = 1
        _NormalIntensity2("Normal Intensity 3", Range(0.01, 10)) = 1
        _NormalIntensity3("Normal Intensity 4", Range(0.01, 10)) = 1
        _NormalIntensity4("Normal Intensity 5", Range(0.01, 10)) = 1
        _NormalIntensity5("Normal Intensity 6", Range(0.01, 10)) = 1
        _NormalIntensity6("Normal Intensity 7", Range(0.01, 10)) = 1
        _NormalIntensity7("Normal Intensity 8", Range(0.01, 10)) = 1

        // Remap ranges for mask map channels
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

        // Control textures for blending
        _Control("Control (SplatAlpha0)", 2D) = "white" {}
        _ControlExtra("ControlExtra (SplatAlpha1)", 2D) = "white" {}

        // Specular color
        _SpecularColor("Specular Color", Color) = (0,0,0,0)

        // Mipmap bias control
        _MipMapBias("MipMap Bias", Range(-2, 2)) = 0

        // Toggles for additional features
        [Toggle(ENABLE_NORMAL_INTENSITY)] _EnableNormalIntensity("Normal Intensity", Float) = 1

        // Hidden properties for URP compatibility
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

        // HLSL includes for all passes
        HLSLINCLUDE
        #pragma target 4.5
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

        // Shader features
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

        // Material properties
        CBUFFER_START(UnityPerMaterial)
            float4 _Control_ST;
            float4 _ControlExtra_ST;
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
            float _Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3;
            float _Smoothness4, _Smoothness5, _Smoothness6, _Smoothness7;
            float _NormalIntensity0, _NormalIntensity1, _NormalIntensity2, _NormalIntensity3;
            float _NormalIntensity4, _NormalIntensity5, _NormalIntensity6, _NormalIntensity7;
            float _MipMapBias;
            float4 _RemapRMinMax0, _RemapRMinMax1, _RemapRMinMax2, _RemapRMinMax3;
            float4 _RemapRMinMax4, _RemapRMinMax5, _RemapRMinMax6, _RemapRMinMax7;
            float4 _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3;
            float4 _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7;
            float4 _RemapAMinMax0, _RemapAMinMax1, _RemapAMinMax2, _RemapAMinMax3;
            float4 _RemapAMinMax4, _RemapAMinMax5, _RemapAMinMax6, _RemapAMinMax7;
        CBUFFER_END

        // Texture declarations
        TEXTURE2D(_Control); SAMPLER(sampler_Linear_Clamp);
        TEXTURE2D(_ControlExtra);
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

        // Vertex input structure
        struct VertexInput
        {
            float4 positionOS : POSITION;
            float3 normalOS : NORMAL;
            float4 tangentOS : TANGENT;
            float2 texcoord : TEXCOORD0;
            float2 lightmapUV : TEXCOORD1;
            UNITY_VERTEX_INPUT_INSTANCE_ID
        };

        // Vertex output structure for Forward pass
        struct VertexOutput
        {
            float4 positionCS : SV_POSITION;
            float2 uv : TEXCOORD0;
            float3 normalWS : TEXCOORD1;
            float3 tangentWS : TEXCOORD2;
            float3 bitangentWS : TEXCOORD3;
            float3 positionWS : TEXCOORD4;
            float4 fogFactorAndVertexLight : TEXCOORD5;
            float4 shadowCoord : TEXCOORD6;
            float2 lightmapUV : TEXCOORD7;
            UNITY_VERTEX_INPUT_INSTANCE_ID
            UNITY_VERTEX_OUTPUT_STEREO
        };

        // Helper function to blend textures
        float4 BlendTextures(float4 weights0, float4 weights1,
            float4 tex0, float4 tex1, float4 tex2, float4 tex3,
            float4 tex4, float4 tex5, float4 tex6, float4 tex7)
        {
            return tex0 * weights0.r + tex1 * weights0.g + tex2 * weights0.b + tex3 * weights0.a +
                   tex4 * weights1.r + tex5 * weights1.g + tex6 * weights1.b + tex7 * weights1.a;
        }

        // Helper function to adjust normal intensity
        float3 AdjustNormalIntensity(float3 normal, float intensity)
        {
            return lerp(normal, float3(0, 0, 1), -intensity + 1.0);
        }

        // Helper function to remap values
        inline float Remap(float value, float inMin, float inMax, float outMin, float outMax)
        {
            return outMin + (value - inMin) * (outMax - outMin) / (inMax - inMin);
        }

        ENDHLSL

        // Forward Pass
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

                // Sample control textures
                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float2 uvControlExtra = TRANSFORM_TEX(IN.uv, _ControlExtra);
                float4 weights0 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_ControlExtra, sampler_Linear_Clamp, uvControlExtra, _MipMapBias);

                // UVs for textures
                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);
                float2 uvMask0 = TRANSFORM_TEX(IN.uv, _MaskMap0);
                float2 uvMask1 = TRANSFORM_TEX(IN.uv, _MaskMap1);
                float2 uvMask2 = TRANSFORM_TEX(IN.uv, _MaskMap2);
                float2 uvMask3 = TRANSFORM_TEX(IN.uv, _MaskMap3);
                float2 uvMask4 = TRANSFORM_TEX(IN.uv, _MaskMap4);
                float2 uvMask5 = TRANSFORM_TEX(IN.uv, _MaskMap5);
                float2 uvMask6 = TRANSFORM_TEX(IN.uv, _MaskMap6);
                float2 uvMask7 = TRANSFORM_TEX(IN.uv, _MaskMap7);

                // Sample albedo textures with mipmap bias
                float4 tex0 = SAMPLE_TEXTURE2D_BIAS(_Splat0, sampler_Linear_Repeat, uv0, _MipMapBias);
                float4 tex1 = SAMPLE_TEXTURE2D_BIAS(_Splat1, sampler_Linear_Repeat, uv1, _MipMapBias);
                float4 tex2 = SAMPLE_TEXTURE2D_BIAS(_Splat2, sampler_Linear_Repeat, uv2, _MipMapBias);
                float4 tex3 = SAMPLE_TEXTURE2D_BIAS(_Splat3, sampler_Linear_Repeat, uv3, _MipMapBias);
                float4 tex4 = SAMPLE_TEXTURE2D_BIAS(_Splat4, sampler_Linear_Repeat, uv4, _MipMapBias);
                float4 tex5 = SAMPLE_TEXTURE2D_BIAS(_Splat5, sampler_Linear_Repeat, uv5, _MipMapBias);
                float4 tex6 = SAMPLE_TEXTURE2D_BIAS(_Splat6, sampler_Linear_Repeat, uv6, _MipMapBias);
                float4 tex7 = SAMPLE_TEXTURE2D_BIAS(_Splat7, sampler_Linear_Repeat, uv7, _MipMapBias);

                // Blend albedo
                float4 albedo = BlendTextures(weights0, weights1, tex0, tex1, tex2, tex3, tex4, tex5, tex6, tex7);
                float3 baseColor = albedo.rgb;

                // Sample normal maps with mipmap bias
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

                // Blend normals
                float4 blendedNormal = BlendTextures(weights0, weights1,
                    float4(normal0, 0), float4(normal1, 0), float4(normal2, 0), float4(normal3, 0),
                    float4(normal4, 0), float4(normal5, 0), float4(normal6, 0), float4(normal7, 0));
                float3 normalTS = blendedNormal.xyz;

                // Transform normal to world space
                float3x3 tangentToWorld = float3x3(IN.tangentWS, IN.bitangentWS, IN.normalWS);
                float3 normalWS = TransformTangentToWorld(normalTS, tangentToWorld);
                normalWS = NormalizeNormalPerPixel(normalWS);

                // Sample mask maps with mipmap bias
                float4 maskMap0 = SAMPLE_TEXTURE2D_BIAS(_MaskMap0, sampler_Linear_Repeat, uvMask0, _MipMapBias);
                float4 maskMap1 = SAMPLE_TEXTURE2D_BIAS(_MaskMap1, sampler_Linear_Repeat, uvMask1, _MipMapBias);
                float4 maskMap2 = SAMPLE_TEXTURE2D_BIAS(_MaskMap2, sampler_Linear_Repeat, uvMask2, _MipMapBias);
                float4 maskMap3 = SAMPLE_TEXTURE2D_BIAS(_MaskMap3, sampler_Linear_Repeat, uvMask3, _MipMapBias);
                float4 maskMap4 = SAMPLE_TEXTURE2D_BIAS(_MaskMap4, sampler_Linear_Repeat, uvMask4, _MipMapBias);
                float4 maskMap5 = SAMPLE_TEXTURE2D_BIAS(_MaskMap5, sampler_Linear_Repeat, uvMask5, _MipMapBias);
                float4 maskMap6 = SAMPLE_TEXTURE2D_BIAS(_MaskMap6, sampler_Linear_Repeat, uvMask6, _MipMapBias);
                float4 maskMap7 = SAMPLE_TEXTURE2D_BIAS(_MaskMap7, sampler_Linear_Repeat, uvMask7, _MipMapBias);

                // Process mask maps
                float metallic[8];
                float occlusion[8];
                float smoothness[8];
                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float4 remapRMinMax[8] = { _RemapRMinMax0, _RemapRMinMax1, _RemapRMinMax2, _RemapRMinMax3,
                                           _RemapRMinMax4, _RemapRMinMax5, _RemapRMinMax6, _RemapRMinMax7 };
                float4 remapGMinMax[8] = { _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3,
                                           _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7 };
                float4 remapAMinMax[8] = { _RemapAMinMax0, _RemapAMinMax1, _RemapAMinMax2, _RemapAMinMax3,
                                           _RemapAMinMax4, _RemapAMinMax5, _RemapAMinMax6, _RemapAMinMax7 };
                float defaultSmoothness[8] = { _Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3,
                                               _Smoothness4, _Smoothness5, _Smoothness6, _Smoothness7 };

                for (int i = 0; i < 8; i++)
                {
                    bool hasMaskMap = !all(maskMaps[i] == float4(1,1,1,1));
                    if (hasMaskMap)
                    {
                        metallic[i] = Remap(maskMaps[i].r, 0.0, 1.0, remapRMinMax[i].x, remapRMinMax[i].y);
                        occlusion[i] = Remap(maskMaps[i].g, 0.0, 1.0, remapGMinMax[i].x, remapGMinMax[i].y);
                        smoothness[i] = Remap(maskMaps[i].a, 0.0, 1.0, remapAMinMax[i].x, remapAMinMax[i].y);
                    }
                    else
                    {
                        metallic[i] = 0.0;
                        occlusion[i] = 1.0;
                        smoothness[i] = defaultSmoothness[i];
                    }
                }

                // Blend PBR parameters
                float finalMetallic = 0.0;
                float finalOcclusion = 0.0;
                float finalSmoothness = 0.0;
                finalMetallic += metallic[0] * weights0.r + metallic[1] * weights0.g + metallic[2] * weights0.b + metallic[3] * weights0.a +
                                 metallic[4] * weights1.r + metallic[5] * weights1.g + metallic[6] * weights1.b + metallic[7] * weights1.a;
                finalOcclusion += occlusion[0] * weights0.r + occlusion[1] * weights0.g + occlusion[2] * weights0.b + occlusion[3] * weights0.a +
                                  occlusion[4] * weights1.r + occlusion[5] * weights1.g + occlusion[6] * weights1.b + occlusion[7] * weights1.a;
                finalSmoothness += smoothness[0] * weights0.r + smoothness[1] * weights0.g + smoothness[2] * weights0.b + smoothness[3] * weights0.a +
                                   smoothness[4] * weights1.r + smoothness[5] * weights1.g + smoothness[6] * weights1.b + smoothness[7] * weights1.a;

                // Apply occlusion to albedo
                baseColor *= finalOcclusion;

                // Set up surface data
                InputData inputData = (InputData)0;
                inputData.positionWS = IN.positionWS;
                inputData.viewDirectionWS = SafeNormalize(_WorldSpaceCameraPos.xyz - IN.positionWS);
                inputData.normalWS = normalWS;

                // Compute shadowCoord for all shadow modes
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
                surfaceData.specular = _SpecularColor.rgb;
                surfaceData.metallic = finalMetallic;
                surfaceData.smoothness = finalSmoothness;
                surfaceData.occlusion = 1.0; // Occlusion already applied to albedo
                surfaceData.emission = 0;
                surfaceData.alpha = 1;
                surfaceData.normalTS = normalTS;

                half4 color = UniversalFragmentPBR(inputData, surfaceData);
                color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);

                return color;
            }
            ENDHLSL
        }

        // ShadowCaster Pass
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

            half4 fragShadow(VertexOutputShadow IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
                return 0;
            }
            ENDHLSL
        }

        // DepthOnly Pass
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

            half4 fragDepth(VertexOutputDepth IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
                return 0;
            }
            ENDHLSL
        }

        // Meta Pass
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

                o.positionCS = MetaVertexPosition(v.positionOS, v.lightmapUV, v.lightmapUV, unity_LightmapST, unity_DynamicLightmapST);
                o.uv = v.texcoord;
                return o;
            }

            half4 fragMeta(VertexOutputMeta IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float2 uvControlExtra = TRANSFORM_TEX(IN.uv, _ControlExtra);
                float4 weights0 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_ControlExtra, sampler_Linear_Clamp, uvControlExtra, _MipMapBias);

                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);

                float4 tex0 = SAMPLE_TEXTURE2D_BIAS(_Splat0, sampler_Linear_Repeat, uv0, _MipMapBias);
                float4 tex1 = SAMPLE_TEXTURE2D_BIAS(_Splat1, sampler_Linear_Repeat, uv1, _MipMapBias);
                float4 tex2 = SAMPLE_TEXTURE2D_BIAS(_Splat2, sampler_Linear_Repeat, uv2, _MipMapBias);
                float4 tex3 = SAMPLE_TEXTURE2D_BIAS(_Splat3, sampler_Linear_Repeat, uv3, _MipMapBias);
                float4 tex4 = SAMPLE_TEXTURE2D_BIAS(_Splat4, sampler_Linear_Repeat, uv4, _MipMapBias);
                float4 tex5 = SAMPLE_TEXTURE2D_BIAS(_Splat5, sampler_Linear_Repeat, uv5, _MipMapBias);
                float4 tex6 = SAMPLE_TEXTURE2D_BIAS(_Splat6, sampler_Linear_Repeat, uv6, _MipMapBias);
                float4 tex7 = SAMPLE_TEXTURE2D_BIAS(_Splat7, sampler_Linear_Repeat, uv7, _MipMapBias);

                float4 albedo = BlendTextures(weights0, weights1, tex0, tex1, tex2, tex3, tex4, tex5, tex6, tex7);

                // Sample mask maps for occlusion
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

                float occlusion[8];
                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float4 remapGMinMax[8] = { _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3,
                                           _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7 };

                for (int i = 0; i < 8; i++)
                {
                    bool hasMaskMap = !all(maskMaps[i] == float4(1,1,1,1));
                    occlusion[i] = hasMaskMap ? Remap(maskMaps[i].g, 0.0, 1.0, remapGMinMax[i].x, remapGMinMax[i].y) : 1.0;
                }

                float finalOcclusion = 0.0;
                finalOcclusion += occlusion[0] * weights0.r + occlusion[1] * weights0.g + occlusion[2] * weights0.b + occlusion[3] * weights0.a +
                                  occlusion[4] * weights1.r + occlusion[5] * weights1.g + occlusion[6] * weights1.b + occlusion[7] * weights1.a;

                // Apply occlusion to albedo
                albedo.rgb *= finalOcclusion;

                MetaInput metaInput = (MetaInput)0;
                metaInput.Albedo = albedo.rgb;
                metaInput.Emission = 0;

                return MetaFragment(metaInput);
            }
            ENDHLSL
        }

        // Universal2D Pass
        Pass
        {
            Name "Universal2D"
            Tags { "LightMode" = "Universal2D" }

            Blend One Zero
            ZWrite On
            ZTest LEqual

            HLSLPROGRAM
            #pragma vertex vert2D
            #pragma fragment frag2D
            #define SHADERPASS SHADERPASS_2D

            struct VertexOutput2D
            {
                float4 positionCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            VertexOutput2D vert2D(VertexInput v)
            {
                VertexOutput2D o = (VertexOutput2D)0;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.positionCS = TransformObjectToHClip(v.positionOS.xyz);
                o.uv = v.texcoord;
                return o;
            }

            half4 frag2D(VertexOutput2D IN) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                // Sample control textures
                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float2 uvControlExtra = TRANSFORM_TEX(IN.uv, _ControlExtra);
                float4 weights0 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_ControlExtra, sampler_Linear_Clamp, uvControlExtra, _MipMapBias);

                // UVs for textures
                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);

                // Sample albedo textures
                float4 tex0 = SAMPLE_TEXTURE2D_BIAS(_Splat0, sampler_Linear_Repeat, uv0, _MipMapBias);
                float4 tex1 = SAMPLE_TEXTURE2D_BIAS(_Splat1, sampler_Linear_Repeat, uv1, _MipMapBias);
                float4 tex2 = SAMPLE_TEXTURE2D_BIAS(_Splat2, sampler_Linear_Repeat, uv2, _MipMapBias);
                float4 tex3 = SAMPLE_TEXTURE2D_BIAS(_Splat3, sampler_Linear_Repeat, uv3, _MipMapBias);
                float4 tex4 = SAMPLE_TEXTURE2D_BIAS(_Splat4, sampler_Linear_Repeat, uv4, _MipMapBias);
                float4 tex5 = SAMPLE_TEXTURE2D_BIAS(_Splat5, sampler_Linear_Repeat, uv5, _MipMapBias);
                float4 tex6 = SAMPLE_TEXTURE2D_BIAS(_Splat6, sampler_Linear_Repeat, uv6, _MipMapBias);
                float4 tex7 = SAMPLE_TEXTURE2D_BIAS(_Splat7, sampler_Linear_Repeat, uv7, _MipMapBias);

                // Blend albedo
                float4 albedo = BlendTextures(weights0, weights1, tex0, tex1, tex2, tex3, tex4, tex5, tex6, tex7);

                // Sample mask maps for occlusion
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

                float occlusion[8];
                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float4 remapGMinMax[8] = { _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3,
                                           _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7 };

                for (int i = 0; i < 8; i++)
                {
                    bool hasMaskMap = !all(maskMaps[i] == float4(1,1,1,1));
                    occlusion[i] = hasMaskMap ? Remap(maskMaps[i].g, 0.0, 1.0, remapGMinMax[i].x, remapGMinMax[i].y) : 1.0;
                }

                float finalOcclusion = 0.0;
                finalOcclusion += occlusion[0] * weights0.r + occlusion[1] * weights0.g + occlusion[2] * weights0.b + occlusion[3] * weights0.a +
                                  occlusion[4] * weights1.r + occlusion[5] * weights1.g + occlusion[6] * weights1.b + occlusion[7] * weights1.a;

                // Apply occlusion to albedo
                albedo.rgb *= finalOcclusion;

                half4 color = half4(albedo.rgb, 1);
                return color;
            }
            ENDHLSL
        }

        // DepthNormals Pass
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
                float2 uv : TEXCOORD0;
                float3 normalWS : TEXCOORD1;
                float3 tangentWS : TEXCOORD2;
                float3 bitangentWS : TEXCOORD3;
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

            void fragDepthNormals(VertexOutputDepthNormals IN, out half4 outNormalWS : SV_Target0, out float outDepth : SV_Depth)
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float2 uvControlExtra = TRANSFORM_TEX(IN.uv, _ControlExtra);
                float4 weights0 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_ControlExtra, sampler_Linear_Clamp, uvControlExtra, _MipMapBias);

                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);

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

                float4 blendedNormal = BlendTextures(weights0, weights1,
                    float4(normal0, 0), float4(normal1, 0), float4(normal2, 0), float4(normal3, 0),
                    float4(normal4, 0), float4(normal5, 0), float4(normal6, 0), float4(normal7, 0));
                float3 normalTS = blendedNormal.xyz;

                float3x3 tangentToWorld = float3x3(IN.tangentWS, IN.bitangentWS, IN.normalWS);
                float3 normalWS = TransformTangentToWorld(normalTS, tangentToWorld);
                normalWS = NormalizeNormalPerPixel(normalWS);

                outNormalWS = half4(normalWS, 0);
                outDepth = IN.positionCS.z;
            }
            ENDHLSL
        }

        // GBuffer Pass
        Pass
        {
            Name "GBuffer"
            Tags { "LightMode" = "UniversalGBuffer" }

            ZWrite On
            ZTest LEqual

            HLSLPROGRAM
            #pragma vertex vertGBuffer
            #pragma fragment fragGBuffer
            #define SHADERPASS SHADERPASS_GBUFFER
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

            struct VertexOutputGBuffer
            {
                float4 positionCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 normalWS : TEXCOORD1;
                float3 tangentWS : TEXCOORD2;
                float3 bitangentWS : TEXCOORD3;
                float3 positionWS : TEXCOORD4;
                float4 shadowCoord : TEXCOORD5;
                float2 lightmapUV : TEXCOORD6;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            VertexOutputGBuffer vertGBuffer(VertexInput v)
            {
                VertexOutputGBuffer o = (VertexOutputGBuffer)0;
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

                #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
                    o.shadowCoord = GetShadowCoord(vertexInput);
                #endif

                OUTPUT_LIGHTMAP_UV(v.lightmapUV, unity_LightmapST, o.lightmapUV);

                return o;
            }

            void fragGBuffer(VertexOutputGBuffer IN,
                             out half4 outGBuffer0 : SV_Target0,
                             out half4 outGBuffer1 : SV_Target1,
                             out half4 outGBuffer2 : SV_Target2,
                             out half4 outGBuffer3 : SV_Target3)
            {
                UNITY_SETUP_INSTANCE_ID(IN);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

                // Sample control textures
                float2 uvControl = TRANSFORM_TEX(IN.uv, _Control);
                float2 uvControlExtra = TRANSFORM_TEX(IN.uv, _ControlExtra);
                float4 weights0 = SAMPLE_TEXTURE2D_BIAS(_Control, sampler_Linear_Clamp, uvControl, _MipMapBias);
                float4 weights1 = SAMPLE_TEXTURE2D_BIAS(_ControlExtra, sampler_Linear_Clamp, uvControlExtra, _MipMapBias);

                // UVs for textures
                float2 uv0 = TRANSFORM_TEX(IN.uv, _Splat0);
                float2 uv1 = TRANSFORM_TEX(IN.uv, _Splat1);
                float2 uv2 = TRANSFORM_TEX(IN.uv, _Splat2);
                float2 uv3 = TRANSFORM_TEX(IN.uv, _Splat3);
                float2 uv4 = TRANSFORM_TEX(IN.uv, _Splat4);
                float2 uv5 = TRANSFORM_TEX(IN.uv, _Splat5);
                float2 uv6 = TRANSFORM_TEX(IN.uv, _Splat6);
                float2 uv7 = TRANSFORM_TEX(IN.uv, _Splat7);
                float2 uvMask0 = TRANSFORM_TEX(IN.uv, _MaskMap0);
                float2 uvMask1 = TRANSFORM_TEX(IN.uv, _MaskMap1);
                float2 uvMask2 = TRANSFORM_TEX(IN.uv, _MaskMap2);
                float2 uvMask3 = TRANSFORM_TEX(IN.uv, _MaskMap3);
                float2 uvMask4 = TRANSFORM_TEX(IN.uv, _MaskMap4);
                float2 uvMask5 = TRANSFORM_TEX(IN.uv, _MaskMap5);
                float2 uvMask6 = TRANSFORM_TEX(IN.uv, _MaskMap6);
                float2 uvMask7 = TRANSFORM_TEX(IN.uv, _MaskMap7);

                // Sample albedo textures
                float4 tex0 = SAMPLE_TEXTURE2D_BIAS(_Splat0, sampler_Linear_Repeat, uv0, _MipMapBias);
                float4 tex1 = SAMPLE_TEXTURE2D_BIAS(_Splat1, sampler_Linear_Repeat, uv1, _MipMapBias);
                float4 tex2 = SAMPLE_TEXTURE2D_BIAS(_Splat2, sampler_Linear_Repeat, uv2, _MipMapBias);
                float4 tex3 = SAMPLE_TEXTURE2D_BIAS(_Splat3, sampler_Linear_Repeat, uv3, _MipMapBias);
                float4 tex4 = SAMPLE_TEXTURE2D_BIAS(_Splat4, sampler_Linear_Repeat, uv4, _MipMapBias);
                float4 tex5 = SAMPLE_TEXTURE2D_BIAS(_Splat5, sampler_Linear_Repeat, uv5, _MipMapBias);
                float4 tex6 = SAMPLE_TEXTURE2D_BIAS(_Splat6, sampler_Linear_Repeat, uv6, _MipMapBias);
                float4 tex7 = SAMPLE_TEXTURE2D_BIAS(_Splat7, sampler_Linear_Repeat, uv7, _MipMapBias);

                // Blend albedo
                float4 albedo = BlendTextures(weights0, weights1, tex0, tex1, tex2, tex3, tex4, tex5, tex6, tex7);
                float3 baseColor = albedo.rgb;

                // Sample normal maps
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

                // Blend normals
                float4 blendedNormal = BlendTextures(weights0, weights1,
                    float4(normal0, 0), float4(normal1, 0), float4(normal2, 0), float4(normal3, 0),
                    float4(normal4, 0), float4(normal5, 0), float4(normal6, 0), float4(normal7, 0));
                float3 normalTS = blendedNormal.xyz;

                // Transform normal to world space
                float3x3 tangentToWorld = float3x3(IN.tangentWS, IN.bitangentWS, IN.normalWS);
                float3 normalWS = TransformTangentToWorld(normalTS, tangentToWorld);
                normalWS = NormalizeNormalPerPixel(normalWS);

                // Sample mask maps
                float4 maskMap0 = SAMPLE_TEXTURE2D_BIAS(_MaskMap0, sampler_Linear_Repeat, uvMask0, _MipMapBias);
                float4 maskMap1 = SAMPLE_TEXTURE2D_BIAS(_MaskMap1, sampler_Linear_Repeat, uvMask1, _MipMapBias);
                float4 maskMap2 = SAMPLE_TEXTURE2D_BIAS(_MaskMap2, sampler_Linear_Repeat, uvMask2, _MipMapBias);
                float4 maskMap3 = SAMPLE_TEXTURE2D_BIAS(_MaskMap3, sampler_Linear_Repeat, uvMask3, _MipMapBias);
                float4 maskMap4 = SAMPLE_TEXTURE2D_BIAS(_MaskMap4, sampler_Linear_Repeat, uvMask4, _MipMapBias);
                float4 maskMap5 = SAMPLE_TEXTURE2D_BIAS(_MaskMap5, sampler_Linear_Repeat, uvMask5, _MipMapBias);
                float4 maskMap6 = SAMPLE_TEXTURE2D_BIAS(_MaskMap6, sampler_Linear_Repeat, uvMask6, _MipMapBias);
                float4 maskMap7 = SAMPLE_TEXTURE2D_BIAS(_MaskMap7, sampler_Linear_Repeat, uvMask7, _MipMapBias);

                // Process mask maps
                float metallic[8];
                float occlusion[8];
                float smoothness[8];
                float4 maskMaps[8] = { maskMap0, maskMap1, maskMap2, maskMap3, maskMap4, maskMap5, maskMap6, maskMap7 };
                float4 remapRMinMax[8] = { _RemapRMinMax0, _RemapRMinMax1, _RemapRMinMax2, _RemapRMinMax3,
                                           _RemapRMinMax4, _RemapRMinMax5, _RemapRMinMax6, _RemapRMinMax7 };
                float4 remapGMinMax[8] = { _RemapGMinMax0, _RemapGMinMax1, _RemapGMinMax2, _RemapGMinMax3,
                                           _RemapGMinMax4, _RemapGMinMax5, _RemapGMinMax6, _RemapGMinMax7 };
                float4 remapAMinMax[8] = { _RemapAMinMax0, _RemapAMinMax1, _RemapAMinMax2, _RemapAMinMax3,
                                           _RemapAMinMax4, _RemapAMinMax5, _RemapAMinMax6, _RemapAMinMax7 };
                float defaultSmoothness[8] = { _Smoothness0, _Smoothness1, _Smoothness2, _Smoothness3,
                                               _Smoothness4, _Smoothness5, _Smoothness6, _Smoothness7 };

                for (int i = 0; i < 8; i++)
                {
                    bool hasMaskMap = !all(maskMaps[i] == float4(1,1,1,1));
                    if (hasMaskMap)
                    {
                        metallic[i] = Remap(maskMaps[i].r, 0.0, 1.0, remapRMinMax[i].x, remapRMinMax[i].y);
                        occlusion[i] = Remap(maskMaps[i].g, 0.0, 1.0, remapGMinMax[i].x, remapGMinMax[i].y);
                        smoothness[i] = Remap(maskMaps[i].a, 0.0, 1.0, remapAMinMax[i].x, remapAMinMax[i].y);
                    }
                    else
                    {
                        metallic[i] = 0.0;
                        occlusion[i] = 1.0;
                        smoothness[i] = defaultSmoothness[i];
                    }
                }

                // Blend PBR parameters
                float finalMetallic = 0.0;
                float finalOcclusion = 0.0;
                float finalSmoothness = 0.0;
                finalMetallic += metallic[0] * weights0.r + metallic[1] * weights0.g + metallic[2] * weights0.b + metallic[3] * weights0.a +
                                 metallic[4] * weights1.r + metallic[5] * weights1.g + metallic[6] * weights1.b + metallic[7] * weights1.a;
                finalOcclusion += occlusion[0] * weights0.r + occlusion[1] * weights0.g + occlusion[2] * weights0.b + occlusion[3] * weights0.a +
                                  occlusion[4] * weights1.r + occlusion[5] * weights1.g + occlusion[6] * weights1.b + occlusion[7] * weights1.a;
                finalSmoothness += smoothness[0] * weights0.r + smoothness[1] * weights0.g + smoothness[2] * weights0.b + smoothness[3] * weights0.a +
                                   smoothness[4] * weights1.r + smoothness[5] * weights1.g + smoothness[6] * weights1.b + smoothness[7] * weights1.a;

                // Apply occlusion to albedo
                baseColor *= finalOcclusion;

                // GBuffer outputs
                half3 albedoOut = baseColor;
                half3 normalOut = normalWS;
                half smoothnessOut = finalSmoothness;
                half3 specularOut = _SpecularColor.rgb;
                half occlusionOut = 1.0; // Occlusion already applied to albedo
                half3 emissionOut = 0;

                // Pack GBuffer data
                outGBuffer0 = half4(albedoOut, occlusionOut); // Albedo, occlusion
                outGBuffer1 = half4(specularOut, finalMetallic); // Specular, metallic
                outGBuffer2 = half4(normalOut * 0.5 + 0.5, smoothnessOut); // Normal (encoded), smoothness
                outGBuffer3 = half4(emissionOut, 1); // Emission, alpha
            }
            ENDHLSL
        }
    }

    CustomEditor "CustomShaderGUI.EightTextureShaderGUI"
    Fallback "Hidden/InternalErrorShader"
}