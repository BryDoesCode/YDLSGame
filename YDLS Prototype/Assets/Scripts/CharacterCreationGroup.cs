using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CharacterCreationGroup : MonoBehaviour
{
    public List<CharacterCreationButton> characterCreationButtons;
    public Color buttonIdle;
    public Color buttonHover;
    public Color buttonActive;
    public CharacterCreationButton selectedButton;
    public int selectedButtonIndex;

    
    public bool usesSprites;
    public List<Image> spritesToSwap;
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
    public void Subscribe(CharacterCreationButton button)
    {
        if (characterCreationButtons == null)
        {
            characterCreationButtons = new List<CharacterCreationButton>();
        }

        characterCreationButtons.Add(button);
    }

    public void OnButtonEnter(CharacterCreationButton button)
    {
        ResetButtons();
        if (selectedButton == null || button != selectedButton)
        {
            button.background.color = buttonHover;
        }
    }

    public void OnButtonExit(CharacterCreationButton button)
    {
        ResetButtons();
    }

    public void OnButtonSelected(CharacterCreationButton button)
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
            for (int i = 0; i < spritesToSwap.Count; i++)
            {
                if (i == selectedButtonIndex)
                {
                    spritesToSwap[i].gameObject.SetActive(true);
                }
                else
                {
                    spritesToSwap[i].gameObject.SetActive(false);
                }
            }
        }
        else
        {
            for (int i = 0; i < spritesToSwap.Count; i++)
            {
                spritesToSwap[i].color = colorsToSwap[selectedButtonIndex];
            }
        }
    }

    public void ResetButtons()
    {
        foreach (CharacterCreationButton button in characterCreationButtons)
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
