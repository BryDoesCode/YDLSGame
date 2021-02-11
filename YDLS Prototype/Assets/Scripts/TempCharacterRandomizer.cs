using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TempCharacterRandomizer : MonoBehaviour
{
    public CharacterCreationGroup FaceController;
    public CharacterCreationGroup BangController;
    public CharacterCreationGroup HairBackController;
    public CharacterCreationGroup EyeShapeController;


    public CharacterCreationGroup SkinColorController;
    public CharacterCreationGroup HairColorController;
    public CharacterCreationGroup EyeColorController;
    
    // Start is called before the first frame update
    void Start()
    {
        int faceRandom = Random.Range(0, FaceController.spritesToSwap.Count);
        FaceController.OnButtonSelected(FaceController.characterCreationButtons[faceRandom]);

        int bangRandom = Random.Range(0, BangController.spritesToSwap.Count);
        BangController.OnButtonSelected(BangController.characterCreationButtons[bangRandom]);

        int hairbackRandom = Random.Range(0, HairBackController.spritesToSwap.Count);
        HairBackController.OnButtonSelected(HairBackController.characterCreationButtons[hairbackRandom]);

        int eyeShapeRandom = Random.Range(0, EyeShapeController.spritesToSwap.Count);
        EyeShapeController.OnButtonSelected(EyeShapeController.characterCreationButtons[eyeShapeRandom]);

        int skinColorRandom = Random.Range(0, SkinColorController.colorsToSwap.Count);
        SkinColorController.OnButtonSelected(SkinColorController.characterCreationButtons[skinColorRandom]);

        int hairColorRandom = Random.Range(0, HairColorController.colorsToSwap.Count);
        HairColorController.OnButtonSelected(HairColorController.characterCreationButtons[hairColorRandom]);

        int eyeColorRandom = Random.Range(0, EyeColorController.colorsToSwap.Count);
        EyeColorController.OnButtonSelected(EyeColorController.characterCreationButtons[eyeColorRandom]);
        
    }

}
