using UnityEngine;
using System.Collections;
using System;

namespace Gamma.PageHandling.UGUI {
	public class UView : MonoBehaviour, IView {

		public bool initOnWake = true;

		#region IView implementation

		public RectTransform rectTransform {
			get {
				return (transform as RectTransform);
			}
		}

		void Awake()
		{
			if(initOnWake)
				Init();
		}

		public virtual void Init()
		{
			visible = false;
			SetVisible(true);
		}

		public Action<bool, IView> onVisibilityChange {get; set;}

		protected bool visible;
		public void SetVisible(bool visible)
		{
			if(this.visible ==visible)
				return;
			
			this.visible = visible;

			if(visible){
				OnViewVisible();
			}else{
				OnViewInvisible();
			}
		}

		public virtual void Dispose()
		{
			if(this != null && this.gameObject != null)
				Destroy(gameObject);
		}

		#endregion

		protected virtual void OnViewVisible()
		{
			if(onVisibilityChange != null)
				onVisibilityChange(true, this);
		}

		protected virtual void OnViewInvisible()
		{
			if(onVisibilityChange != null)
				onVisibilityChange(false, this);
		}
	}
}
