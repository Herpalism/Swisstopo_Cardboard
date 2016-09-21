using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	public GameObject blackSphere;
	public static int sceneToLoad = 0;

	private bool sceneMenuActive = false;
	private bool hasEnteredSceneMenu = false;
	private bool sceneChosen = false;
	private float blackAlpha = 1f;

	// Use this for initialization
	void Start () {
		sceneChosen = false;
		blackAlpha = 1f;
		sceneToLoad = 0;
		blackSphere.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,1f);
	}

	public void HomeBtnDown(int scene){
		sceneToLoad = scene;
		sceneChosen = true;
	}

	// Update is called once per frame
	void Update () {
		//Scene has been chosen
		blackAlpha = Mathf.Clamp01(blackAlpha);
		if(sceneChosen){
			blackAlpha += 0.5f*Time.deltaTime;
			blackSphere.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlpha);
			if(blackAlpha >= 1f){
				SceneManager.LoadScene(1);
			}
		}
		else{
			blackAlpha -= 0.5f*Time.deltaTime;
			blackSphere.GetComponent<Renderer>().material.color = new Color(0f,0f,0f,blackAlpha);
		}
	}
}
