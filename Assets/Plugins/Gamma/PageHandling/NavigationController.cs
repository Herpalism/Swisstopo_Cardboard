using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System;

namespace Gamma.PageHandling {
	public class NavigationController : PageController {

		[Serializable]
		public class NavigationControllerSetup {
			public bool isPreSetup;
			public PageController initialPageController;
			public PageController[] preSetupPageControllers;
		}
		#region Editor Serialized Fields
		public NavigationControllerSetup preSetup;

		public bool animatePagesSerial = true;

		public bool sortChildIndexByStack = false;
		#endregion

		protected List<PageController> pageStack {get; private set;}
		private List<PageController> activeStackOnDisable;
		public PageController currentPage
		{
			get {
				if(pageStack == null || pageStack .Count == 0){
					return null;
				}
				return pageStack[pageStack.Count-1];
			}
		}

		protected override void OnPageCreate ()
		{
			base.OnPageCreate ();

			if(preSetup.isPreSetup)
			{
				InitNavivationController(preSetup.initialPageController);
			}
		}

		protected override void OnPageEnable ()
		{
			base.OnPageEnable ();

			if(activeStackOnDisable != null){
				for(int i=0; i<activeStackOnDisable.Count; i++){
					PushOverlayPage(activeStackOnDisable[i]);
				}
			}
		}

		protected override void OnPageDisable ()
		{
			base.OnPageDisable ();

			activeStackOnDisable = new List<PageController>();
			for(int i=pageStack.Count-1; i > -1; i--){
				
				if(pageStack[i].isActive){
					activeStackOnDisable.Insert(0, pageStack[i]);
				}else{
					PopPage(pageStack[i].pageId);
					break;
				}
			}
		}

		public void InitNavivationController(PageController initialPageController)
		{
			pageStack = new List<PageController>();

			if(initialPageController != null){
				PushPage(initialPageController.pageId, false);
			}
		}

		#region Push new PageControllers
		/// <summary>
		/// Push a Editor preSetup Page with the given ControllerClassType as pageId onto stack and display it
		/// </summary>
		/// <param name="pageType">ControllerClassType as pageId</param>
		/// <param name="animated">Should the Page transition be animated, default is true</param>
		public void PushPage(System.Type pageType, bool animated = true)
		{
			PushPage(pageType.ToString(), animated);
		}

		/// <summary>
		/// Push a Editor preSetup Page with given pageId onto stack and display it
		/// </summary>
		/// <param name="pageId">Identifier to match with Editor preSetup Pages</param>
		/// <param name="animated">Should the Page transition be animated, default is true</param>
		public void PushPage(string pageId, bool animated = true)
		{
			// Get correct PageController from preSetup
			PageController nextPage = (from p in preSetup.preSetupPageControllers where p.pageId == pageId select p).FirstOrDefault();

			if(nextPage != null){
				
				if(!nextPage.isCreated){
					nextPage.InitPageController(false);
				}

				PushPage(nextPage, animated);
			}
		}

		/// <summary>
		/// Push a Instantiated pageController onto stack and display it
		/// </summary>
		/// <param name="pageController">Page controller.</param>
		/// <param name="animated">If set to <c>true</c> animated.</param>
		public void PushPage(PageController pageController, bool animated)
		{
			pageController.SetNavigationController(this);

			PageController lastPage = currentPage;
			pageStack.Add(pageController);

			if(animatePagesSerial){
				if(lastPage != null){
					lastPage.DismissPage(animated ? PageTweenType.PushDisable : PageTweenType.None, ()=>{
						currentPage.PresentPage(animated ? PageTweenType.PushEnable : PageTweenType.None);
					});
				}else{
					currentPage.PresentPage(animated ? PageTweenType.PushEnable : PageTweenType.None);
				}
			}else{
				if(lastPage != null){
					lastPage.DismissPage(animated ? PageTweenType.PushDisable : PageTweenType.None);
				}
				currentPage.PresentPage(animated ? PageTweenType.PushEnable : PageTweenType.None);
			}
			SortChildIndexByStack();
		}
			
		/// <summary>
		/// Push a Editor preSetup Page with the given ControllerClassType as pageId onto stack and display it.
		/// Underlying Controller on stack will lose Focus but stay active and visible
		/// </summary>
		/// <param name="pageType">Page type.</param>
		/// <param name="animated">If set to <c>true</c> animated.</param>
		public void PushOverlayPage(System.Type pageType, bool animated = true)
		{
			this.PushOverlayPage(pageType.ToString(), animated);
		}

		/// <summary>
		/// Push a Editor preSetup Page with given pageId onto stack and display it.
		/// Underlying Controller on stack will lose Focus but stay active and visible
		/// </summary>
		/// <param name="pageId">Page identifier.</param>
		/// <param name="animated">Should the Page transition be animated, default is true</param>
		public void PushOverlayPage(string pageId, bool animated = true)
		{
			PageController overlayPage = (from p in preSetup.preSetupPageControllers where p.pageId == pageId select p).FirstOrDefault();

			if(overlayPage != null){
				
				if(!overlayPage.isCreated){
					overlayPage.InitPageController(false);
				}

				PushOverlayPage(overlayPage);
			}
		}

