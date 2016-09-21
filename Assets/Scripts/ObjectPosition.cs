using UnityEngine;
using System.Collections;

//Takes the position of the target game object

public class ObjectPosition : MonoBehaviour {

	public Transform target;
	
	// Update is called once per frame
	void Update () {
		transform.position = target.transform.position;
	}
}
