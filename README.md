**TerraBlend 8 Textures Shader**

TerraBlend 8 Textures Shader is a custom shader for Unity's Universal Render Pipeline (URP) designed for terrain rendering with support for up to eight texture layers. It provides advanced blending capabilities, including height-based blending, normal mapping, and PBR (Physically Based Rendering) material properties, making it ideal for creating detailed and realistic terrain surfaces.

**Key Features:**
- Multi-Layer Texturing: Supports up to eight texture layers, each with its own albedo, normal map, and mask map (metallic, ambient occlusion, height, and smoothness).
- Height-Based Blending: Enables smooth transitions between layers using height maps with configurable amplitude, base, min/max values, and edge smoothness for realistic terrain effects.
- Control Maps: Utilizes two control textures (_Control and _Control2) to define layer weights for the first four and last four layers, respectively, with smooth blending between them.
- PBR Support: Includes metallic, smoothness, and ambient occlusion properties, with remappable ranges for precise control over material appearance.
- Normal Mapping: Supports normal maps for each layer with adjustable intensity, enhancing surface detail and lighting.
- Layer Visibility: Allows toggling visibility for individual layers, optimizing performance by disabling unused layers.
- Customizable Tiling and Offset: Each layer supports independent tiling and offset settings for texture customization.
- Specular Highlights: Configurable specular color and strength for enhanced lighting effects.
- MipMap Bias: Adjustable mip map bias for controlling texture sharpness or blurriness.
- Custom Shader GUI: Comes with a tailored Unity Editor GUI (EightTextureShaderGUI.cs) for intuitive material configuration, including:

**Requirements:**
- Unity 2021.3+ with Universal Render Pipeline (URP)

![image](https://github.com/user-attachments/assets/cbea13a5-4fcd-47bb-83bc-fa2af0ec3a48)
