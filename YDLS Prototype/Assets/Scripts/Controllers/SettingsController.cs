using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SettingsController : MonoBehaviour
{
    [Header("Game Controllers")]
    public SFXController SFXController;
    public GameController GameController;

    [Header("Containers")]
    public GameObject settingsContainer;
    public GameObject menuContainer;
    public GameObject homeScreenContainer;
    public TextMeshProUGUI narrativeText;
    public GameObject resolutionContainer;

    [Header("Audio Sources")]
    public AudioSource SFXAudioSource;
    public AudioSource MusicAudioSource;
    
    [Header("Game Objects")]
    public Slider fontSizeSlider;
    public Slider volumeSlider;
    public Toggle statToggle;
    public TMP_Dropdown resolutionDropdown;

    public TextMeshProUGUI fontSizeLabel;
    public TextMeshProUGUI volumeLabel;

    public bool inGameMenu;
    public bool muteSFX;

    private void Start()
    {
        muteSFX = true;

        fontSizeSlider.onValueChanged.AddListener(delegate { OnFontSliderValueChange(); });
        volumeSlider.onValueChanged.AddListener(delegate { OnVolumeSliderValueChange(); });
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

        inGameMenu = false;        

        if (PlayerPrefs.HasKey("Volume"))
        {
            volumeSlider.value = PlayerPrefs.GetFloat("Volume");
            OnVolumeSliderValueChange();
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
        //Debug.Log("Set Value: " + PlayerPrefs.GetFloat("Volume"));
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
