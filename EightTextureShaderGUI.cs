#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using UnityEditor.Rendering;
using System.Collections.Generic;

namespace CustomShaderGUI
{
    public class EightTextureShaderGUI : ShaderGUI
    {
        private MaterialProperty[] properties;
        private List<MaterialProperty> splats = new List<MaterialProperty>();
        private List<MaterialProperty> normals = new List<MaterialProperty>();
        private List<MaterialProperty> normalIntensities = new List<MaterialProperty>();
        private List<MaterialProperty> smoothness = new List<MaterialProperty>();
        private List<MaterialProperty> maskMaps = new List<MaterialProperty>();
        private List<MaterialProperty> remapRMinMax = new List<MaterialProperty>();
        private List<MaterialProperty> remapGMinMax = new List<MaterialProperty>();
        private List<MaterialProperty> remapAMinMax = new List<MaterialProperty>();
        private MaterialProperty control, controlExtra, specularColor, enableNormalIntensity;
        private bool[] maskMapFoldouts = new bool[8]; // Track foldout state for each layer (up to 8 layers)

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {
            this.properties = properties;
            Material material = materialEditor.target as Material;

            FindProperties();

            EditorGUI.BeginChangeCheck();

            // Determine the number of active layers
            int activeLayers = GetActiveLayerCount(material);

            EditorGUILayout.LabelField($"Layers (Active: {activeLayers})", EditorStyles.boldLabel);
            for (int i = 0; i < activeLayers && i < splats.Count; i++)
            {
                DrawLayerSection(materialEditor, material, i, activeLayers, $"Layer {i + 1}", splats[i], normals[i], normalIntensities[i], smoothness[i], maskMaps[i],
                    remapRMinMax[i], remapGMinMax[i], remapAMinMax[i]);
                GUILayout.Space(5); // Reduced spacing (approximately half of default)
            }

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Control Maps", EditorStyles.boldLabel);
            DrawControlSection(materialEditor);

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Global Settings", EditorStyles.boldLabel);
            DrawGlobalSettingsSection(materialEditor);

            if (EditorGUI.EndChangeCheck())
            {
                materialEditor.PropertiesChanged();
            }
        }

        private void FindProperties()
        {
            splats.Clear();
            normals.Clear();
            normalIntensities.Clear();
            smoothness.Clear();
            maskMaps.Clear();
            remapRMinMax.Clear();
            remapGMinMax.Clear();
            remapAMinMax.Clear();

            int layerIndex = 0;
            while (true)
            {
                MaterialProperty splat = FindProperty($"_Splat{layerIndex}", properties, false);
                if (splat == null) break;
                splats.Add(splat);
                normals.Add(FindProperty($"_Normal{layerIndex}", properties, false));
                normalIntensities.Add(FindProperty($"_NormalIntensity{layerIndex}", properties, false));
                smoothness.Add(FindProperty($"_Smoothness{layerIndex}", properties, false));
                maskMaps.Add(FindProperty($"_MaskMap{layerIndex}", properties, false));
                remapRMinMax.Add(FindProperty($"_RemapRMinMax{layerIndex}", properties, false));
                remapGMinMax.Add(FindProperty($"_RemapGMinMax{layerIndex}", properties, false));
                remapAMinMax.Add(FindProperty($"_RemapAMinMax{layerIndex}", properties, false));
                layerIndex++;
            }

            control = FindProperty("_Control", properties);
            controlExtra = FindProperty("_ControlExtra", properties);
            specularColor = FindProperty("_SpecularColor", properties);
            enableNormalIntensity = FindProperty("_EnableNormalIntensity", properties);
        }

