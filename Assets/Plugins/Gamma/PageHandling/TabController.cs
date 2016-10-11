using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Gamma.PageHandling{

	public class TabController : PageController {

		[Serializable]
		public class TabControllerSetup {
			public bool isPreSetup;
			public int initalTab;
			public TabLink[] preSetupTabs;
		}

		#region Editor Serialized Fields
		public TabControllerSetup preSetup;

		public bool animateTransitions = false;
		public bool animateSerial = false;

		public bool sortChildIndexForAnimation = false;
		#endregion

		protected List<TabLink> tabs;
		public int currentTabIndex {get; protected set;}
		public TabLink currentTab {
			get {
				if(currentTabIndex >= 0 && currentTabIndex < tabs.Count){
					return tabs[currentTabIndex];
				}
				return null;
			}
		}

		public override void SetNavigationController(NavigationController navigationController)
		{
			base.SetNavigationController(navigationController);

			foreach(var t in tabs){
				t.pageController.SetNavigationController(navigationController);
			}
		}

		protected override void OnPageCreate ()
		{
			base.OnPageCreate ();

			InitTabController();
		}

		protected override void OnPageEnable ()
		{
			base.OnPageEnable ();

			SetTabActive(currentTabIndex, false);
		}

		protected override void OnPageDisable ()
		{
			base.OnPageDisable ();

			foreach(var t in tabs){
				if(t.tabActive){
					t.DisableTab(false);
				}
			}
		}

		protected override void OnPageGetFocus ()
		{
			base.OnPageGetFocus ();

			if(currentTab != null)
				currentTab.pageController.SetFocus(PageTweenType.None);
		}

		protected override void OnPageLoseFocus ()
		{
			base.OnPageLoseFocus ();

			if(currentTab != null)
				currentTab.pageController.RemoveFocus(PageTweenType.None);
		}

		public void InitTabController()
		{
			tabs = new List<TabLink>();
			currentTabIndex = -1;

			if(preSetup.isPreSetup)
			{
				foreach(var tb in preSetup.preSetupTabs){
					RegisterTab(tb);
				}

				currentTabIndex = preSetup.initalTab;
			}
		}

		public ITabButton GetTabButton(PageController pageController)
		{
			return (from t in tabs where t.pageController == pageController select t.tabButton).FirstOrDefault();
		}

		public void SetTabActive(Type pageType, bool animated = true)
		{
			string pageId = pageType.ToString();
			TabLink tabLink = (from tl in tabs where tl.pageController.pageId == pageId select tl).FirstOrDefault();

			if(tabLink != null)
				SetTabActive(tabLink, animated);
		}

		public void SetTabActive(string pageId, bool animated = true)
		{
			TabLink tabLink = (from tl in tabs where tl.pageController.pageId == pageId select tl).FirstOrDefault();

			if(tabLink != null)
				SetTabActive(tabLink, animated);
		}

		public void SetTabActive(TabLink tab, bool animated = true)
		{
			int tabIndex = tabs.IndexOf(tab);
			if(tabIndex >= 0)
				SetTabActive(tabIndex, animated);
			else{
				throw new ArgumentException("tab", "TabLink is not associated with TabController, please register it first");
			}
		}

		public virtual void SetTabActive(int tabIndex, bool animated = true)
		{
			if(tabIndex < 0 || tabIndex >= tabs.Count){
				if(tabIndex == -1){
					return;
				}
				Debug.LogError(tabIndex);
				return;
				//throw new ArgumentOutOfRangeException("tabIndex", "tabIndex is out of range of available Tabs");
			}

			if(animateSerial){
				if(currentTab != null && currentTabIndex != tabIndex){
					SortChildIndex(currentTab.pageController.transform, tabs[tabIndex].pageController.transform);

					currentTab.DisableTab(animateTransitions, ()=>{
						currentTabIndex = tabIndex;
						currentTab.EnableTab(animated);
					});
				}else{
					currentTabIndex = tabIndex;
					currentTab.EnableTab(animated);
				}
			}else{
				if(currentTab != null && currentTabIndex != tabIndex){
					SortChildIndex(currentTab.pageController.transform, tabs[tabIndex].pageController.transform);

					currentTab.DisableTab(animated);
				}
				currentTabIndex = tabIndex;
				currentTab.EnableTab(animated);
			}
		}

		public virtual void RegisterTab(TabLink tab, bool active = false)
		{
			if(tabs.Contains(tab)){
				return;
			}

			tab.Init(this);
			tabs.Add(tab);
			tab.DisableTab(false);
		}

		public virtual void UnRegisterTab(PageController controller, bool dispose = true)
		{
			for(int i=tabs.Count-1; i > -1; i--)
			{
				if(tabs[i].pageController == controller){
					UnRegisterTab(tabs[i], dispose);
					break;
				}
			}
		}

		public virtual void UnRegisterTab(TabLink tab, bool dispose = true)
		{
			if(!tabs.Contains(tab)){
				return;
			}

			if(currentTab == tab){
				currentTabIndex = -1;
			}

			//Remove Tab
			tabs.Remove(tab);

			if(dispose)
				tab.Dispose();

			/*if(currentTabIndex == 0){
				if(tabs.Count > 0){
					SetTabActive(0, false);
				}else{
					currentTabIndex = -1;
					return;
				}
			}

			if(currentTabIndex >= tabs.Count){
				SetTabActive(tabs.Count-1, false);
			}*/
		}

		private void SortChildIndex(Transform foreGround, Transform background)
		{
			if(!sortChildIndexForAnimation)
				return;

			int a = foreGround.GetSiblingIndex();
			int b = background.GetSiblingIndex();

			background.SetSiblingIndex(Mathf.Min(a, b));
		}
	}
}
