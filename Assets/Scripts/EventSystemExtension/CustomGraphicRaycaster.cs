using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using System.Collections.Generic;
using UnityEngine.VR;

public class CustomGraphicRaycaster : GraphicRaycaster {

	[System.Serializable]
	public class OnCustomRaycastHit : UnityEvent<PointerEventData, List<RaycastResult>>{}
	public OnCustomRaycastHit onRaycastHit;
	public Transform rayOrigin;

	public override void Raycast (PointerEventData eventData, System.Collections.Generic.List<RaycastResult> resultAppendList)
	{
		if(!enabled)
			return;

		eventData.position = new Vector2(UnityEngine.VR.VRSettings.eyeTextureWidth/2, (float)UnityEngine.VR.VRSettings.eyeTextureHeight/2);
		//eventData.position = new Vector3((float)Screen.width/2, (float)Screen.height/2, 0);
		print(eventData.position);
		base.Raycast (eventData, resultAppendList);

		onRaycastHit.Invoke(eventData, resultAppendList);
	}
}
