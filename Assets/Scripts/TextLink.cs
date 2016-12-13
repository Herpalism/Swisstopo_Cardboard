using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class TextLink : MonoBehaviour {

	public string Link=string.Empty;

	void Start(){
		if (Link==string.Empty) {
			Text aText= GetComponentInChildren(typeof(Text)) as Text;
			if (aText!=null) {
				Link=aText.text;
			}
		}
	}


	public void OpenLink()	{
		Application.OpenURL(Link);
	}
}
