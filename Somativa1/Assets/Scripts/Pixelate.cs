using UnityEngine;

[ExecuteInEditMode]
public class Pixelate : MonoBehaviour
{
    public Shader shader;
    
    [Range(1, 100)]
    public int    PixelSize = 8;

    protected void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Material material = new Material(shader);
        material.SetFloat("_PixelSize", PixelSize);
        Graphics.Blit(source, destination, material);
    }
}