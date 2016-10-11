using UnityEngine;
using System.Collections;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using System;

namespace Gamma.PageHandling {
	public interface ITabButton {

		void Init();

		void AddListener (UnityAction<bool> valueChangedListener);

		void RemoveListener(UnityAction<bool> valueChangedListener);

		void SetSelected(bool selected);

		void Dispose();
	}
}
