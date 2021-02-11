using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class StartMenuController : MonoBehaviour
{
    public GameObject startMenuContainer;
    public GameObject characterCreationContainer;
    [Header("Game Controllers")]
    public GameController GameController;
    public SFXController SFXController;
    public SettingsController SettingsController;
    public StoreController StoreController;
    public List<CharacterCreationGroup> CharacterCreationGroups;

    [Header("Containers")]
    public GameObject startMenuModalContainer;
    public GameObject firstConfirmationModalContainer;
    public GameObject secondConfirmationModalContainer;
    public GameObject finalConfirmationModalContainer;
    public GameObject noSavedLifeContainer;
    public GameObject aboutContainer;

    public void OnClickNewLife()
    {
        SFXController.PlayButtonClick();
        if (PlayerPrefs.HasKey("inkSaveState"))
        {
            Debug.Log("Saved Game Already Exists!");
            startMenuModalContainer.SetActive(true);
            firstConfirmationModalContainer.SetActive(true);
        }
        else
        {
            startMenuContainer.SetActive(false);
            GameController.StoryLoop();

            // Allow controllers to play SFX again
            foreach (CharacterCreationGroup group in CharacterCreationGroups)
            {
                group.MuteSFX(false);
            }
            SettingsController.MuteSFX(false);
            StoreController.MuteSFX(false);        

        }

    }

    public void OnClickLoadLife()
    {
        SFXController.PlayButtonClick();
        if (PlayerPrefs.HasKey("inkSaveState"))
        {
            // Hide containers
            startMenuContainer.SetActive(false);
            characterCreationContainer.SetActive(false);

            // Update and start game
            GameController.UpdateLoadedVariables();
            GameController.StoryLoop();

            // Allow controllers to play SFX again
            SettingsController.MuteSFX(false);
            StoreController.MuteSFX(false);
        }
        else
        {
            Debug.Log("No saved game exists!");
            startMenuModalContainer.SetActive(true);
            noSavedLifeContainer.SetActive(true);
        }
    }

    public void OnClickClose()
    {
        SFXController.PlayButtonClick();
        Debug.Log("QUIT");
        Application.Quit();
    }

    public void OnClickFirstConfirmation(bool choice)
    {
        SFXController.PlayButtonClick();
        if (choice)
        {
            secondConfirmationModalContainer.SetActive(true);
            firstConfirmationModalContainer.SetActive(false);
        }
        else
        {
            startMenuModalContainer.SetActive(false);
        }
        firstConfirmationModalContainer.SetActive(false);

    }

    public void OnClickSecondConfirmation(bool choice)
    {
        SFXController.PlayButtonClick();
        if (choice)
        {            
            GameController.ResetStoryState();
            finalConfirmationModalContainer.SetActive(true);
        }
        else
        {
            startMenuModalContainer.SetActive(false);
        }

        secondConfirmationModalContainer.SetActive(false);

    }

    public void OnClickFinalConfirm()
    {
        SFXController.PlayButtonClick();
        finalConfirmationModalContainer.SetActive(false);
        startMenuModalContainer.SetActive(false);
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    public void OnClickNoSavedLifeButton(bool choice)
    {
        SFXController.PlayButtonClick();
        if (choice)
        {
            OnClickNewLife();
        }

        noSavedLifeContainer.SetActive(false);
        startMenuModalContainer.SetActive(false);
    }

    public void OnClickAboutButton()
    {
        SFXController.PlayButtonClick();
        aboutContainer.SetActive(true);
    }

    public void OnClickAboutCloseButton()
    {
        SFXController.PlayButtonClick();
        aboutContainer.SetActive(false);
    }
}
