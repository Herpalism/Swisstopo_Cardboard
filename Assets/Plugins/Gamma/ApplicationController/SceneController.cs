using UnityEngine;
using System.Collections;
using Gamma.PageHandling;

namespace Gamma{
	public class SceneController : MonoBehaviour {

		public static SceneController current {get; private set;}

		public PageController initialPageController;
		public bool animatieInital = false;

		public virtual void Init()
		{
			current = this;

			this.gameObject.name = this.GetType().ToString();

			if(initialPageController != null){
				if(animatieInital){
					initialPageController.InitPageController(false);
					initialPageController.PresentPage(PageTweenType.PushEnable);
				}else{
					initialPageController.InitPageController(true);
				}
			}
		}
	}
}
