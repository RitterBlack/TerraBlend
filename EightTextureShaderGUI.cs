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
        private List<MaterialProperty> layerVisibilities = new List<MaterialProperty>();
        private List<MaterialProperty> colorTints = new List<MaterialProperty>();
        private MaterialProperty control, control2, specularColor, enableNormalIntensity, mipMapBias, blendSmoothness;
        private bool[] maskMapFoldouts = new bool[8];
        private enum DisplaySection { Layers, ControlMap, GlobalSettings }
        private DisplaySection currentSection = DisplaySection.Layers; // Початкова секція

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {
            this.properties = properties;
            Material material = materialEditor.target as Material;

            FindProperties();

            EditorGUI.BeginChangeCheck();

            // Визначаємо активні та використані шари
            var (activeLayers, usedLayers, hiddenLayers) = GetActiveAndUsedLayerInfo(material);

            // Відображаємо кнопки для вибору секції
            DrawSectionButtons();

            // Відображаємо відповідну секцію
            switch (currentSection)
            {
                case DisplaySection.Layers:
                    EditorGUILayout.LabelField($"Layers (Active: {activeLayers}, Hidden: {hiddenLayers})", EditorStyles.boldLabel);
                    for (int i = 0; i < splats.Count; i++)
                    {
                        if (usedLayers[i])
                        {
                            // Отримуємо назву текстури Albedo
                            string textureName = splats[i].textureValue != null ? splats[i].textureValue.name : $"Layer {i + 1}";
                            DrawLayerSection(materialEditor, material, i, usedLayers, $"Layer {i + 1}: {textureName}", splats[i], normals[i], normalIntensities[i], smoothness[i], maskMaps[i],
                                remapRMinMax[i], remapGMinMax[i], remapAMinMax[i], colorTints[i]);
                            GUILayout.Space(5);
                        }
                    }
                    break;

                case DisplaySection.ControlMap:
                    EditorGUILayout.Space();
                    EditorGUILayout.LabelField("Control Map", EditorStyles.boldLabel);
                    DrawControlSection(materialEditor);
                    break;

                case DisplaySection.GlobalSettings:
                    EditorGUILayout.Space();
                    EditorGUILayout.LabelField("Global Settings", EditorStyles.boldLabel);
                    DrawGlobalSettingsSection(materialEditor);
                    break;
            }

            if (EditorGUI.EndChangeCheck())
            {
                materialEditor.PropertiesChanged();
            }
        }

        private void DrawSectionButtons()
        {
            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button("Layers", EditorStyles.toolbarButton))
            {
                currentSection = DisplaySection.Layers;
            }
            if (GUILayout.Button("Control Map", EditorStyles.toolbarButton))
            {
                currentSection = DisplaySection.ControlMap;
            }
            if (GUILayout.Button("Global Settings", EditorStyles.toolbarButton))
            {
                currentSection = DisplaySection.GlobalSettings;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();
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
            layerVisibilities.Clear();
            colorTints.Clear();

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
                layerVisibilities.Add(FindProperty($"_LayerVisibility{layerIndex}", properties, false));
                colorTints.Add(FindProperty($"_ColorTint{layerIndex}", properties, false));
                layerIndex++;
            }

            control = FindProperty("_Control", properties);
            control2 = FindProperty("_Control2", properties);
            specularColor = FindProperty("_SpecularColor", properties);
            enableNormalIntensity = FindProperty("_EnableNormalIntensity", properties);
            mipMapBias = FindProperty("_MipMapBias", properties);
            blendSmoothness = FindProperty("_BlendSmoothness", properties);
        }

        private (int activeLayers, bool[] usedLayers, int hiddenLayers) GetActiveAndUsedLayerInfo(Material material)
        {
            int activeLayers = 0;
            int hiddenLayers = 0;
            bool[] usedLayers = new bool[splats.Count];

            if (control != null && control.textureValue != null)
            {
                Texture2D controlTex = control.textureValue as Texture2D;
                if (controlTex != null)
                {
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

                    if (hasR)
                    {
                        usedLayers[0] = true;
                        if (layerVisibilities[0].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }
                    if (hasG)
                    {
                        usedLayers[1] = true;
                        if (layerVisibilities[1].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }
                    if (hasB)
                    {
                        usedLayers[2] = true;
                        if (layerVisibilities[2].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }
                    if (hasA)
                    {
                        usedLayers[3] = true;
                        if (layerVisibilities[3].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }

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

            if (control2 != null && control2.textureValue != null)
            {
                Texture2D controlTex2 = control2.textureValue as Texture2D;
                if (controlTex2 != null)
                {
                    bool wasReadable = controlTex2.isReadable;
                    if (!wasReadable)
                    {
                        string path = AssetDatabase.GetAssetPath(controlTex2);
                        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
                        if (importer != null)
                        {
                            importer.isReadable = true;
                            importer.SaveAndReimport();
                        }
                    }

                    Color[] pixels = controlTex2.GetPixels();
                    bool hasR = false, hasG = false, hasB = false, hasA = false;
                    foreach (Color pixel in pixels)
                    {
                        if (pixel.r > 0.01f) hasR = true;
                        if (pixel.g > 0.01f) hasG = true;
                        if (pixel.b > 0.01f) hasB = true;
                        if (pixel.a > 0.01f) hasA = true;
                    }

                    if (hasR)
                    {
                        usedLayers[4] = true;
                        if (layerVisibilities[4].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }
                    if (hasG)
                    {
                        usedLayers[5] = true;
                        if (layerVisibilities[5].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }
                    if (hasB)
                    {
                        usedLayers[6] = true;
                        if (layerVisibilities[6].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }
                    if (hasA)
                    {
                        usedLayers[7] = true;
                        if (layerVisibilities[7].floatValue > 0)
                            activeLayers++;
                        else
                            hiddenLayers++;
                    }

                    if (!wasReadable)
                    {
                        string path = AssetDatabase.GetAssetPath(controlTex2);
                        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
                        if (importer != null)
                        {
                            importer.isReadable = false;
                            importer.SaveAndReimport();
                        }
                    }
                }
            }

            activeLayers = Mathf.Min(activeLayers, splats.Count);
            return (activeLayers, usedLayers, hiddenLayers);
        }

        private void DrawLayerSection(MaterialEditor editor, Material material, int layerIndex, bool[] usedLayers, string displayName,
            MaterialProperty textureProp, MaterialProperty normalProp,
            MaterialProperty intensityProp, MaterialProperty smoothnessProp,
            MaterialProperty maskMapProp, MaterialProperty remapRMinMaxProp,
            MaterialProperty remapGMinMaxProp, MaterialProperty remapAMinMaxProp,
            MaterialProperty colorTintProp)
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);

            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.BeginVertical(GUILayout.Width(30));
            bool originalGUIEnabled = GUI.enabled;
            GUI.enabled = layerIndex > 0;
            if (GUILayout.Button("↑", GUILayout.Width(30), GUILayout.Height(20)))
            {
                SwapLayerProperties(material, layerIndex, layerIndex - 1);
            }
            GUI.enabled = false;
            for (int i = layerIndex + 1; i < usedLayers.Length; i++)
            {
                if (usedLayers[i])
                {
                    GUI.enabled = true;
                    break;
                }
            }
            if (GUILayout.Button("↓", GUILayout.Width(30), GUILayout.Height(20)))
            {
                SwapLayerProperties(material, layerIndex, layerIndex + 1);
            }
            GUI.enabled = true;
            bool isVisible = layerVisibilities[layerIndex].floatValue > 0;
            if (GUILayout.Button(isVisible ? "H" : "V", GUILayout.Width(30), GUILayout.Height(20)))
            {
                Undo.RecordObject(material, $"Toggle {displayName} Visibility");
                layerVisibilities[layerIndex].floatValue = isVisible ? 0 : 1;
                EditorUtility.SetDirty(material);
            }
            GUI.enabled = originalGUIEnabled;
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical();

            // Відображаємо назву шару та стан (Visible/Hidden)
            string statusLabel = isVisible ? "(Visible)" : "(Hidden)";
            EditorGUILayout.LabelField($"{displayName} {statusLabel}", EditorStyles.boldLabel);

            GUI.enabled = isVisible && originalGUIEnabled;

            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.BeginHorizontal(GUIStyle.none);

            Rect textureRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newTexture = (Texture)EditorGUI.ObjectField(new Rect(textureRect.x, textureRect.y, 70, 70), textureProp.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo(displayName + " Texture");
                textureProp.textureValue = newTexture;
            }

            Rect normalRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newNormal = (Texture)EditorGUI.ObjectField(new Rect(normalRect.x, normalRect.y, 70, 70), normalProp.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo(displayName + " Normal");
                normalProp.textureValue = newNormal;
            }

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

            textureProp.textureScaleAndOffset = new Vector4(tilingX, tilingY, offsetX, offsetY);
            normalProp.textureScaleAndOffset = textureProp.textureScaleAndOffset;
            if (maskMapProp != null && maskMapProp.textureValue != null)
            {
                maskMapProp.textureScaleAndOffset = textureProp.textureScaleAndOffset;
            }

            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();

            if (enableNormalIntensity.floatValue > 0)
            {
                editor.RangeProperty(intensityProp, "Normal Intensity");
            }

            if (colorTintProp != null)
            {
                editor.ColorProperty(colorTintProp, "Color Tint");
            }

            if (maskMapProp == null || maskMapProp.textureValue == null)
            {
                editor.RangeProperty(smoothnessProp, "Smoothness");
            }
            else
            {
                maskMapFoldouts[layerIndex] = EditorGUILayout.Foldout(maskMapFoldouts[layerIndex], "Channel Remapping", true);
                if (maskMapFoldouts[layerIndex])
                {
                    DrawMinMaxSlider(editor, remapRMinMaxProp, "R: Metallic Range");
                    DrawMinMaxSlider(editor, remapGMinMaxProp, "G: AO Range");
                    DrawMinMaxSlider(editor, remapAMinMaxProp, "A: Smoothness Range");
                }
            }

            GUI.enabled = originalGUIEnabled;

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

            Rect controlRect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newControl = (Texture)EditorGUI.ObjectField(new Rect(controlRect.x, controlRect.y, 70, 70), control.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo("Control Texture");
                control.textureValue = newControl;
            }

            Rect control2Rect = EditorGUILayout.GetControlRect(false, 70, GUILayout.Width(70));
            EditorGUI.BeginChangeCheck();
            Texture newControl2 = (Texture)EditorGUI.ObjectField(new Rect(control2Rect.x, control2Rect.y, 70, 70), control2.textureValue, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck())
            {
                editor.RegisterPropertyChangeUndo("Control2 Texture");
                control2.textureValue = newControl2;
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
            control2.textureScaleAndOffset = new Vector4(tilingX, tilingY, offsetX, offsetY);

            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.EndVertical();
        }

        private void DrawGlobalSettingsSection(MaterialEditor editor)
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);
            editor.ColorProperty(specularColor, "Specular Color");
            editor.ShaderProperty(enableNormalIntensity, "Enable Normal Intensity");
            editor.ShaderProperty(mipMapBias, new GUIContent("MipMap Bias", "Adjusts the mipmap level used for texture sampling (negative for sharper, positive for blurrier)"));
            editor.ShaderProperty(blendSmoothness, new GUIContent("Control2 Edge Smoothness", "Controls the smoothness of blending between Control1 and Control2"));
            EditorGUILayout.EndVertical();
        }

        private void SwapLayerProperties(Material material, int indexA, int indexB)
        {
            Undo.RecordObject(material, "Swap Terrain Layers");

            Texture tempTexture = splats[indexA].textureValue;
            splats[indexA].textureValue = splats[indexB].textureValue;
            splats[indexB].textureValue = tempTexture;

            tempTexture = normals[indexA].textureValue;
            normals[indexA].textureValue = normals[indexB].textureValue;
            normals[indexB].textureValue = tempTexture;

            tempTexture = maskMaps[indexA].textureValue;
            maskMaps[indexA].textureValue = maskMaps[indexB].textureValue;
            maskMaps[indexB].textureValue = tempTexture;

            Vector4 tempScaleOffset = splats[indexA].textureScaleAndOffset;
            splats[indexA].textureScaleAndOffset = splats[indexB].textureScaleAndOffset;
            splats[indexB].textureScaleAndOffset = tempScaleOffset;

            normals[indexA].textureScaleAndOffset = splats[indexA].textureScaleAndOffset;
            normals[indexB].textureScaleAndOffset = splats[indexB].textureScaleAndOffset;

            if (maskMaps[indexA].textureValue != null)
                maskMaps[indexA].textureScaleAndOffset = splats[indexA].textureScaleAndOffset;
            if (maskMaps[indexB].textureValue != null)
                maskMaps[indexB].textureScaleAndOffset = splats[indexB].textureScaleAndOffset;

            float tempFloat = normalIntensities[indexA].floatValue;
            normalIntensities[indexA].floatValue = normalIntensities[indexB].floatValue;
            normalIntensities[indexB].floatValue = tempFloat;

            tempFloat = smoothness[indexA].floatValue;
            smoothness[indexA].floatValue = smoothness[indexB].floatValue;
            smoothness[indexB].floatValue = tempFloat;

            tempFloat = layerVisibilities[indexA].floatValue;
            layerVisibilities[indexA].floatValue = layerVisibilities[indexB].floatValue;
            layerVisibilities[indexB].floatValue = tempFloat;

            if (colorTints[indexA] != null && colorTints[indexB] != null)
            {
                Color tempColor = colorTints[indexA].colorValue;
                colorTints[indexA].colorValue = colorTints[indexB].colorValue;
                colorTints[indexB].colorValue = tempColor;
            }

            Vector4 tempVector = remapRMinMax[indexA].vectorValue;
            remapRMinMax[indexA].vectorValue = remapRMinMax[indexB].vectorValue;
            remapRMinMax[indexB].vectorValue = tempVector;

            tempVector = remapGMinMax[indexA].vectorValue;
            remapGMinMax[indexA].vectorValue = remapGMinMax[indexB].vectorValue;
            remapGMinMax[indexB].vectorValue = tempVector;

            tempVector = remapAMinMax[indexA].vectorValue;
            remapAMinMax[indexA].vectorValue = remapAMinMax[indexB].vectorValue;
            remapAMinMax[indexB].vectorValue = tempVector;

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
