using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using DG.Tweening;
using System.Collections.Generic;

public class VR_Cursor : MonoBehaviour {

	public Image pointerDot;
	public Image pointerCircle;

	public float delay = 0.5f;
	public float clickTime = 2;

	private bool _interactive = true;
	public bool interactive {
		get {
			return _interactive;
		}

		set {
			pointerCircle.gameObject.SetActive(false);
			pointerDot.gameObject.SetActive(true);
			_interactive = value;
		}
	}

	Tween circleTween;
	private GameObject currentOver;
	public void OnRaycastObject(PointerEventData data,  List<RaycastResult> resultAppendList)
	{
		//print("RAYCAST!");
		SetDistance(data);

		if(resultAppendList.Count > 0){
			if(resultAppendList[0].gameObject != currentOver){
				if(currentOver != null){
					OnExitObject(data);
				}
				OnEnterObject(data);
			}
		}else{
			if(currentOver != null){
				OnExitObject(data);
			}
		}
	}

	private void OnEnterObject(PointerEventData data)
	{
		if(!_interactive){
			return;
		}

		//bool interactiveTarget = data.pointerEnter
		if(data.pointerEnter != null){
		IEventSystemHandler interactableTarget = data.pointerEnter.GetComponent<IEventSystemHandler>();
			if(interactableTarget == null){
				pointerCircle.gameObject.SetActive(false);
				pointerDot.gameObject.SetActive(true);
			}else{
				pointerCircle.gameObject.SetActive(true);
				pointerDot.gameObject.SetActive(false);
			}
		}else{
			pointerCircle.gameObject.SetActive(false);
			pointerDot.gameObject.SetActive(true);
		}

		currentOver = data.pointerEnter;
		pointerCircle.fillAmount = 1;

		if(circleTween != null){
			circleTween.Kill();
		}

		circleTween = DOTween.To(()=>pointerCircle.fillAmount, x => pointerCircle.fillAmount = x, 0, clickTime);
		circleTween.OnComplete(()=>{
			ExecuteEvents.ExecuteHierarchy<IPointerClickHandler>(data.pointerEnter, data, (x,y)=> x.OnPointerClick(data));
		});
		circleTween.OnKill(()=>{circleTween = null;});
		circleTween.SetDelay(delay);
		circleTween.Play();
	}

	private void OnExitObject(PointerEventData data)
	{
		if(!_interactive){
			return;
		}

		currentOver = null;

		if(circleTween != null){
			circleTween.Kill();
		}

		pointerCircle.gameObject.SetActive(false);
		pointerDot.gameObject.SetActive(true);
		pointerCircle.fillAmount = 1;
	}

	void OnDisable()
	{
		if(circleTween != null){
			circleTween.Kill();
			circleTween = null;
		}
	}

	private void SetDistance(PointerEventData data)
	{
		Vector3 distVector;
		Vector3 scale;
		if(data == null || data.pointerCurrentRaycast.distance <= 0.5f){
			distVector = Vector3.forward*30f;
			scale = Vector3.one*0.02f;
			transform.localPosition = distVector;
			transform.localScale = scale;
		}else{
			distVector = Vector3.forward*(data.pointerCurrentRaycast.distance - 0.2f);
			scale = Vector3.one*0.02f*(data.pointerCurrentRaycast.distance/30f);
			transform.localPosition = distVector;
			transform.localScale = scale;
		}
	}
}