        private int GetActiveLayerCount(Material material)
        {
            int activeLayers = 0;

            // Check _Control texture (controls layers 0-3: R, G, B, A)
            if (control != null && control.textureValue != null)
            {
                Texture2D controlTex = control.textureValue as Texture2D;
                if (controlTex != null)
                {
                    // Make texture readable temporarily
                    bool wasReadable = controlTex.isReadable;
                    if (!wasReadable)
                    {
                        string path = AssetDatabase.GetAssetPath(controlTex);
                        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
                        if (importer != null)
                        {
                            importer.isReadable = true;
                            importer.SaveAndReimport();
                        }
                    }

                    Color[] pixels = controlTex.GetPixels();
                    bool hasR = false, hasG = false, hasB = false, hasA = false;
                    foreach (Color pixel in pixels)
                    {
                        if (pixel.r > 0.01f) hasR = true;
                        if (pixel.g > 0.01f) hasG = true;
                        if (pixel.b > 0.01f) hasB = true;
                        if (pixel.a > 0.01f) hasA = true;
                    }

                    if (hasR) activeLayers++;
                    if (hasG) activeLayers++;
                    if (hasB) activeLayers++;
                    if (hasA) activeLayers++;

                    // Restore original readability state
                    if (!wasReadable)
                    {
                        string path = AssetDatabase.GetAssetPath(controlTex);
                        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
                        if (importer != null)
                        {
                            importer.isReadable = false;
                            importer.SaveAndReimport();
                        }
                    }
                }
            }

            // Check _ControlExtra texture (controls layers 4-7: R, G, B, A)
            if (controlExtra != null && controlExtra.textureValue != null)
            {
                Texture2D controlExtraTex = controlExtra.textureValue as Texture2D;
                if (controlExtraTex != null)
                {
                    // Make texture readable temporarily
                    bool wasReadable = controlExtraTex.isReadable;
                    if (!wasReadable)
                    {
                        string path = AssetDatabase.GetAssetPath(controlExtraTex);
                        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
                        if (importer != null)
                        {
                            importer.isReadable = true;
                            importer.SaveAndReimport();
                        }
                    }

                    Color[] pixels = controlExtraTex.GetPixels();
                    bool hasR = false, hasG = false, hasB = false, hasA = false;
                    foreach (Color pixel in pixels)
                    {
                        if (pixel.r > 0.01f) hasR = true;
                        if (pixel.g > 0.01f) hasG = true;
                        if (pixel.b > 0.01f) hasB = true;
                        if (pixel.a > 0.01f) hasA = true;
                    }

                    if (hasR) activeLayers++;
                    if (hasG) activeLayers++;
                    if (hasB) activeLayers++;
                    if (hasA) activeLayers++;

                    // Restore original readability state
                    if (!wasReadable)
                    {
                        string path = AssetDatabase.GetAssetPath(controlExtraTex);
                        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
                        if (importer != null)
                        {
                            importer.isReadable = false;
                            importer.SaveAndReimport();
                        }
                    }
                }
            }

            // Clamp to the number of available splat textures
            return Mathf.Min(activeLayers, splats.Count);
        }

        private void DrawLayerSection(MaterialEditor editor, Material material, int layerIndex, int activeLayers, string displayName,
            MaterialProperty textureProp, MaterialProperty normalProp,
            MaterialProperty intensityProp, MaterialProperty smoothnessProp,
            MaterialProperty maskMapProp, MaterialProperty remapRMinMaxProp,
            MaterialProperty remapGMinMaxProp, MaterialProperty remapAMinMaxProp)
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);

            EditorGUILayout.BeginHorizontal();

            // Draw Up/Down buttons inside the box, top-left
            EditorGUILayout.BeginVertical(GUILayout.Width(30));
            GUI.enabled = layerIndex > 0;
            if (GUILayout.Button("↑", GUILayout.Width(30), GUILayout.Height(20)))
            {
                SwapLayerProperties(material, layerIndex, layerIndex - 1);
            }
            GUI.enabled = layerIndex < activeLayers - 1;
            if (GUILayout.Button("↓", GUILayout.Width(30), GUILayout.Height(20)))
            {
                SwapLayerProperties(material, layerIndex, layerIndex + 1);
            }
            GUI.enabled = true;
            EditorGUILayout.EndVertical();

            // Draw the layer content
            EditorGUILayout.BeginVertical();

            EditorGUILayout.LabelField(displayName, EditorStyles.boldLabel);

            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.BeginHorizontal(GUIStyle.none);

            // Base Color Texture (Albedo)
            Rect textureRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newTexture = (Texture)EditorGUI.ObjectField(new Rect(textureRect.x, textureRect.y, 70, 70), textureProp.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo(displayName + " Texture");
                textureProp.textureValue = newTexture;
            }

            // Normal Map
            Rect normalRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newNormal = (Texture)EditorGUI.ObjectField(new Rect(normalRect.x, normalRect.y, 70, 70), normalProp.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo(displayName + " Normal");
                normalProp.textureValue = newNormal;
            }

