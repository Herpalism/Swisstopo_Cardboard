using UnityEngine;
using System.Collections;
using System;

namespace Gamma.Timers {
public class Progress {
	
	public Action<float> OnProgressChanged {get; set;}
	
	private TimeSpan timespan;
	public bool autodestroy {get; private set;}
	
	private Internal.TimerHelper timeHelper;

	public Progress(TimeSpan timespan, Action<float> OnProgressChanged, bool autodestroy = true)
	{
		this.timespan = timespan;
		this.OnProgressChanged = OnProgressChanged;
		this.autodestroy = autodestroy;
		this.timeHelper = new Internal.TimerHelper();
	}
	
	public void Start()
	{
		timeHelper.StartTimer(timespan,

		// Update from Timer
		(progress)=>{
			if(OnProgressChanged != null)
				OnProgressChanged(progress);
		},
		// Timer Finished
		()=>{
			if(autodestroy)
				Dispose();
		});
	}
	
	public void Stop()
	{
		timeHelper.StopTimer();
	}
	
	public void Dispose()
	{
		if(timeHelper != null)
		{
			timeHelper.Dispose();
		}
		timeHelper = null;
		OnProgressChanged = null;
	}
}
}