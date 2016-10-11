using UnityEngine;
using System.Collections;
using UnityEngine.VR;

public class RotateCamera : MonoBehaviour {

	Vector3 lastMousePos;

	// Update is called once per frame
	void Update () {

		if (VRSettings.enabled)
			return;

		if(Input.GetKeyDown(KeyCode.R)){
			transform.rotation = Quaternion.identity;
		}

		if(Input.GetMouseButtonDown(0)){
			lastMousePos = Input.mousePosition;
		}

		if(!Input.GetMouseButton(0)){
			return;
		}

		Vector3 mouseDelta = Input.mousePosition - lastMousePos;
		lastMousePos = Input.mousePosition;

		transform.RotateAround(Vector3.up, mouseDelta.x*Time.deltaTime);
		transform.RotateAround(Vector3.Cross(transform.forward, Vector3.up), mouseDelta.y*Time.deltaTime);
	}
}
