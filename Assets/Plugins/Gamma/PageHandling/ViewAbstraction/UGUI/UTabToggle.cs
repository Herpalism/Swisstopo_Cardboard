using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using System.Collections;
using System;

namespace Gamma.PageHandling.UGUI {
	[RequireComponent(typeof(Toggle))]
	public class UTabToggle : TabButton {

		public Toggle toggleButton {get; private set;}

		public override void Init()
		{
			toggleButton = GetComponent<Toggle>();
			Toggle.ToggleEvent evt = new Toggle.ToggleEvent();
			toggleButton.onValueChanged = evt;
		}

		public override void AddListener (UnityAction<bool> valueChangedListener)
		{
			toggleButton.onValueChanged.AddListener(valueChangedListener);
		}

		public override void RemoveListener(UnityAction<bool> valueChangedListener)
		{
			toggleButton.onValueChanged.RemoveListener(valueChangedListener);
		}

		public override void SetSelected(bool selected)
		{
			toggleButton.isOn = selected;
		}

		public override void Dispose()
		{
			Destroy(toggleButton);
		}
	}
}