		/// <summary>
		/// Push a Instantiated pageController onto stack and display it.
		/// Underlying Controller on stack will lose Focus but stay active and visible
		/// </summary>
		/// <param name="pageController">Page controller.</param>
		/// <param name="animated">Should the Page transition be animated, default is true</param>
		public void PushOverlayPage(PageController pageController, bool animated = true)
		{
			pageController.SetNavigationController(this);

			if(currentPage != null)
				currentPage.RemoveFocus(animated ? PageTweenType.GetFocus : PageTweenType.None);
			
			pageStack.Add(pageController);
			currentPage.PresentPage(PageTweenType.PushEnable, null);
			SortChildIndexByStack();
		}
		#endregion

		#region PopExisting PageControllers
		/// <summary>
		/// Pops the last Page from the Stack
		/// </summary>
		/// <param name="animated">Should the Page transition be animated, default is true</param>
		public void PopPage(bool animated = true)
		{
			if(pageStack.Count >= 2 && pageStack[pageStack.Count -2].isActive){
				PopOverlay(animated);
				return;
			}

			if(animatePagesSerial){
				currentPage.DismissPage(PageTweenType.PopDisable, ()=>{
					pageStack.Remove(currentPage);
					currentPage.PresentPage(animated ? PageTweenType.PopEnable : PageTweenType.None);
				});
			}else{
				currentPage.DismissPage(animated ? PageTweenType.PopDisable : PageTweenType.None);
				pageStack.Remove(currentPage);
				currentPage.PresentPage(animated ? PageTweenType.PopEnable : PageTweenType.None);
			}
			SortChildIndexByStack();
		}

		private void PopOverlay(bool animated)
		{
			currentPage.DismissPage(animated ? PageTweenType.PopDisable : PageTweenType.None);
			pageStack.Remove(currentPage);
			currentPage.SetFocus(animated ? PageTweenType.GetFocus : PageTweenType.None);
			SortChildIndexByStack();
		}

		/// <summary>
		/// Pops all Pages from the Stack until identified, identified will open
		/// </summary>
		/// <param name="pageId">Page identifier.</param>
		/// <param name="animated">Should the Page transition be animated, default is true</param>
		public void PopPage(string pageId, bool animated = true)
		{
			for(int i= pageStack.Count -2; i > -1; i--){
				if(pageStack[i].pageId == pageId){
					break;
				}
				RemoveFromStackAt(i);
			}
			PopPage(animated);
		}
		#endregion

		#region PageStack modification
		/// <summary>
		/// Removes the Page or Pages with pageId from stack
		/// Removing from stack can be from any position in the Stack
		/// Removing from stack does not Trigger Animations, PageEvents will Trigger non the less
		/// </summary>
		/// <param name="pageId">Page identifier.</param>
		public void RemoveFromStack(string pageId)
		{
			for(int i= pageStack.Count -2; i > -1; i--){
				if(pageStack[i].pageId == pageId){
					RemoveFromStackAt(i);
				}
			}
		}

		/// <summary>
		/// Removes the Page at a defined stackposition
		/// Removing from stack does not trigger Animations, PageEvents will Trigger non the less
		/// </summary>
		/// <param name="stackPosition">Stack position.</param>
		public void RemoveFromStackAt(int stackIndex)
		{
			if(stackIndex < 0 || stackIndex >= pageStack.Count){
				throw new System.ArgumentOutOfRangeException("stackPosition", "stackPosition is not in range for pageStack");
			}

			if(pageStack[stackIndex].isActive){
				pageStack[stackIndex].DismissPage(PageTweenType.None);
			}
			pageStack.RemoveAt(stackIndex);
		}

		/// <summary>
		/// Inserts a a Editor preSetup Page with gieven pageId at given stackposition into stack
		/// </summary>
		/// <param name="pageId">Page identifier.</param>
		/// <param name="stackPosition">Stack position.</param>
		public void InsertIntoStack(string pageId, int stackIndex)
		{
			PageController insertPage = (from p in preSetup.preSetupPageControllers where p.pageId == pageId select p).FirstOrDefault();

			if(insertPage == null)
				return;

			if(stackIndex < 0 || stackIndex >= pageStack.Count){
				throw new System.ArgumentOutOfRangeException("stackPosition", "stackPosition must be smaller then current Displayed page stackIndex, and larger then 0");
			}

			pageStack.Insert(stackIndex, insertPage);
		}
		#endregion

		private void SortChildIndexByStack()
		{
			if(!sortChildIndexByStack)
				return;

			for(int i=0; i < pageStack.Count; i++){
				pageStack[i].transform.SetSiblingIndex(i);
			}
		}
	}
}
