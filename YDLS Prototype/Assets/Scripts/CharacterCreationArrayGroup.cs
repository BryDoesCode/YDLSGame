using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CharacterCreationArrayGroup : MonoBehaviour
{
    public List<CharacterCreationArrayButton> characterCreationButtons;
    public Color buttonIdle;
    public Color buttonHover;
    public Color buttonActive;
    public CharacterCreationArrayButton selectedButton;
    public int selectedButtonIndex;


    public bool usesSprites;
    [System.Serializable]
    public class spritesToSwapList : IEnumerable<Image>
    {
        public List<Image> spritesToSwap;
        public IEnumerator<Image> GetEnumerator()
        {
            return spritesToSwap.GetEnumerator();
        }
        IEnumerator IEnumerable.GetEnumerator()
        {
            return spritesToSwap.GetEnumerator();
        }
    }
    public List<spritesToSwapList> spritesToSwapContainer = new List<spritesToSwapList>();
    //public List<List<Image>> spritesToSwap;
    public List<Color> colorsToSwap;

    [Header("Game Controllers")]
    public SFXController SFXController;

    private bool muteSFX = true;

    //public bool multipleColored;
    //public List<Image> extraSpritesToSwap;

    public void Start()
    {
        selectedButton.background.color = buttonActive;
    }
    public void Subscribe(CharacterCreationArrayButton button)
    {
        if (characterCreationButtons == null)
        {
            characterCreationButtons = new List<CharacterCreationArrayButton>();
        }

        characterCreationButtons.Add(button);
    }

    public void OnButtonEnter(CharacterCreationArrayButton button)
    {
        ResetButtons();
        if (selectedButton == null || button != selectedButton)
        {
            button.background.color = buttonHover;
        }
    }

    public void OnButtonExit(CharacterCreationArrayButton button)
    {
        ResetButtons();
    }

    public void OnButtonSelected(CharacterCreationArrayButton button)
    {
        if (selectedButton != null)
        {
            selectedButton.Deselect();
        }

        selectedButton = button;

        selectedButton.Select();
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }

        ResetButtons();
        button.background.color = buttonActive;

        selectedButtonIndex = button.transform.GetSiblingIndex();
        if (usesSprites)
        {
            for (int i = 0; i < spritesToSwapContainer.Count; i++)
            {
                if (i == selectedButtonIndex)
                {
                    foreach(Image sprite in spritesToSwapContainer[i])
                    {
                        sprite.gameObject.SetActive(true);
                    }                    
                }
                else
                {
                    foreach (Image sprite in spritesToSwapContainer[i])
                    {
                        sprite.gameObject.SetActive(false);
                    }
                }
            }
        }
        else
        {
            for (int i = 0; i < spritesToSwapContainer.Count; i++)
            {
                foreach (Image sprite in spritesToSwapContainer[i])
                {
                    sprite.color = colorsToSwap[selectedButtonIndex];
                }
            }
        }
    }

    public void ResetButtons()
    {
        foreach (CharacterCreationArrayButton button in characterCreationButtons)
        {
            if (selectedButton != null && button == selectedButton) { continue; }
            button.background.color = buttonIdle;
        }
    }

    public void MuteSFX(bool condition)
    {
        muteSFX = condition;
    }
}
