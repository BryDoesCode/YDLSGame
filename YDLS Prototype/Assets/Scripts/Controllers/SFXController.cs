using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

public class SFXController : MonoBehaviour
{
    [Header("Narrative SFX")]
    public AudioClip showerSFX;
    public AudioClip eatingSFX;
    public AudioClip writingSFX;
    public AudioClip knockingSFX;
    public AudioClip doorCloseSFX;

    [Header("UI SFX")]
    public AudioClip buttonClick;
    public AudioClip registerDing;

    private AudioSource audioSource;
    public AudioMixer audioMixer;

    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void SFXPlayer(string sfxName)
    {
        switch (sfxName)
        {
            case "knockingSFX":
                audioSource.PlayOneShot(knockingSFX);
                Debug.Log("Played: " + sfxName);
                break;

            case "writingSFX":
                audioSource.PlayOneShot(writingSFX);
                Debug.Log("Played: " + sfxName);
                break;

            case "doorCloseSFX":
                audioSource.PlayOneShot(doorCloseSFX);
                Debug.Log("Played: " + sfxName);
                break;

            case "showerSFX":
                audioSource.PlayOneShot(showerSFX);
                Debug.Log("Played: " + sfxName);
                break;

            case "eatingSFX":
                audioSource.PlayOneShot(eatingSFX);
                Debug.Log("Played: " + sfxName);
                break;

            default:
                Debug.Log("Unknown SFX: " + sfxName);
                break;
        }
    }

    public void PlayButtonClick()
    {
        audioSource.PlayOneShot(buttonClick);
        //Debug.Log("Click: " + audioSource.volume);
    }

    public void PlayRegisterDing()
    {
        audioSource.PlayOneShot(registerDing);
    }

    public void UpdateVolume(float value)
    {
        audioMixer.SetFloat("SFXVolumeParameter", Mathf.Log10(value) * 20);
    }
}
