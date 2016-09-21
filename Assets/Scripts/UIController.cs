using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections;

public class UIController : MonoBehaviour {

	public Canvas canvasInApp;
	public Canvas canvasSceneMenu;

	//Variables for turning
	public GameObject gVRMain;
	private Vector3 refVec;

	private bool sceneMenuActive = false;
	private bool hasEnteredSceneMenu = false;

	// Use this for initialization
	void Start () {
		SwitchMenu(false);
		sceneMenuActive = false;
	}

	public void MenuBtnDown(){
		SwitchMenu(true);
		sceneMenuActive = true;
	}

	void SwitchMenu(bool showSceneMenu){
		canvasInApp.gameObject.SetActive(!showSceneMenu);
		canvasSceneMenu.gameObject.SetActive(showSceneMenu);
	}
	
	// Update is called once per frame
	void Update () {
		if(!sceneMenuActive){
			if(!EventSystem.current.IsPointerOverGameObject()){
				//transform.rotation = Quaternion.Euler(new Vector3(0f,gVRMain.transform.rotation.eulerAngles.y, 0f));
				Vector3 desiredRot = new Vector3(0f,gVRMain.transform.rotation.eulerAngles.y, 0f);
				Vector3 actualRot = Vector3.SmoothDamp(transform.rotation.eulerAngles, desiredRot, ref refVec, 0.5f);
				transform.rotation = Quaternion.Euler(actualRot);
			}
		}
		else{
			if(EventSystem.current.IsPointerOverGameObject()){
				hasEnteredSceneMenu = true;
			}
			else{
				if(hasEnteredSceneMenu){
					SwitchMenu(false);
					hasEnteredSceneMenu = false;
					sceneMenuActive = false;
				}
			}
		}
	}
}
