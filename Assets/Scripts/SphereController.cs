using UnityEngine;
using System.Collections;

public class SphereController : MonoBehaviour {

	public GameObject sphereMono;
	public GameObject sphereStereoL;
	public GameObject sphereStereoR;

	public Material sphereMonoMat;
	public Material sphereStereoLMat;
	public Material sphereStereoRMat;

	public PanoData[] panoplaces;

	// Use this for initialization
	void Start () {
		SetTextures(panoplaces[0], 1);
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	//UI Button Input Methods
	public void BtnPhotoDown(){
		SetTextures(panoplaces[0], 1);
	}

	public void BtnTLMDown(){
		SetTextures(panoplaces[0], 2);
	}


	//Main Function for changing mode and according textures
	public void SetTextures(PanoData panoActive, int mode){
		//Mode 1 = Mono, Mode 2 = Stereo TLM, Mode 3 = Stereo TLM Realistisch
		if(mode == 1){
			sphereMonoMat.mainTexture = panoActive.texPhoto;
			SetStereo(false);
		}
		if(mode == 2){
			sphereStereoLMat.mainTexture = panoActive.texTLM_Left;
			sphereStereoRMat.mainTexture = panoActive.texTLM_Right;
			SetStereo(true);
		}
		if(mode == 3){
			sphereStereoLMat.mainTexture = panoActive.texTLMReal_Left;
			sphereStereoRMat.mainTexture = panoActive.texTLMReal_Right;
			SetStereo(true);
		}
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
}
