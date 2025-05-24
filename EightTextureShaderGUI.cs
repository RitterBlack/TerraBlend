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
        private List<MaterialProperty> heightBlendEnables = new List<MaterialProperty>();
        private List<MaterialProperty> heightParametrizations = new List<MaterialProperty>();
        private List<MaterialProperty> heightAmplitudes = new List<MaterialProperty>();
        private List<MaterialProperty> heightBases = new List<MaterialProperty>();
        private List<MaterialProperty> heightMins = new List<MaterialProperty>();
        private List<MaterialProperty> heightMaxs = new List<MaterialProperty>();
        private List<MaterialProperty> heightEdgeSmoothnesses = new List<MaterialProperty>();
        private MaterialProperty control, control2, specularColor, enableNormalIntensity, mipMapBias, blendSmoothness;
        private bool[] maskMapFoldouts = new bool[8];
        private static readonly string DocumentationPath = "Assets/ShaderDocumentation.pdf";

        private enum PanelCategory
        {
            Layers,
            ControlMap,
            GlobalSettings
        }
        private PanelCategory currentCategory = PanelCategory.Layers;

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {
            this.properties = properties;
            Material material = materialEditor.target as Material;

            FindProperties();

            EditorGUI.BeginChangeCheck();

            DrawCategorySelector();

            switch (currentCategory)
            {
                case PanelCategory.Layers:
                    DrawLayersSection(materialEditor, material);
                    break;
                case PanelCategory.ControlMap:
                    DrawControlSection(materialEditor);
                    break;
                case PanelCategory.GlobalSettings:
                    DrawGlobalSettingsSection(materialEditor);
                    break;
            }

            if (EditorGUI.EndChangeCheck())
            {
                materialEditor.PropertiesChanged();
            }
        }

        private void DrawCategorySelector()
        {
            EditorGUILayout.BeginHorizontal(EditorStyles.toolbar);

            if (GUILayout.Button("Layers", currentCategory == PanelCategory.Layers ? EditorStyles.toolbarButton : EditorStyles.toolbarButton, GUILayout.ExpandWidth(true)))
            {
                currentCategory = PanelCategory.Layers;
            }
            if (GUILayout.Button("Control Map", currentCategory == PanelCategory.ControlMap ? EditorStyles.toolbarButton : EditorStyles.toolbarButton, GUILayout.ExpandWidth(true)))
            {
                currentCategory = PanelCategory.ControlMap;
            }
            if (GUILayout.Button("Global Settings", currentCategory == PanelCategory.GlobalSettings ? EditorStyles.toolbarButton : EditorStyles.toolbarButton, GUILayout.ExpandWidth(true)))
            {
                currentCategory = PanelCategory.GlobalSettings;
            }

            EditorGUILayout.EndHorizontal();
        }

        private void DrawLayersSection(MaterialEditor materialEditor, Material material)
        {
            var (activeLayers, usedLayers, hiddenLayers) = GetActiveAndUsedLayerInfo(material);

            EditorGUILayout.LabelField($"Layers (Active: {activeLayers}, Hidden: {hiddenLayers})", EditorStyles.boldLabel);
            for (int i = 0; i < splats.Count; i++)
            {
                if (usedLayers[i])
                {
                    string textureName = GetLayerName(splats[i]);
                    DrawLayerSection(materialEditor, material, i, usedLayers, textureName, splats[i], normals[i], normalIntensities[i], smoothness[i], maskMaps[i],
                        remapRMinMax[i], remapGMinMax[i], remapAMinMax[i], colorTints[i], heightBlendEnables[i], heightParametrizations[i], heightAmplitudes[i], heightBases[i], heightMins[i], heightMaxs[i], heightEdgeSmoothnesses[i]);
                    GUILayout.Space(5);
                }
            }
        }

        private string GetLayerName(MaterialProperty splatProp)
        {
            if (splatProp.textureValue != null)
            {
                string assetPath = AssetDatabase.GetAssetPath(splatProp.textureValue);
                if (!string.IsNullOrEmpty(assetPath))
                {
                    return System.IO.Path.GetFileNameWithoutExtension(assetPath);
                }
            }
            return "None";
        }

        private void OpenDocumentation()
        {
            if (System.IO.File.Exists(DocumentationPath))
            {
                Application.OpenURL("file://" + System.IO.Path.GetFullPath(DocumentationPath));
            }
            else
            {
                EditorUtility.DisplayDialog("Documentation Not Found", $"Documentation file not found at {DocumentationPath}. Please ensure the file exists.", "OK");
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
            layerVisibilities.Clear();
            colorTints.Clear();
            heightBlendEnables.Clear();
            heightParametrizations.Clear();
            heightAmplitudes.Clear();
            heightBases.Clear();
            heightMins.Clear();
            heightMaxs.Clear();
            heightEdgeSmoothnesses.Clear();

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
                heightBlendEnables.Add(FindProperty($"_HeightBlendEnable{layerIndex}", properties, false));
                heightParametrizations.Add(FindProperty($"_HeightParametrization{layerIndex}", properties, false));
                heightAmplitudes.Add(FindProperty($"_HeightAmplitude{layerIndex}", properties, false));
                heightBases.Add(FindProperty($"_HeightBase{layerIndex}", properties, false));
                heightMins.Add(FindProperty($"_HeightMin{layerIndex}", properties, false));
                heightMaxs.Add(FindProperty($"_HeightMax{layerIndex}", properties, false));
                heightEdgeSmoothnesses.Add(FindProperty($"_HeightEdgeSmoothness{layerIndex}", properties, false));
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

        private void DrawLayerSection(MaterialEditor editor, Material material, int layerIndex, bool[] usedLayers, string textureName,
            MaterialProperty textureProp, MaterialProperty normalProp,
            MaterialProperty intensityProp, MaterialProperty smoothnessProp,
            MaterialProperty maskMapProp, MaterialProperty remapRMinMaxProp,
            MaterialProperty remapGMinMaxProp, MaterialProperty remapAMinMaxProp,
            MaterialProperty colorTintProp, MaterialProperty heightBlendEnableProp,
            MaterialProperty heightParametrizationProp, MaterialProperty heightAmplitudeProp,
            MaterialProperty heightBaseProp, MaterialProperty heightMinProp, MaterialProperty heightMaxProp,
            MaterialProperty heightEdgeSmoothnessProp)
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
                Undo.RecordObject(material, $"Toggle Layer {layerIndex + 1} Visibility");
                layerVisibilities[layerIndex].floatValue = isVisible ? 0 : 1;
                EditorUtility.SetDirty(material);
            }
            GUI.enabled = originalGUIEnabled;
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical();

            // Формування заголовка: Layer X: TextureName (Visible/Hidden)
            string statusLabel = isVisible ? "(Visible)" : "(Hidden)";
            string displayName = $"Layer {layerIndex + 1}: {textureName} {statusLabel}";
            EditorGUILayout.LabelField(displayName, EditorStyles.boldLabel);

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

                    editor.ShaderProperty(heightBlendEnableProp, "B: Height Range");

                    if (heightBlendEnableProp.floatValue > 0)
                    {
                        string[] parametrizationOptions = { "Amplitude", "Min Max" };
                        EditorGUI.BeginChangeCheck();
                        int selectedParametrization = EditorGUILayout.Popup("Height Parametrization", (int)heightParametrizationProp.floatValue, parametrizationOptions);
                        if (EditorGUI.EndChangeCheck())
                        {
                            editor.RegisterPropertyChangeUndo("Height Parametrization");
                            heightParametrizationProp.floatValue = selectedParametrization;
                        }

                        if (heightParametrizationProp.floatValue == 0)
                        {
                            editor.FloatProperty(heightAmplitudeProp, "Amplitude (cm)");
                            editor.FloatProperty(heightBaseProp, "Base (cm)");
                            editor.RangeProperty(heightEdgeSmoothnessProp, "Height Edge Smoothness");
                        }
                        else
                        {
                            editor.FloatProperty(heightMinProp, "Min (cm)");
                            editor.FloatProperty(heightMaxProp, "Max (cm)");
                            editor.RangeProperty(heightEdgeSmoothnessProp, "Height Edge Smoothness");
                        }
                    }

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
            EditorGUILayout.LabelField("Control Map", EditorStyles.boldLabel);

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
            EditorGUILayout.LabelField("Global Settings", EditorStyles.boldLabel);
            editor.ColorProperty(specularColor, "Specular Color");
            editor.ShaderProperty(enableNormalIntensity, "Enable Normal Intensity");
            editor.ShaderProperty(mipMapBias, new GUIContent("MipMap Bias", "Adjusts the mipmap level used for texture sampling (negative for sharper, positive for blurrier)"));
            editor.ShaderProperty(blendSmoothness, new GUIContent("Control2 Edge Smoothness", "Controls the smoothness of blending between Control1 and Control2"));
            
            EditorGUILayout.Space();
            if (GUILayout.Button("Open Shader Documentation", GUILayout.Height(30)))
            {
                OpenDocumentation();
            }
            
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

            tempFloat = heightBlendEnables[indexA].floatValue;
            heightBlendEnables[indexA].floatValue = heightBlendEnables[indexB].floatValue;
            heightBlendEnables[indexB].floatValue = tempFloat;

            tempFloat = heightParametrizations[indexA].floatValue;
            heightParametrizations[indexA].floatValue = heightParametrizations[indexB].floatValue;
            heightParametrizations[indexB].floatValue = tempFloat;

            tempFloat = heightAmplitudes[indexA].floatValue;
            heightAmplitudes[indexA].floatValue = heightAmplitudes[indexB].floatValue;
            heightAmplitudes[indexB].floatValue = tempFloat;

            tempFloat = heightBases[indexA].floatValue;
            heightBases[indexA].floatValue = heightBases[indexB].floatValue;
            heightBases[indexB].floatValue = tempFloat;

            tempFloat = heightMins[indexA].floatValue;
            heightMins[indexA].floatValue = heightMins[indexB].floatValue;
            heightMins[indexB].floatValue = tempFloat;

            tempFloat = heightMaxs[indexA].floatValue;
            heightMaxs[indexA].floatValue = heightMaxs[indexB].floatValue;
            heightMaxs[indexB].floatValue = tempFloat;

            tempFloat = heightEdgeSmoothnesses[indexA].floatValue;
            heightEdgeSmoothnesses[indexA].floatValue = heightEdgeSmoothnesses[indexB].floatValue;
            heightEdgeSmoothnesses[indexB].floatValue = tempFloat;

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