using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class Cardboard_IntroMenuController : MonoBehaviour {

	public Canvas canvasChoose;
	public Canvas canvasLoad;

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void BtnCBNo(){
		GVRSettingsScript.hasCB = false;
		LoadLevel();
	}

	public void BtnCBYes(){
		GVRSettingsScript.hasCB = true;
		LoadLevel();
	}

	void LoadLevel(){
		canvasChoose.gameObject.SetActive(false);
		canvasLoad.gameObject.SetActive(true);
		SceneManager.LoadScene("Scene_Demo");
	}
}
