using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BinaryMask : MonoBehaviour
{
    public Shader shader;
    public Texture texture;
    private Material _material;

    void Start() {
        // Verifica se o shader existe (Evita NullPointerException)
        var shader = Shader.Find("Hidden/BinaryMask");
        
        if (shader == null) {
            Debug.LogError("Failed to find shader");
            return;
        }

        _material = new Material(shader);        
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination) {
        // Pega a textura
        _material.SetTexture("_Mask", texture);

        // Renderiza 
        Graphics.Blit(source, destination, _material);
    }
}
