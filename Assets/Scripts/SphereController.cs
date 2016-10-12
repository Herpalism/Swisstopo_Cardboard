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
		SetTextures(panoplaces[6], 1);
		activePanoSet = 6;
		activeViewMode = 1;
		Application.backgroundLoadingPriority = ThreadPriority.Low;
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
		print("Btn Down Received. Int: "+panoChosen);
		SetTextures(panoplaces[panoChosen], activeViewMode);
		activePanoSet = panoChosen;
	}


	//Main Function for changing mode and according textures
	public void SetTextures(PanoData panoActive, int mode){
		print("Setting Textures: "+ panoActive.name);
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


	Texture2D textureLeft;
	Texture2D textureRight;
	//Main Function for changing mode and according textures
	public void SetTexturesLoad(PanoData panoActive, int mode){
		//print("Setting Textures: "+ panoActive.name);
		//Mode 1 = Mono, Mode 2 = Stereo TLM, Mode 3 = Stereo TLM Realistisch
		if(mode == 1){
			sphereMonoMat.GetComponent<Renderer>().material.mainTexture = panoActive.texPhoto;
			SetStereo(false);
		}
		if(mode == 2){
			Resources.UnloadAsset(textureLeft);
			Resources.UnloadAsset(textureRight);
			textureLeft=Resources.Load(panoActive.texTLM_Left.name) as Texture2D;
			textureRight=Resources.Load(panoActive.texTLM_Right.name) as Texture2D;
			sphereStereoLMat.GetComponent<Renderer>().material.mainTexture = textureLeft;
			sphereStereoRMat.GetComponent<Renderer>().material.mainTexture = textureRight;
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

	public void SetTexturesLoadAsync(PanoData panoActive, int mode){
		//print("Setting Textures: "+ panoActive.name);
		//Mode 1 = Mono, Mode 2 = Stereo TLM, Mode 3 = Stereo TLM Realistisch
		if(mode == 1){
			sphereMonoMat.GetComponent<Renderer>().material.mainTexture = panoActive.texPhoto;
			SetStereo(false);
		}
		if(mode == 2){
			Resources.UnloadAsset(textureLeft);
			Resources.UnloadAsset(textureRight);
			StartCoroutine(LoadFinished(
			Resources.LoadAsync(panoActive.texTLM_Left.name),
				Resources.LoadAsync(panoActive.texTLM_Right.name)));
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

	IEnumerator LoadFinished(ResourceRequest left, ResourceRequest right){
		while (!left.isDone && !right.isDone) {
			print(left.isDone.ToString() + right.isDone.ToString());
			yield return new WaitForSeconds(0.01f);
		}
		textureLeft=left.asset as Texture2D;
		textureRight=right.asset as Texture2D;
		sphereStereoLMat.GetComponent<Renderer>().material.mainTexture=textureLeft;
		sphereStereoRMat.GetComponent<Renderer>().material.mainTexture = textureRight;
		SetStereo(true);
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
