using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class TextLink : MonoBehaviour {

	public string Link=string.Empty;

	void Start(){
		if (!GVRSettingsScript.hasCB) {
			this.GetComponent<Button>().enabled=true;
		} else {
			this.GetComponent<Button>().enabled=false;
		}
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
