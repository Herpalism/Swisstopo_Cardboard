using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using System.Collections;

public class MenuHolder : MonoBehaviour {

	public GameObject gVRMain;
	private Vector3 refVec;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if(!EventSystem.current.IsPointerOverGameObject()){
			//transform.rotation = Quaternion.Euler(new Vector3(0f,gVRMain.transform.rotation.eulerAngles.y, 0f));
			Vector3 desiredRot = new Vector3(0f,gVRMain.transform.rotation.eulerAngles.y, 0f);
			Vector3 actualRot = Vector3.SmoothDamp(transform.rotation.eulerAngles, desiredRot, ref refVec, 0.5f);
			transform.rotation = Quaternion.Euler(actualRot);
		}
		//print("Is Pointer over GameObject. "+EventSystem.current.IsPointerOverGameObject());
	}
}
