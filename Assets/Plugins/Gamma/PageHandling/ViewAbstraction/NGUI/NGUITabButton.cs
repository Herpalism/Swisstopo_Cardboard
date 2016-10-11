using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Gamma.PageHandling;
using UnityEngine.Events;

#if NGUI
namespace Gamma.PageHandling.NGUI {
	public class NGUITabButton : TabButton {

		public UIButton button;

		private bool selected = false;
		private UnityAction<bool> valueChangedListeners;
		private EventDelegate eventDele;
		#region NGUI buttonListner

		private void ButtonClickListener()
		{
			if(!selected && valueChangedListeners != null){
				valueChangedListeners(true);
			}
		}

		#endregion

		#region ITabButton implementation
		public override void Init ()
		{
			selected = false;
			eventDele = new EventDelegate(ButtonClickListener);

		}
		public override void AddListener (UnityAction<bool> valueChangedListener)
		{
			this.valueChangedListeners = valueChangedListener;
			button.onClick.Add(eventDele);
		}
		public override void RemoveListener (UnityAction<bool> valueChangedListener)
		{
			this.valueChangedListeners = null;
			button.onClick.Remove(eventDele);
		}
		public override void SetSelected (bool selected)
		{
			this.selected = selected;

			button.isEnabled = !selected;
			buttonColor.defaultColor = (selected ? Color.black : Color.white);
		}
		public override void Dispose ()
		{
			Destroy(gameObject);
		}
		#endregion
	}
}
#endif
