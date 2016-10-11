using UnityEngine;
using System.Collections;
using System;
using System.Linq;
using System.Collections.Generic;
using Gamma.Tweening;

namespace Gamma.PageHandling {

	public class PageController : MonoBehaviour, IDisposable {

		public bool debugMode = false;

		[SerializeField]
		private bool initOnAwake = false;
		[SerializeField]
		private string overwritePageId;

		private PageTween[] pageTweens;

		protected NavigationController navigationController {get; private set;}
		protected TabController tabController {get; private set;}
		protected MultiPageController multiPageController {get; private set;}

		protected enum PageState {
			Undefined = 0,
			Unloaded = 1,
			Created = 2,
			Active = 3,
			Focus = 4
		}
		protected PageState state {get; private set;}

		public bool isCreated { 
			get {return state >= PageState.Created;}
		}
		public bool isActive { 
			get {return state >= PageState.Active;}
		}
		public bool isFocused { 
			get {return state >= PageState.Focus;}
		}

		public string pageId {
			get {
				if(string.IsNullOrEmpty(overwritePageId)){
					return this.GetType().ToString();
				}else{
					return overwritePageId;
				}
			}
		}

		public RectTransform rectTransform {
			get {
				return (transform as RectTransform);
			}
		}

		#region Init and Dispose
		public virtual void InitPageController(bool enabled = true)
		{
			if(state < PageState.Created){
				state = PageState.Created;
				OnPageCreate();

				if(enabled){
					EnablePage();
					PageDidAppear();
					SetFocus(PageTweenType.None);
				}else{
					gameObject.SetActive(enabled);
				}
			}
		}

		private void EnablePage()
		{
			gameObject.SetActive(true);
			this.state = PageState.Active;
			OnPageEnable();
		}

		private void DisablePage()
		{
			gameObject.SetActive(false);
			state = PageState.Created;
			OnPageDisable();
		}

		public void Dispose()
		{
			Destroy(this.gameObject);
			state = PageState.Undefined;
			OnPageDispose();
		}
		#endregion

		#region Monobehaviour Functions

		protected virtual void Awake()
		{
			if(initOnAwake)
				InitPageController();
		}

		protected virtual void OnDestroy()
		{
			if(state >= PageState.Created){
				Dispose();
			}
		}
		#endregion

		#region SetPageControllerAdministrators
		public virtual void SetNavigationController(NavigationController navigationController)
		{
			this.navigationController = navigationController;
			if(navigationController.tabController != null && navigationController.tabController != this.tabController){
				this.tabController = navigationController.tabController;
			}
		}

		public virtual void SetTabController(TabController tabController)
		{
			this.tabController = tabController;
			if(tabController.navigationController != null && tabController.navigationController != this.navigationController){
				this.navigationController = tabController.navigationController;
			}
		}

		internal virtual void SetMultiPageController(MultiPageController multiPageController)
		{
			this.multiPageController = multiPageController;
		}
		#endregion

		#region Creation Enable Disable and Destroy
		protected virtual void OnPageCreate()
		{
			if(debugMode)
				Debug.Log("OnPageCreate: " + this.ToString());

			pageTweens = GetComponents<PageTween>();
		}

		protected virtual void OnPageEnable()
		{
			if(debugMode)
				Debug.Log("OnPageEnable: " + this.ToString());
		}

		protected virtual void OnPageDisable()
		{
			if(debugMode)
				Debug.Log("OnPageDisable: " + this.ToString());
		}

		protected virtual void OnPageDispose()
		{
			if(debugMode)
				Debug.Log("OnPageDestroy: " + this.ToString());
		}
		#endregion

		#region viewable events
		public void PresentPage(PageTweenType tweenType, System.Action animationDone = null, ITweenable customPageTween = null)
		{
			if(isActive)
				return;

			EnablePage();

			PageWillAppear();

			ITweenable activeTween = customPageTween;
			if(activeTween == null){
				activeTween = (from pt in pageTweens where pt.tweenType.HasFlag(tweenType) select pt).FirstOrDefault();
			}

			if(tweenType == PageTweenType.None || activeTween == null){
				PageDidAppear();
				SetFocus(PageTweenType.None);
				if(animationDone != null)
					animationDone();
			}else{
				activeTween.StartTween(()=>{
					PageDidAppear();
					SetFocus(PageTweenType.None);
					if(animationDone != null)
						animationDone();
				});
			}
		}

		public void DismissPage(PageTweenType tweenType, System.Action finishCallback = null, ITweenable customPageTween = null)
		{
			if(!isActive)
				return;

			if(state == PageState.Focus){
				RemoveFocus(PageTweenType.None);
			}
			PageWillDisappear();

			ITweenable activeTween = customPageTween;
			if(activeTween == null){
				activeTween = (from pt in pageTweens where pt.tweenType.HasFlag(tweenType) select pt).FirstOrDefault();
			}

			//IF no animation present or animation disabled, Report instant back
			if(tweenType == PageTweenType.None || activeTween == null){
				PageDidDisappear();

				DisablePage();

				//fire callback if present
				if(finishCallback != null)
					finishCallback();
			}else{
				activeTween.StartTween(()=>{
					PageDidDisappear();

					DisablePage();

					//fire callback if present
					if(finishCallback != null)
						finishCallback();
				});
			}
		}

		public void SetFocus(PageTweenType tweenType, System.Action finishCallback = null, ITweenable customPageTween = null)
		{
			ITweenable activeTween = customPageTween;
			if(activeTween == null){
				activeTween = (from pt in pageTweens where pt.tweenType.HasFlag(tweenType) select pt).FirstOrDefault();
			}

			if(tweenType == PageTweenType.None || activeTween == null){
				state = PageState.Focus;
				OnPageGetFocus();

				if(finishCallback != null)
					finishCallback();
			}else{
				activeTween.StartTween(()=>{
					state = PageState.Focus;
					OnPageGetFocus();

					if(finishCallback != null)
						finishCallback();
				});
			}
		}

		public void RemoveFocus(PageTweenType tweenType, System.Action finishCallback = null, ITweenable customPageTween = null)
		{
			state = PageState.Active;
			OnPageLoseFocus();

			ITweenable activeTween = customPageTween;
			if(activeTween == null){
				activeTween = (from pt in pageTweens where pt.tweenType.HasFlag(tweenType) select pt).FirstOrDefault();
			}

			if(tweenType == PageTweenType.None || activeTween == null){

				if(finishCallback != null)
					finishCallback();
			}else{
				activeTween.StartTween(()=>{

					if(finishCallback != null)
						finishCallback();
				});
			}
		}

		protected virtual void PageWillAppear()
		{
			if(debugMode)
				Debug.Log("PageWillAppear: " + this.ToString());
		}

		protected virtual void PageDidAppear()
		{
			if(debugMode)
				Debug.Log("PageDidAppear: " + this.ToString());
		}

		protected virtual void PageWillDisappear()
		{
			if(debugMode)
				Debug.Log("PageWillDisappear: " + this.ToString());
		}

		protected virtual void PageDidDisappear()
		{
			if(debugMode)
				Debug.Log("PageDidDisappear: " + this.ToString());
		}

		protected virtual void OnPageGetFocus()
		{
			if(debugMode)
				Debug.Log("OnPageGetFocus: " + this.ToString());
		}

		protected virtual void OnPageLoseFocus()
		{
			if(debugMode)
				Debug.Log("OnPageLoseFocus: " + this.ToString());
		}
		#endregion

		public override string ToString ()
		{
			return string.Format ("[PageController: pageId={0}, state: {1}]", pageId, state);
		}
	}
}
