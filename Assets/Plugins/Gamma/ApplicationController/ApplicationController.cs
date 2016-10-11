using UnityEngine;
using System.Collections;
using Gamma.PageHandling;

namespace Gamma{
	public class ApplicationController : MonoBehaviour {

		public static ApplicationController instance {get; private set;}

		public SceneController sceneController;

		void Awake()
		{
			Init();
		}

		protected virtual void Init()
		{
			instance = this;

			this.gameObject.name = this.GetType().ToString();

			DontDestroyOnLoad(this);
		}

		protected virtual void Start()
		{
			OnLevelWasLoaded(0);
		}

		protected virtual void OnLevelWasLoaded(int level)
		{
			sceneController = FindObjectOfType<SceneController>();

			if(sceneController != null)
				sceneController.Init();
		}
	}
}
