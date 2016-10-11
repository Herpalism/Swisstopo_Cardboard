using UnityEngine;
using System.Collections;
using Gamma.PageHandling;
using UnityEngine.SceneManagement;
using System;
using Gamma.Timers;

public class GearScenePageController : PageController {

	private Timer resetTimer;

	protected override void OnPageCreate ()
	{
		base.OnPageCreate ();

		resetTimer = null;
	}

	protected override void OnPageDisable ()
	{
		base.OnPageDisable ();

		SceneManager.LoadScene("Scene_Demo");
	}

	#region MonoBehaviour

	void Update()
	{
		if(!isActive){
			return;
		}

		if(Input.GetKeyUp(KeyCode.Escape)){
			DismissPage(PageTweenType.PopDisable);
		}

		if(!OVRManager.instance.isUserPresent){
			//SceneManager.LoadScene("Scene_Tutorial");
			if(resetTimer == null){
				resetTimer = new Timer(TimeSpan.FromSeconds(5f), ()=>{
					DismissPage(PageTweenType.PopDisable);
				});
				resetTimer.Start();
			}
		}else{
			if(resetTimer != null){
				resetTimer.Dispose();
				resetTimer = null;
			}
		}
	}

	#endregion

}