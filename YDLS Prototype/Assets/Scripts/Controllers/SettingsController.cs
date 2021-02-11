using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SettingsController : MonoBehaviour
{
    [Header("Game Controllers")]
    public SFXController SFXController;

    [Header("Containers")]
    public GameObject settingsContainer;
    public GameObject menuContainer;
    public GameObject homeScreenContainer;
    public TextMeshProUGUI narrativeText;

    [Header("Audio Sources")]
    public AudioSource SFXAudioSource;
    public AudioSource MusicAudioSource;
    
    [Header("Game Objects")]
    public Slider fontSizeSlider;
    public Slider volumeSlider;

    public TextMeshProUGUI fontSizeLabel;
    public TextMeshProUGUI volumeLabel;

    public bool inGameMenu;
    public bool muteSFX;

    private void Start()
    {
        muteSFX = true;

        fontSizeSlider.onValueChanged.AddListener(delegate { OnFontSliderValueChange(); });
        volumeSlider.onValueChanged.AddListener(delegate { OnVolumeSliderValueChange(); });

        inGameMenu = false;        

        if (PlayerPrefs.HasKey("Volume"))
        {
            volumeSlider.value = PlayerPrefs.GetFloat("Volume");
            volumeLabel.text = volumeSlider.value.ToString();
        }
        else
        {
            volumeSlider.value = 50;
        }
        if (PlayerPrefs.HasKey("FontSize"))
        {
            fontSizeSlider.value = PlayerPrefs.GetFloat("FontSize");
            fontSizeLabel.text = fontSizeSlider.value.ToString();
        }
        else
        {
            fontSizeSlider.value = narrativeText.fontSize;
        }
    }

    public void OnClickSettingsButton()
    {
        settingsContainer.SetActive(true);
        MuteSFX(false);
        settingsContainer.transform.GetChild(0).gameObject.SetActive(true);
        inGameMenu = false;        
        SFXController.PlayButtonClick();
            
    }

    public void OnClickCloseButton()
    {
        settingsContainer.SetActive(false);
        if (inGameMenu)
        {
            homeScreenContainer.SetActive(true);
        }

        SFXController.PlayButtonClick();
        MuteSFX(true);

    }

    private void OnFontSliderValueChange()
    {
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }

        float value = fontSizeSlider.value;
        fontSizeLabel.text = value.ToString();
        narrativeText.fontSize = value;

        PlayerPrefs.SetFloat("FontSize", value);
        PlayerPrefs.Save();

    }

    private void OnVolumeSliderValueChange()
    {
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }

        float value = volumeSlider.value;
        volumeLabel.text = value.ToString();
        SFXAudioSource.volume = value / 100f;
        MusicAudioSource.volume = value / 100f;

        PlayerPrefs.SetFloat("Volume", value);
        PlayerPrefs.Save();
    }

    public void MuteSFX(bool condition)
    {
        muteSFX = condition;
    }
}
