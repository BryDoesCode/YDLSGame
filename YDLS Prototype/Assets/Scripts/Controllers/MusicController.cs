using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;
public class MusicController : MonoBehaviour
{

    public AudioClip startMenuMusic;
    public AudioClip apartmentMusic;
    public AudioClip exteriorCityMusic;
    public AudioClip exteriorRainMusic;
    public AudioClip workMusic;
    public AudioClip storeMusic;
    public AudioClip parentKitchenMusic;

    private AudioSource audioSource;
    public AudioMixer audioMixer;

    private string currentMusicName = "";
    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void MusicPlayer(string musicName)
    {
        if (!musicName.Equals(currentMusicName))
        {
            StartCoroutine(FadeMixerGroup.StartFade(audioMixer, "FadeParameter", 3f, 0f));
            audioSource.Stop();
            switch (musicName)
            {
                case "apartmentMorning":
                    audioSource.clip = apartmentMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "apartmentEvening":
                    audioSource.clip = apartmentMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "startMenu":
                    audioSource.clip = startMenuMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "work":
                    audioSource.clip = workMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "store":
                    audioSource.clip = storeMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "exteriorCity":
                    audioSource.clip = exteriorCityMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "rain":
                    audioSource.clip = exteriorRainMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "parentKitchen":
                    audioSource.clip = parentKitchenMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                default:
                    Debug.Log("Unknown Music: " + musicName);
                    break;
            }
            currentMusicName = musicName;
            audioSource.Play();
            StartCoroutine(FadeMixerGroup.StartFade(audioMixer, "FadeParameter", 6f, 4f));
        }
    }

    public void UpdateVolume(float value)
    {
        audioMixer.SetFloat("MusicVolumeParameter", Mathf.Log10(value) * 20);
    }
}
