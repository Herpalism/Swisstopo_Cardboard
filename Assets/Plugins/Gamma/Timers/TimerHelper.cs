using UnityEngine;
using System;
using System.Timers;

namespace Gamma.Timers.Internal {
	public class TimerHelper : IUpdatable, IDisposable {
			
		public DateTime endingTime {get; private set;}
		public DateTime startTime {get; private set;}
		public TimeSpan timespan {get; private set;}
		private Action elapsedCallback;
		
		public float progress {get; private set;}
		private Action<float> progressCallback;

		public TimerHelper()
		{
		}

		public void Dispose()
		{
			StopTimer();
			elapsedCallback = null;
		}
		
		public void StartTimer(TimeSpan timespan, Action<float> progressCallback, Action elapsedCallback)
		{
			this.endingTime = DateTime.Now + timespan;
			this.startTime = DateTime.Now;
			this.timespan = timespan;
			this.progress = 0;
			this.elapsedCallback = elapsedCallback;
			this.progressCallback = progressCallback;

			MonoBehaviourEvents.instance.RegisterObject(this);
		}

		public void StopTimer()
		{
			MonoBehaviourEvents.instance.UnRegisterObject(this);
		}
		
		public void Update()
		{
			if(progressCallback != null)
			{
				progress = Mathf.Clamp01((float)((DateTime.Now - startTime).TotalSeconds / timespan.TotalSeconds));
				progressCallback(progress);
			}

			if(DateTime.Now > endingTime)
			{
				if(elapsedCallback != null){
					elapsedCallback();
				}
			}
		}
	}
}