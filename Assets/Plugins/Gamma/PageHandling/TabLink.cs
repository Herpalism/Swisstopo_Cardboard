using UnityEngine;
using UnityEngine.UI;
using System;
using System.Collections;

namespace Gamma.PageHandling{
	[Serializable]
	public class TabLink : IDisposable {

		[SerializeField]
		private TabButton _tabButton;
		public ITabButton tabButton;
		public PageController pageController;

		public bool tabActive {get; private set;}
		public TabController tabController {get; private set;}

		internal TabLink()
		{
		}

		public TabLink(ITabButton tabButton, PageController pageController)
		{
			this.tabButton = tabButton;
			this.pageController = pageController;
		}

		/// <summary>
		/// This will Initialize a TabLink
		/// It will be automatically called when TabLink is Registered with TabController
		/// </summary>
		internal void Init(TabController tabController)
		{
			this.tabActive = false;

			this.tabController = tabController;
			this.pageController.SetTabController(tabController);

			this.tabButton = tabButton != null ? tabButton : _tabButton;

			this.tabButton.Init();
			this.tabButton.SetSelected(tabActive);

			this.pageController.InitPageController(false);

			this.tabButton.AddListener(OnToggleChanged);
		}

		/// <summary>
		/// Listen to the ToggleChanged event from TabButton
		/// </summary>
		/// <param name="value">If set to <c>true</c> value.</param>
		private void OnToggleChanged(bool value)
		{
			if(value && !tabActive){
				tabController.SetTabActive(this, tabController.animateTransitions);
			}
		}

		/// <summary>
		/// Enables Tab, let the TabController controlle this, do not interfere here if not nessecary
		/// PageController will be presented
		/// tabButton will switch to selected State
		/// </summary>
		/// <param name="animated">If set to <c>true</c> animated.</param>
		/// <param name="finishCallback">Finish callback.</param>
		internal void EnableTab(bool animated, Action finishCallback = null)
		{
			if(tabActive){
				return;
			}

			tabActive = true;

			this.pageController.PresentPage(animated ? PageTweenType.PushEnable : PageTweenType.None, finishCallback);
			
			this.tabButton.SetSelected(tabActive);
		}

		/// <summary>
		/// Disables Tab, let the TabController controlle this, do not interfere here if not nessecary
		/// PageController will be disabled
		/// tabButton will switch to unselected State
		/// </summary>
		/// <param name="animated">If set to <c>true</c> animated.</param>
		/// <param name="finishCallback">Finish callback.</param>
		internal void DisableTab(bool animated, Action finishCallback = null)
		{
			if(!tabActive){
				return;
			}

			tabActive = false;

			this.pageController.DismissPage(animated ? PageTweenType.PopDisable : PageTweenType.None, finishCallback);
			
			this.tabButton.SetSelected(tabActive);
		}

		/// <summary>
		/// Releases all resource used by the <see cref="Gamma.PageHandling.TabLink"/> object.
		/// </summary>
		/// <remarks>Call <see cref="Dispose"/> when you are finished using the <see cref="Gamma.PageHandling.TabLink"/>. The
		/// <see cref="Dispose"/> method leaves the <see cref="Gamma.PageHandling.TabLink"/> in an unusable state. After
		/// calling <see cref="Dispose"/>, you must release all references to the <see cref="Gamma.PageHandling.TabLink"/> so
		/// the garbage collector can reclaim the memory that the <see cref="Gamma.PageHandling.TabLink"/> was occupying.</remarks>
		public void Dispose()
		{
			//this.tabButton.RemoveListener(OnToggleChanged);
			this.tabButton.Dispose();
			this.tabButton = null;

			this.pageController.Dispose();
			this.pageController = null;
		}
	}
}
