using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TempCharacterRandomizer : MonoBehaviour
{
    /*
    public CharacterCreationGroup FaceController;
    public CharacterCreationGroup EarController;
    public CharacterCreationGroup BodyController;
    public CharacterCreationGroup HairBaseController;
    public CharacterCreationGroup HairSideLeftController;
    public CharacterCreationGroup HairSideRightController;
    public CharacterCreationGroup HairFrontController;
    public CharacterCreationGroup HairBackController;
    public CharacterCreationGroup EyeShapeController;
    public CharacterCreationGroup EyebrowController;
    public CharacterCreationGroup NoseController;
    public CharacterCreationGroup MouthController;
    public CharacterCreationGroup ClothingController;



    public CharacterCreationGroup SkinColorController;
    public CharacterCreationGroup HairColorController;
    public CharacterCreationGroup EyeRightColorController;
    public CharacterCreationGroup EyeLeftColorController;
    public CharacterCreationGroup MouthColorController;
    public CharacterCreationGroup ClothingColorController;
    */

    public List<CharacterCreationGroup> CharacterCreationGroups;
    public List<CharacterCreationGroup> CharacterCreationGroupsColors;



    // Start is called before the first frame update
    void Start()
    {
        foreach (CharacterCreationGroup group in CharacterCreationGroups)
        {
            group.OnButtonSelected(group.characterCreationButtons[Random.Range(0, group.spritesToSwap.Count)]);
        }
        foreach (CharacterCreationGroup group in CharacterCreationGroupsColors)
        {
            group.OnButtonSelected(group.characterCreationButtons[Random.Range(0, group.colorsToSwap.Count)]);
        }

        /*
        int faceRandom = Random.Range(0, FaceController.spritesToSwap.Count);
        FaceController.OnButtonSelected(FaceController.characterCreationButtons[faceRandom]);

        int bangRandom = Random.Range(0, HairFrontController.spritesToSwap.Count);
        HairFrontController.OnButtonSelected(HairFrontController.characterCreationButtons[bangRandom]);

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
        */
    }

}
