**TerraBlend 8 Textures Manual Shader Description**
The TerraBlend/URP/TerraBlend 8 Textures Manual shader is a high-performance, feature-rich shader developed for Unity’s Universal Render Pipeline (URP). It is designed specifically for terrain rendering, allowing up to eight distinct texture layers to be blended seamlessly using control (splat) maps. The shader supports physically-based rendering (PBR) with albedo, normal, and mask maps, and includes advanced features like mipmap bias control, normal intensity adjustment, and channel remapping for metallic, ambient occlusion (AO), and smoothness. It is optimized for both 3D and 2D rendering contexts, making it versatile for various game development scenarios.

**Key Features**
  **1. Multi-Layer Texture Blending**
  - **Eight Texture Layers:** Supports up to eight albedo textures (_Splat0 to _Splat7), each with corresponding normal maps (_Normal0 to _Normal7) and mask maps (_MaskMap0 to _MaskMap7).
  - **Control Maps:** Uses two control textures (_Control and _ControlExtra) to define blending weights for the layers. Each control texture’s RGBA channels control four layers, enabling precise blending across the terrain.
  - **Tiling and Offset:** Each layer supports independent tiling and offset settings, applied uniformly to albedo, normal, and mask maps for consistent texturing.
  **2. Physically-Based Rendering (PBR)**
  - **Mask Maps:** Each layer can include a mask map with channels for metallic (R), ambient occlusion (G), and smoothness (A). These properties can be remapped using customizable min/max ranges (_RemapRMinMax, _RemapGMinMax, _RemapAMinMax) for fine-tuned material effects.
  - Default Smoothness: When a mask map is absent, a per-layer smoothness value (_Smoothness0 to _Smoothness7) is used, ensuring flexibility in material setup.
  - **Specular Color:** A global specular color (_SpecularColor) enhances lighting realism, adjustable via the material inspector.
  **3. Normal Mapping**
  - **Normal Maps:** Each layer supports a normal map for detailed surface lighting, with tangent-space normals blended based on control weights.
  - **Normal Intensity:** A toggleable feature (ENABLE_NORMAL_INTENSITY) allows per-layer normal intensity adjustment (_NormalIntensity0 to _NormalIntensity7), enabling control over the strength of normal map effects.
  **4. Mipmap Bias Control**
  - **Mipmap Bias:** A global mipmap bias parameter (_MipMapBias, range -2 to 2) adjusts texture sampling for all textures, allowing developers to balance sharpness and performance. Negative values produce sharper textures, while positive     values reduce aliasing by using lower-resolution mipmaps.
  **5. Rendering Passes**
    The shader includes multiple passes to support various URP rendering scenarios:
    - **Forward Pass:** Handles primary lighting, including main light shadows, additional lights, lightmaps, and fog. Outputs PBR-lit results with blended albedo, normals, metallic, occlusion, and smoothness.
    - **ShadowCaster Pass:** Renders depth for shadow casting, ensuring accurate shadow projection.
    - **DepthOnly Pass:** Outputs depth for depth prepass, optimizing rendering performance.
    - **DepthNormals Pass:** Provides depth and world-space normals for deferred rendering or post-processing effects.
    - **Meta Pass:** Supports lightmap baking by outputting albedo and occlusion data.
    - **Universal2D Pass:** Optimized for 2D rendering, outputting blended albedo with occlusion for sprite-based or UI applications.
    - **GBuffer Pass:** Supports deferred rendering by outputting GBuffer data (albedo, specular, normals, metallic, smoothness, emission).
  **6. Custom Shader GUI**
    - Inspector Interface: Paired with a custom editor (CustomShaderGUI.EightTextureShaderGUI), the shader offers an intuitive material inspector. Features include:
    - Dynamic layer display based on active control map channels.
    - Up/down buttons for reordering layers, swapping all associated properties (textures, tiling, PBR values).
    - Foldout sections for mask map channel remapping (metallic, AO, smoothness).
    - Tiling and offset controls for albedo, normal, and mask maps, synchronized per layer.
    - Global settings for specular color, normal intensity toggle, and mipmap bias.
    - Layer Management: The GUI automatically detects active layers by analyzing control map pixel data, displaying only relevant layers to streamline the workflow.
   
  **Technical Details**
    - Render Pipeline: Universal Render Pipeline (URP).
    - Shader Model: Targets shader model 4.5 for broad compatibility.
  **- Tags:**
        - RenderType: Opaque
        - Queue: Geometry
        - UniversalMaterialType: Lit
    - **LOD:** 0 (no level-of-detail fallbacks).
    - **Blending:** Opaque (Blend One Zero), with ZWrite On and ZTest LEqual.
  **- Samplers:**
        - **sampler_Linear_Clamp:** Used for control textures to prevent tiling artifacts.
        - **sampler_Linear_Repeat:** Used for albedo, normal, and mask textures for seamless tiling.
  **Shader Features:**
    - Supports main light shadows, additional lights, soft shadows, lightmaps, and dynamic lightmaps.
    - Includes instancing and stereo rendering for VR and performance optimization.
    - Multi-compile directives for fog (linear, exponential, exponential-squared) and shadow configurations.
    - **Custom Editor:** CustomShaderGUI.EightTextureShaderGUI enhances the material inspector with a tailored interface.
    - **Fallback:** Hidden/InternalErrorShader ensures a default render if the shader fails.

  **Usage**
    This shader is ideal for:
      - **Terrain Systems:** Creating detailed, multi-layered terrains with varied materials (e.g., grass, dirt, rock, sand).
      - **Environment Art:** Rendering complex surfaces with blended textures and realistic lighting.
      - **2D Games:** Supporting 2D rendering with occlusion effects for sprite-based terrains or backgrounds.
      - **Deferred Rendering:** Compatible with URP’s deferred path via the GBuffer pass.

  **Setup Instructions**
      - **Assign to Material:** Create a material in Unity and assign the TerraBlend/URP/TerraBlend 8 Textures Manual shader.
        **Configure Textures:**
        - Assign albedo textures (_Splat0 to _Splat7), normal maps (_Normal0 to _Normal7), and mask maps (_MaskMap0 to _MaskMap7) as needed.
       - Set control textures (_Control and _ControlExtra) with RGBA channels defining layer weights.
        - Ensure textures have mipmaps enabled for _MipMapBias to function correctly.
  **Adjust Properties:**
    - Use the custom GUI to set tiling/offset, smoothness, normal intensity, and mask map remapping.
    - Adjust _SpecularColor and _MipMapBias in the Global Settings section.
    - Enable/disable ENABLE_NORMAL_INTENSITY to control normal map strength.
  **Test in Scene: Apply the material to a terrain or mesh and verify rendering in both 3D and 2D contexts.**

  **Performance Considerations**
    - **Texture Sampling:** The shader samples up to 18 textures (8 albedo, 8 normal, 2 control) in the Forward pass, which can be heavy on lower-end hardware. Consider reducing active layers for mobile platforms.
    - **Mask Maps:** Disable mask maps for layers that don’t require metallic or smoothness variation to reduce texture fetches.
    - **Mipmap Bias:** Adjust _MipMapBias to balance visual quality and performance, especially for distant terrain.
    - **Instancing:** Enable instancing for objects using this shader to improve batching performance.
    
    
  **Limitatons**
    - **Layer Limit:** Fixed at eight layers, controlled by two RGBA control textures. Additional layers require a separate shader or material.
    - **No Transparency:** Designed as an opaque shader, unsuitable for transparent or alpha-blended surfaces.
    - **Texture Memory:** Multiple high-resolution textures can consume significant GPU memory, requiring careful optimization.
    - 2D Pass: The Universal2D pass excludes normal mapping and metallic effects, limiting its use to albedo and occlusion.

  **Debugging Tips**
    - **Control Map Issues:** Ensure _Control and _ControlExtra textures are readable in the editor (set in Texture Importer) for the GUI’s active layer detection to work.
    - **Sampler Errors:** Verify that all texture samples use either sampler_Linear_Clamp (control textures) or sampler_Linear_Repeat (other textures).
    - **Mipmap Bias:** If textures appear blurry or aliased, check that mipmaps are enabled and adjust _MipMapBias accordingly.
    - **Shader Compilation:** If errors occur, inspect the shader’s multi-compile directives and ensure compatibility with the target platform (DirectX 11 in this case).

This shader, combined with its custom GUI, provides a robust solution for creating visually rich terrains in URP, balancing flexibility, performance, and ease of use for game developers and artists.
![image](https://github.com/user-attachments/assets/25a5b260-4a28-496c-abb0-a34ecb76eb1c)
