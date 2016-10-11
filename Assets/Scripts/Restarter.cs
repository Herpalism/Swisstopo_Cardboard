using UnityEngine;
using System.Collections;
using Gamma.PageHandling;
using UnityEngine.SceneManagement;
using System;
using Gamma.Timers;

public class Restarter : MonoBehaviour {

	public Timer resetTimer;

	// Use this for initialization
	void Start () {
	
	}
	
	void Update()
	{
		if(Application.platform == RuntimePlatform.OSXEditor){
			return;
		}



		if(!OVRManager.instance.isUserPresent){
			//SceneManager.LoadScene("Scene_Tutorial");
			print("GearVR User not present!");
			if(resetTimer == null){
				resetTimer = new Timer(TimeSpan.FromSeconds(10f), ()=>{
					SceneManager.LoadScene("Scene_Demo");
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
}
