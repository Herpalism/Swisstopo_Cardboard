using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections;
using UnityEngine.SceneManagement;

public class UIController : MonoBehaviour {

	public Canvas canvasInApp;
	public Canvas canvasSceneMenu;
	public Canvas canvasTutorial;
	public GameObject blackSphere;
	public GameObject SphereSolo;
	public GameObject SphereTLM_L;
	public GameObject SphereTLM_R;

	//Variables for turning
	public GameObject gVRMain;
	private Vector3 refVec;
	private float refFloat;

	private bool sceneMenuActive = false;
	private bool hasEnteredSceneMenu = false;
	private bool goHome = false;
	private float blackAlpha = 1f;

	//Internal Controller for Black Sphere
	private float blackAlphaRef;
	private float blackAlphaActual = 1f;

	// Use this for initialization
	void Start () {
		canvasInApp.gameObject.SetActive(false);
		canvasSceneMenu.gameObject.SetActive(false);
		canvasTutorial.gameObject.SetActive(true);
		goHome = false;
		blackAlphaActual = 1f;
		blackAlpha = 0.5f;
	}

	public void MenuBtnDown(){
		SwitchMenu(true);
	}

	public void CloseBtnDown(){
		SwitchMenu(false);
	}

	public void HomeBtnDown(){
		goHome = true;
	}

	public void CloseTutorial(){
		Destroy(canvasTutorial.gameObject);
		SwitchMenu(true);
		sceneMenuActive = true;
	}

	void SwitchMenu(bool showSceneMenu){
		canvasInApp.gameObject.SetActive(!showSceneMenu);
		canvasSceneMenu.gameObject.SetActive(showSceneMenu);
		sceneMenuActive = showSceneMenu;

		//Control Darkness
		if(showSceneMenu){
			blackAlpha = 0.5f;
		}
		else{
			blackAlpha = 0f;
		}
	}
	
	// Update is called once per frame
	void Update () {
		if(!sceneMenuActive){
			//if(!EventSystem.current.IsPointerOverGameObject()){
			if(!(gVRMain.transform.rotation.eulerAngles.x > 20f && gVRMain.transform.rotation.eulerAngles.x < 50f)){
				//transform.rotation = Quaternion.Euler(new Vector3(0f,gVRMain.transform.rotation.eulerAngles.y, 0f));
				float desiredY = gVRMain.transform.rotation.eulerAngles.y;
				float currentY = transform.rotation.eulerAngles.y;
				if(currentY-desiredY >180){
					desiredY=desiredY+360;
				} else if(currentY-desiredY < -180){
					currentY = currentY+360;
				} 
				float actualY= Mathf.SmoothDamp(currentY,desiredY,ref refFloat,0.5f);

				// Vector3 desiredRot = new Vector3(0f,gVRMain.transform.rotation.eulerAngles.y, 0f);
				// Vector3 actualRot = Vector3.SmoothDamp(transform.rotation.eulerAngles, desiredRot, ref refVec, 0.5f);
				// transform.rotation = Quaternion.Euler(actualRot);
				transform.rotation=Quaternion.Euler(0,actualY,0);
			}
		}
		/*
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
		*/

		/*
		//Go to Home Menu
		blackAlpha = Mathf.Clamp01(blackAlpha);
		if(goHome){
			blackAlpha += 0.5f*Time.deltaTime;
			blackSphere.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlpha);
			if(blackAlpha >= 1f){
				SceneManager.LoadScene(0);
			}
		}
		else{
			blackAlpha -= 0.5f*Time.deltaTime;
			blackSphere.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlpha);
		}
		*/

		//Set Darkness Level based on blackAlpha Value
		blackAlphaActual = Mathf.SmoothDamp(blackAlphaActual, blackAlpha, ref blackAlphaRef, 0.5f);
		SphereSolo.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlphaActual);
		SphereTLM_L.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlphaActual);
		SphereTLM_R.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlphaActual);
	}
}
