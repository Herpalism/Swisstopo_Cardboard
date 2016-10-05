using UnityEngine;
using System.Collections;

public class SphereController : MonoBehaviour {

	public GameObject sphereMono;
	public GameObject sphereStereoL;
	public GameObject sphereStereoR;


	public GameObject sphereMonoMat;
	public GameObject sphereStereoLMat;
	public GameObject sphereStereoRMat;


	public PanoData[] panoplaces;

	private int activePanoSet;
	private int activeViewMode;

	// Use this for initialization
	void Start () {
		SetTextures(panoplaces[MenuController.sceneToLoad], 1);
		activePanoSet = MenuController.sceneToLoad;
		activeViewMode = 1;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	//UI Button Input Methods
	public void BtnPhotoDown(){
		SetTextures(panoplaces[activePanoSet], 1);
		activeViewMode = 1;
	}

	public void BtnTLMDown(){
		SetTextures(panoplaces[activePanoSet], 2);
		activeViewMode = 2;
	}

	public void BtnSceneDown(int panoChosen){
		SetTextures(panoplaces[panoChosen], activeViewMode);
		activePanoSet = panoChosen;
	}


	//Main Function for changing mode and according textures
	public void SetTextures(PanoData panoActive, int mode){
		//print("Setting Textures: "+ panoActive.name);
		//Mode 1 = Mono, Mode 2 = Stereo TLM, Mode 3 = Stereo TLM Realistisch
		if(mode == 1){
			sphereMonoMat.GetComponent<Renderer>().material.mainTexture = panoActive.texPhoto;
			SetStereo(false);
		}
		if(mode == 2){
			sphereStereoLMat.GetComponent<Renderer>().material.mainTexture = panoActive.texTLM_Left;
			sphereStereoRMat.GetComponent<Renderer>().material.mainTexture = panoActive.texTLM_Right;
			SetStereo(true);
		}
		if(mode == 3){
			sphereStereoLMat.GetComponent<Renderer>().material.mainTexture = panoActive.texTLMReal_Left;
			sphereStereoRMat.GetComponent<Renderer>().material.mainTexture = panoActive.texTLMReal_Right;
			SetStereo(true);
		}

		//Set Rotation for Photo Mono Sphere
		sphereMonoMat.transform.localRotation = Quaternion.Euler(panoActive.rotCorrectionPhoto);
	}

	void SetStereo(bool isStereo){
		sphereMono.SetActive(!isStereo);
		sphereStereoL.SetActive(isStereo);
		sphereStereoR.SetActive(isStereo);
	}
}


[System.Serializable]  
public class PanoData{
	public string name;
	public Texture2D texPhoto;
	public Texture2D texTLM_Left;
	public Texture2D texTLM_Right;
	public Texture2D texTLMReal_Left;
	public Texture2D texTLMReal_Right;
	public Vector3 rotCorrectionPhoto;
}
