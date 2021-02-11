using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI.ProceduralImage;
using UnityEngine.Events;

[RequireComponent(typeof(ProceduralImage))]

public class CharacterCreationButton : MonoBehaviour, IPointerEnterHandler, IPointerClickHandler, IPointerExitHandler
{
    public CharacterCreationGroup characterCreationGroup;

    public ProceduralImage background;

    public UnityEvent onButtonSelected;
    public UnityEvent onButtonDeselected;

    public void OnPointerClick(PointerEventData eventData)
    {
        characterCreationGroup.OnButtonSelected(this);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        characterCreationGroup.OnButtonEnter(this);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        characterCreationGroup.OnButtonExit(this);
    }

    private void Start()
    {
        characterCreationGroup.Subscribe(this);
    }

    public void Select()
    {
        if (onButtonSelected != null)
        {
            onButtonSelected.Invoke();
        }
    }

    public void Deselect()
    {
        if (onButtonDeselected != null)
        {
            onButtonDeselected.Invoke();
        }
    }
}
