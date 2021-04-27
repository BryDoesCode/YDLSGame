using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using System;

public class SettingsController : MonoBehaviour
{
    [Header("Game Controllers")]
    public SFXController SFXController;
    public GameController GameController;
    public MusicController MusicController;

    [Header("Containers")]
    public GameObject settingsContainer;
    public TextMeshProUGUI narrativeText;
    public GameObject resolutionContainer;
    public GameObject closeButtonContainer;
    public RectTransform insideBackgroundRect;

    [Header("Audio Sources")]
    public AudioSource SFXAudioSource;
    public AudioSource MusicAudioSource;
    
    [Header("Game Objects")]
    public Slider fontSizeSlider;
    public Slider musicVolumeSlider;
    public Slider SFXVolumeSlider;
    public Toggle statToggle;
    public TMP_Dropdown resolutionDropdown;

    public TextMeshProUGUI fontSizeLabel;
    public TextMeshProUGUI musicVolumeLabel;
    public TextMeshProUGUI SFXVolumeLabel;

    public bool muteSFX;

    private void Start()
    {
        muteSFX = true;

        fontSizeSlider.onValueChanged.AddListener(delegate { OnFontSliderValueChange(); });
        musicVolumeSlider.onValueChanged.AddListener(delegate { OnMusicVolumeSliderValueChange(); });
        SFXVolumeSlider.onValueChanged.AddListener(delegate { OnSFXVolumeSliderValueChange(); });
        statToggle.onValueChanged.AddListener(delegate { OnStatToggleValueChange(); });

        resolutionContainer.SetActive(false);

        // Checking for Windows/OSX Builds
        #if UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN || UNITY_STANDALONE_OSX
        resolutionContainer.SetActive(true);
        resolutionDropdown.onValueChanged.AddListener(delegate { OnResolutionDropdownValueChange(); });

        int displayHeight = Display.main.systemHeight;

        if (displayHeight < 1920)
        {
            resolutionDropdown.options.RemoveAt(3);
            if(displayHeight < 1280)
            {
                resolutionDropdown.options.RemoveAt(2);
                if(displayHeight < 960)
                {
                    resolutionDropdown.options.RemoveAt(1);
                    resolutionDropdown.value = 0;
                    OnResolutionDropdownValueChange();
                }
            }
        }

        if (PlayerPrefs.HasKey("Resolution"))
        {
            resolutionDropdown.value = PlayerPrefs.GetInt("Resolution");
            OnResolutionDropdownValueChange();
        }
        #endif

        if (PlayerPrefs.HasKey("MusicVolume"))
        {
            musicVolumeSlider.value = PlayerPrefs.GetFloat("MusicVolume");
            OnMusicVolumeSliderValueChange();
        }
        else
        {
            musicVolumeSlider.value = .5f;
        }

        if(PlayerPrefs.HasKey("SFXVolume"))
        {
            SFXVolumeSlider.value = PlayerPrefs.GetFloat("SFXVolume");
            OnSFXVolumeSliderValueChange();
        }
        else
        {
            SFXVolumeSlider.value = .5f;
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
        if (PlayerPrefs.HasKey("StatToggle"))
        {
            if (PlayerPrefs.GetInt("StatToggle") == 1)
            {
                statToggle.isOn = true;
            }
            else
            {
                statToggle.isOn = false;
            }
        }
        else
        {
            statToggle.isOn = true;
        }
    }

    public void OnClickSettingsButton()
    {
        // This is when the button is clicked from the Start Menu

        settingsContainer.SetActive(true);
        SFXController.PlayButtonClick();
        closeButtonContainer.SetActive(true);
        insideBackgroundRect.offsetMin = new Vector2(insideBackgroundRect.offsetMin.x, 30);

        muteSFX = false;
    }

    public void OnClickCloseButton()
    {
        settingsContainer.SetActive(false);      
        SFXController.PlayButtonClick();
        closeButtonContainer.SetActive(false);
        insideBackgroundRect.offsetMin = new Vector2(insideBackgroundRect.offsetMin.x, 220);

        muteSFX = true;
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

    private void OnMusicVolumeSliderValueChange()
    {
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }

        float value = musicVolumeSlider.value;
        musicVolumeLabel.text = (Math.Round(value, 2) * 100).ToString();
        MusicController.UpdateVolume(value);

        PlayerPrefs.SetFloat("MusicVolume", value);
        PlayerPrefs.Save();
    }
    private void OnSFXVolumeSliderValueChange()
    {
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }

        float value = SFXVolumeSlider.value;
        SFXVolumeLabel.text = (Math.Round(value, 2) * 100).ToString();
        SFXController.UpdateVolume(value);

        PlayerPrefs.SetFloat("SFXVolume", value);
        PlayerPrefs.Save();
    }

    public void OnStatToggleValueChange()
    {
        bool state = statToggle.isOn;
        if (state)
        {
            GameController.CallInkStatHintFunction(1);
            PlayerPrefs.SetInt("StatToggle", 1);
            PlayerPrefs.Save();
        }
        else
        {
            GameController.CallInkStatHintFunction(0);
            PlayerPrefs.SetInt("StatToggle", 0);
            PlayerPrefs.Save();
        }
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }
    }

    public void UpdateStatToggle(int state)
    {
        if (state == 1) {
            statToggle.isOn = true;
        }
        else
        {
            statToggle.isOn = false;
        }
    }
    public void MuteSFX(bool condition)
    {
        muteSFX = condition;
    }

    public void OnResolutionDropdownValueChange()
    {
        int width = 540;
        int height = 960;
        int value = resolutionDropdown.value;
        switch (value)
        {
            case 3:
                width = 1080;
                height = 1920;
                break;
            case 2:
                width = 720;
                height = 1280;
                break;
            case 1:
                break;
            case 0:
                width = 432;
                height = 768;
                break;
            default:
                Debug.Log("Unknown Resolution");
                break;
        }
        Screen.SetResolution(width, height, false);
        Canvas.ForceUpdateCanvases();
        PlayerPrefs.SetInt("Resolution", value);
        PlayerPrefs.Save();
    }
}
