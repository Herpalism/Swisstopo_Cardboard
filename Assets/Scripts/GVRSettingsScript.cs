using UnityEngine;
using System.Collections;

public class GVRSettingsScript : MonoBehaviour {

	public GvrViewer gVR;
	public static bool hasCB = false;

	// Use this for initialization
	void Start () {
		gVR.VRModeEnabled = hasCB;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
