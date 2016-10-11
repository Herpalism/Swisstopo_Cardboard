using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using System.Collections.Generic;

public class CustomRaycaster : PhysicsRaycaster {

	[System.Serializable]
	public class OnCustomRaycastHit : UnityEvent<PointerEventData, List<RaycastResult>>{}
	public OnCustomRaycastHit onRaycastHit;

	public override void Raycast (PointerEventData eventData, List<RaycastResult> resultAppendList)
	{
		if(!enabled)
			return;

		eventData.position = new Vector3((float)Screen.width/2, (float)Screen.height/2, 0);
		base.Raycast (eventData, resultAppendList);

		onRaycastHit.Invoke(eventData, resultAppendList);
	}
}