            // Mask Map
            Rect maskRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newMask = (Texture)EditorGUI.ObjectField(new Rect(maskRect.x, maskRect.y, 70, 70), maskMapProp.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo(displayName + " Mask Map");
                maskMapProp.textureValue = newMask;
            }

            EditorGUILayout.EndHorizontal();

            GUILayout.FlexibleSpace();

            EditorGUILayout.BeginVertical();
            Vector4 tilingOffset = textureProp.textureScaleAndOffset;

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tiling", GUILayout.Width(40));
            EditorGUILayout.LabelField("X", GUILayout.Width(15));
            float tilingX = EditorGUILayout.FloatField(tilingOffset.x, GUILayout.ExpandWidth(true));
            EditorGUILayout.LabelField("Y", GUILayout.Width(15));
            float tilingY = EditorGUILayout.FloatField(tilingOffset.y, GUILayout.ExpandWidth(true));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Offset", GUILayout.Width(40));
            EditorGUILayout.LabelField("X", GUILayout.Width(15));
            float offsetX = EditorGUILayout.FloatField(tilingOffset.z, GUILayout.ExpandWidth(true));
            EditorGUILayout.LabelField("Y", GUILayout.Width(15));
            float offsetY = EditorGUILayout.FloatField(tilingOffset.w, GUILayout.ExpandWidth(true));
            EditorGUILayout.EndHorizontal();

            // Apply tiling and offset to albedo, normal, and mask map
            textureProp.textureScaleAndOffset = new Vector4(tilingX, tilingY, offsetX, offsetY);
            normalProp.textureScaleAndOffset = textureProp.textureScaleAndOffset;
            if (maskMapProp != null && maskMapProp.textureValue != null)
            {
                maskMapProp.textureScaleAndOffset = textureProp.textureScaleAndOffset;
            }

            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();

            // Show Normal Intensity only if ENABLE_NORMAL_INTENSITY is toggled
            if (enableNormalIntensity.floatValue > 0)
            {
                editor.RangeProperty(intensityProp, "Normal Intensity");
            }

