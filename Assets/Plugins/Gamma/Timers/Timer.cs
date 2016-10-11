using UnityEngine;
using System;
using System.Timers;

namespace Gamma.Timers {
	public class Timer: IDisposable {

		/// <summary>
		/// Gets or sets the on Timer elpased delegate
		/// </summary>
		public Action OnTimerElapsed {get; set;}
		/// <summary>
		/// The timespan for the Timer
		/// </summary>
		public TimeSpan timespan;
		/// <summary>
		/// Indicating if Timer getting automatically disposed after timer is up.
		/// </summary>
		public bool autodestroy;

		private Internal.TimerHelper timeHelper;

		/// <summary>
		/// Initializes a new instance of <see cref="GammaTimer"/> class.
		/// </summary>
		/// <param name="timespan">The timespan for the Timer</param>
		/// <param name="OnTimerElapsed">Gets or sets the on Timer elpased delegate</param>
		/// <param name="autodestroy">Indicating if Timer getting automatically disposed after timer is up. Defaulvalue is: <c>true</c></param>
		public Timer(TimeSpan timespan, Action OnTimerElapsed, bool autodestroy = true)
		{
			this.OnTimerElapsed = OnTimerElapsed;
			this.timespan = timespan;
			this.autodestroy = autodestroy;
			this.timeHelper = new Internal.TimerHelper();
		}

		public Timer(TimeSpan time) : this(time, null)
		{
		}

		/// <summary>
		/// Start the Timer
		/// </summary>
		public void Start()
		{
			timeHelper.StartTimer(timespan, null, ()=>{
				Stop ();

				if(OnTimerElapsed != null)
					OnTimerElapsed();

				if(autodestroy)
					Dispose();
			});
		}

		/// <summary>
		/// Stop the Timer
		/// </summary>
		public void Stop()
		{
			timeHelper.StopTimer();
		}

		/// <summary>
		/// Dispose GammaTimerIntervall and free Resources
		/// </summary>
		public void Dispose()
		{
			if(timeHelper != null)
			{
				timeHelper.Dispose();
			}
			OnTimerElapsed = null;
			timeHelper = null;
		}
	}
}


