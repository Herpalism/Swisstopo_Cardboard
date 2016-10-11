using UnityEngine;
using System.Collections;
using Gamma.PageHandling.UGUI;

namespace Gamma.PageHandling {
	public class TabButton : UView, ITabButton {
		
		#region ITabButton implementation

		public virtual void Init ()
		{
			
		}

		public virtual void AddListener (UnityEngine.Events.UnityAction<bool> valueChangedListener)
		{
			
		}

		public virtual void RemoveListener (UnityEngine.Events.UnityAction<bool> valueChangedListener)
		{
			
		}

		public virtual void SetSelected (bool selected)
		{
			
		}

		public override void Dispose ()
		{
			base.Dispose();
		}

		#endregion

	}
}
