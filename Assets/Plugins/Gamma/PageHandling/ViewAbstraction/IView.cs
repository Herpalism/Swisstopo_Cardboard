using UnityEngine;
using System.Collections;
using System;

namespace Gamma.PageHandling{
	public interface IView {

		Transform transform {get;}
		RectTransform rectTransform {get;}

		Action<bool, IView> onVisibilityChange {get; set;}

		void Init();
		void SetVisible(bool visible);
		void Dispose();
	}
}
