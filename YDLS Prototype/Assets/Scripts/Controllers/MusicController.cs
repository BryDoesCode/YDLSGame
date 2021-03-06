﻿using System.Collections;
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
    public AudioClip busMusic;
    public AudioClip hospitalMusic;
    public AudioClip movingVanMusic;
    public AudioClip taxiMusic;
    public AudioClip walkingMusic;


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
            StartCoroutine(FadeMixerGroup.StartFade(audioMixer, "FadeParameter", 6f, 0f));
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
                case "bus":
                    audioSource.clip = busMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "walking":
                    audioSource.clip = walkingMusic;
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
                
                case "hospital":
                    audioSource.clip = hospitalMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "taxi":
                    audioSource.clip = taxiMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                case "van":
                    audioSource.clip = movingVanMusic;
                    Debug.Log("Playing: " + musicName);
                    break;

                default:
                    Debug.Log("Unknown Music: " + musicName);
                    break;
            }
            currentMusicName = musicName;
            audioSource.Play();
            StartCoroutine(FadeMixerGroup.StartFade(audioMixer, "FadeParameter", 6f, 1f));
        }
    }

    public void UpdateVolume(float value)
    {
        audioMixer.SetFloat("MusicVolumeParameter", Mathf.Log10(value) * 20);
    }
}
