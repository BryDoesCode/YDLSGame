using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TempCharacterRandomizer : MonoBehaviour
{
    public List<CharacterCreationGroup> CharacterCreationGroups;
    public List<CharacterCreationArrayGroup> CharacterCreationArrayGroups;
    public List<CharacterCreationGroup> CharacterCreationGroupsColors;



    // Start is called before the first frame update
    void Start()
    {
        RandomizeCharacter();
    }
    public void RandomizeCharacter()
    {
        foreach (CharacterCreationGroup group in CharacterCreationGroups)
        {
            group.OnButtonSelected(group.characterCreationButtons[Random.Range(0, group.spritesToSwap.Count)]);
        }
        foreach (CharacterCreationArrayGroup group in CharacterCreationArrayGroups)
        {
            group.OnButtonSelected(group.characterCreationButtons[Random.Range(0, group.spritesToSwapContainer.Count)]);
        }
        foreach (CharacterCreationGroup group in CharacterCreationGroupsColors)
        {
            group.OnButtonSelected(group.characterCreationButtons[Random.Range(0, group.colorsToSwap.Count)]);
        }
    }
}
