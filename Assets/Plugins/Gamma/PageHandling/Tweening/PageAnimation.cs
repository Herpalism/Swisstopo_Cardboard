using UnityEngine;
using System.Collections;

namespace Gamma.PageHandling {
	[RequireComponent(typeof(Animation))]
	public class PageAnimation : PageTween {

		public bool debugEnabled;

		public AnimationClip animationClip;
		public bool rewindAnimation;

		private Animation unityAnimation;
		private AnimationEvent animevent;
		void Awake()
		{
			animevent = new AnimationEvent();
			animevent.functionName = "AnimationEnded";
			animevent.intParameter = this.GetHashCode();

			unityAnimation = GetComponent<Animation>();
			unityAnimation.clip = animationClip;
			unityAnimation.AddClip(animationClip, this.GetHashCode().ToString());
		}

		public override void StartTween (System.Action callback)
		{
			if(debugEnabled)
				Debug.Log("StartTween: " + animationClip.name + ", " + this.GetHashCode().ToString());

			base.StartTween (callback);

			AnimationState state = unityAnimation[this.GetHashCode().ToString()];

			if(rewindAnimation){
				//Reverse animationspeed, set time to End
				state.speed =  -1;
				state.time = animationClip.length;
				state.wrapMode = WrapMode.Once;
				//Create event at timestamp 0
				animevent.time = 0;
				state.clip.events = new AnimationEvent[] {animevent};
			}else{
				//Set normal playback speed and time to 0
				state.time = 0;
				state.speed = 1;
				state.wrapMode = WrapMode.Once;
				//Create event at timestamp end of clip
				animevent.time = animationClip.length;
				state.clip.events = new AnimationEvent[] {animevent};
			}

			unityAnimation.Play(this.GetHashCode().ToString());
		}

		public void AnimationEnded(int hashCode)
		{
			if(hashCode != this.GetHashCode()){
				return;
			}

			if(debugEnabled)
				Debug.Log("AnimationEnded: " + animationClip.name +", "+ this.GetHashCode().ToString());

			unityAnimation[this.GetHashCode().ToString()].clip.events = new AnimationEvent[0];

			if(finishedCallback != null)
				finishedCallback();

			finishedCallback = null;
		}
	}
}
