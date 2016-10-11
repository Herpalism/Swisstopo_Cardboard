using UnityEngine;
using System.Collections;
using Gamma.Tweening;
using System;

namespace Gamma.PageHandling {

	[Flags]
	public enum PageTweenType {
		None = 0,
		PushEnable = 1,
		PushDisable = 2,
		PopEnable = 4,
		PopDisable = 8,
		GetFocus = 16,
		LoseFocus = 32
	}

	public abstract class PageTween : MonoBehaviour, ITweenable {

		public PageTweenType tweenType;
		protected System.Action finishedCallback;

		public virtual void StartTween(System.Action callback)
		{
			this.finishedCallback = callback;
		}
	}
}
