using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace Gamma {
	public class MonoBehaviourEvents : MonoBehaviour{

		private static MonoBehaviourEvents _instance;
		public static MonoBehaviourEvents instance {
			get {
				if(_instance == null){
					CreateMonoBehaviour();
				}
				return _instance;
			}
		}

		private static void CreateMonoBehaviour(GameObject targetObject = null)
		{
			if(targetObject == null){
				targetObject = new GameObject("MonoBehaviourEventsHelper");
			}
			_instance = targetObject.AddComponent<MonoBehaviourEvents>();
			DontDestroyOnLoad(_instance);
		}

		public void Init()
		{}

	#region Update
		private List<IUpdatable> updatables;
		public void RegisterObject(IUpdatable updatable)
		{
			if(updatables == null){
				updatables = new List<IUpdatable>();
			}

			if(updatables.Contains(updatable)){
				return;
			}

			updatables.Add(updatable);
		}

		public void UnRegisterObject(IUpdatable updatable)
		{
			if(updatables.Contains(updatable)){
				updatables.Remove(updatable);
			}
		}

		void Update()
		{
			if(updatables == null)
				return;

			for(int i=updatables.Count-1; i>-1; i--){
				if(updatables[i] != null)
					updatables[i].Update();
			}
		}
	#endregion

	#region ApplicationQuit
		private List<IApplicationQuit> quitables;
		public void RegisterObject(IApplicationQuit appQuitListener)
		{
			if(quitables == null){
				quitables = new List<IApplicationQuit>();
			}
			
			if(quitables.Contains(appQuitListener)){
				return;
			}
			
			quitables.Add(appQuitListener);
		}

		public void UnRegisterObject(IApplicationQuit appQuitListener)
		{
			if(quitables.Contains(appQuitListener)){
				quitables.Remove(appQuitListener);
			}
		}

		void OnApplicationQuit()
		{
			if(quitables == null)
				return;
			
			for(int i=quitables.Count-1; i>-1; i--){
				if(quitables[i] != null)
					quitables[i].OnApplicationQuit();
			}
		}
	#endregion
		
	#region ApplicationPause
		private List<IApplicationPause> pausables;
		public void RegisterObject(IApplicationPause appPauseListener)
		{
			if(pausables == null){
				pausables = new List<IApplicationPause>();
			}
			
			if(pausables.Contains(appPauseListener)){
				return;
			}
			
			pausables.Add(appPauseListener);
		}

		public void UnRegisterObject(IApplicationPause appPauseListener)
		{
			if(pausables.Contains(appPauseListener)){
				pausables.Remove(appPauseListener);
			}
		}

		void OnApplicationPause(bool pauseStatus)
		{
			if(pausables == null)
				return;
			
			for(int i=pausables.Count-1; i>-1; i--){
				if(pausables[i] != null)
					pausables[i].OnApplicationPause(pauseStatus);
			}
		}
	#endregion

	#region ApplicationFocus
		private List<IApplicationFocus> focusable;
		public void RegisterObject(IApplicationFocus appFocusListener)
		{
			if(focusable == null){
				focusable = new List<IApplicationFocus>();
			}
			
			if(focusable.Contains(appFocusListener)){
				return;
			}
			
			focusable.Add(appFocusListener);
		}

		public void UnRegisterObject(IApplicationFocus appFocusListener)
		{
			if(focusable.Contains(appFocusListener)){
				focusable.Remove(appFocusListener);
			}
		}

		void OnApplicationFocus(bool focusStatus)
		{
			if(focusable == null)
				return;
			
			for(int i=focusable.Count-1; i>-1; i--){
				if(focusable[i] != null)
					focusable[i].OnApplicationFocus(focusStatus);
			}
		}
	#endregion

		#region OnLevelWasLoaded
		private List<ILevelLoad> loadables;

		public void RegisterObject(ILevelLoad levelLoadListener)
		{
			if(loadables == null){
				loadables = new List<ILevelLoad>();
			}

			if(loadables.Contains(levelLoadListener)){
				return;
			}

			loadables.Add(levelLoadListener);
		}

		public void UnRegisterObject(ILevelLoad levelLoadListener)
		{
			if(loadables.Contains(levelLoadListener)){
				loadables.Remove(levelLoadListener);
			}
		}

		void OnLevelWasLoaded(int loadedLevel)
		{
			if(loadables == null)
				return;

			for(int i=loadables.Count-1; i>-1; i--){
				if(loadables[i] != null)
					loadables[i].OnLevelWasLoaded(loadedLevel);
			}
		}

		#endregion
	}
}