            // Show smoothness slider if no mask map, otherwise show remapping sliders with foldout
            if (maskMapProp == null || maskMapProp.textureValue == null)
            {
                editor.RangeProperty(smoothnessProp, "Smoothness");
            }
            else
            {
                maskMapFoldouts[layerIndex] = EditorGUILayout.Foldout(maskMapFoldouts[layerIndex], "Channel Remapping", true);
                if (maskMapFoldouts[layerIndex])
                {
                    DrawMinMaxSlider(editor, remapRMinMaxProp, "Metallic Range");
                    DrawMinMaxSlider(editor, remapGMinMaxProp, "AO Range");
                    DrawMinMaxSlider(editor, remapAMinMaxProp, "Smoothness Range");
                }
            }

            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.EndVertical();
        }

        private void DrawMinMaxSlider(MaterialEditor editor, MaterialProperty prop, string label)
        {
            EditorGUI.BeginChangeCheck();
            Vector2 value = prop.vectorValue;
            EditorGUILayout.MinMaxSlider(label, ref value.x, ref value.y, 0f, 1f);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo(label);
                prop.vectorValue = new Vector4(value.x, value.y, 0, 0);
            }
        }

        private void DrawControlSection(MaterialEditor editor)
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);

            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.BeginHorizontal(GUIStyle.none);

            // Control texture
            Rect controlRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newControl = (Texture)EditorGUI.ObjectField(new Rect(controlRect.x, controlRect.y, 70, 70), control.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo("Control Texture");
                control.textureValue = newControl;
            }

            // Control extra texture
            Rect controlExtraRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newControlExtra = (Texture)EditorGUI.ObjectField(new Rect(controlExtraRect.x, controlExtraRect.y, 70, 70), controlExtra.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo("Control Extra Texture");
                controlExtra.textureValue = newControlExtra;
            }

            EditorGUILayout.EndHorizontal();

            GUILayout.FlexibleSpace();

            EditorGUILayout.BeginVertical();
            Vector4 controlTilingOffset = control.textureScaleAndOffset;

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tiling", GUILayout.Width(40));
            EditorGUILayout.LabelField("X", GUILayout.Width(15));
            float tilingX = EditorGUILayout.FloatField(controlTilingOffset.x, GUILayout.ExpandWidth(true));
            EditorGUILayout.LabelField("Y", GUILayout.Width(15));
            float tilingY = EditorGUILayout.FloatField(controlTilingOffset.y, GUILayout.ExpandWidth(true));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Offset", GUILayout.Width(40));
            EditorGUILayout.LabelField("X", GUILayout.Width(15));
            float offsetX = EditorGUILayout.FloatField(controlTilingOffset.z, GUILayout.ExpandWidth(true));
            EditorGUILayout.LabelField("Y", GUILayout.Width(15));
            float offsetY = EditorGUILayout.FloatField(controlTilingOffset.w, GUILayout.ExpandWidth(true));
            EditorGUILayout.EndHorizontal();

            control.textureScaleAndOffset = new Vector4(tilingX, tilingY, offsetX, offsetY);
            controlExtra.textureScaleAndOffset = control.textureScaleAndOffset;

            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.EndVertical();
        }

        private void DrawGlobalSettingsSection(MaterialEditor editor)
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);
            editor.ColorProperty(specularColor, "Specular Color");
            editor.ShaderProperty(enableNormalIntensity, "Enable Normal Intensity");
            EditorGUILayout.EndVertical();
        }

        private void SwapLayerProperties(Material material, int indexA, int indexB)
        {
            Undo.RecordObject(material, "Swap Terrain Layers");

            // Swap textures
            Texture tempTexture = splats[indexA].textureValue;
            splats[indexA].textureValue = splats[indexB].textureValue;
            splats[indexB].textureValue = tempTexture;

            tempTexture = normals[indexA].textureValue;
            normals[indexA].textureValue = normals[indexB].textureValue;
            normals[indexB].textureValue = tempTexture;

            tempTexture = maskMaps[indexA].textureValue;
            maskMaps[indexA].textureValue = maskMaps[indexB].textureValue;
            maskMaps[indexB].textureValue = tempTexture;

            // Swap texture scale and offset
            Vector4 tempScaleOffset = splats[indexA].textureScaleAndOffset;
            splats[indexA].textureScaleAndOffset = splats[indexB].textureScaleAndOffset;
            splats[indexB].textureScaleAndOffset = tempScaleOffset;

            normals[indexA].textureScaleAndOffset = splats[indexA].textureScaleAndOffset;
            normals[indexB].textureScaleAndOffset = splats[indexB].textureScaleAndOffset;

            if (maskMaps[indexA].textureValue != null)
                maskMaps[indexA].textureScaleAndOffset = splats[indexA].textureScaleAndOffset;
            if (maskMaps[indexB].textureValue != null)
                maskMaps[indexB].textureScaleAndOffset = splats[indexB].textureScaleAndOffset;

            // Swap float values
            float tempFloat = normalIntensities[indexA].floatValue;
            normalIntensities[indexA].floatValue = normalIntensities[indexB].floatValue;
            normalIntensities[indexB].floatValue = tempFloat;

            tempFloat = smoothness[indexA].floatValue;
            smoothness[indexA].floatValue = smoothness[indexB].floatValue;
            smoothness[indexB].floatValue = tempFloat;

            // Swap vector values
            Vector4 tempVector = remapRMinMax[indexA].vectorValue;
            remapRMinMax[indexA].vectorValue = remapRMinMax[indexB].vectorValue;
            remapRMinMax[indexB].vectorValue = tempVector;

            tempVector = remapGMinMax[indexA].vectorValue;
            remapGMinMax[indexA].vectorValue = remapGMinMax[indexB].vectorValue;
            remapGMinMax[indexB].vectorValue = tempVector;

            tempVector = remapAMinMax[indexA].vectorValue;
            remapAMinMax[indexA].vectorValue = remapAMinMax[indexB].vectorValue;
            remapAMinMax[indexB].vectorValue = tempVector;

            // Force material update
            EditorUtility.SetDirty(material);
        }

        private new static MaterialProperty FindProperty(string propertyName, MaterialProperty[] properties, bool propertyIsMandatory = true)
        {
            MaterialProperty prop = System.Array.Find(properties, p => p.name == propertyName);
            if (prop == null && propertyIsMandatory)
                Debug.LogWarning($"Property {propertyName} not found in material.");
            return prop;
        }
    }
}
#endif