using UnityEngine;
using System.Collections;
using System;

namespace Gamma.Timers {
	public class Intervall : IDisposable {

		/// <summary>
		/// Gets or sets the on intervall elpased delegate
		/// </summary>
		/// <value>Count of elapsed intervall steps</value>
		public Action<uint> OnIntervallElpased {get; set;}

		/// <summary>
		/// Defines the TimeSpan of 1 Intervall step.
		/// </summary>
		public TimeSpan intervallTime;
		/// <summary>
		/// Count of elapsed intervall steps.
		/// </summary>
		public uint elapsedIntevallCount {get; private set;}
		/// <summary>
		/// Intervall steps to be counted, 0 for unlimited.
		/// </summary>
		public uint intevallCount;
		/// <summary>
		/// Indicating if Intervall getting automatically disposed after last intervall.
		/// </summary>
		public bool autodestroy;

		private Internal.TimerHelper timeHelper;

		/// <summary>
		/// Initializes a new instance of the <see cref="GammaTimeIntervall"/> class.
		/// </summary>
		/// <param name="intervallTime">Defines the TimeSpan of 1 Intervall step.</param>
		/// <param name="intevallCount">Intervall steps to be counted, 0 for unlimited.</param>
		/// <param name="OnIntervallElpased">Delegate getting called every step of the intervall, counting upwards till set intervallCount.</param>
		/// <param name="autodestroy">indicating timer getting automatically disposed after last intervall, default is: <c>true</c></param>
		public Intervall(TimeSpan intervallTime, uint intevallCount, Action<uint> OnIntervallElpased, bool autodestroy = true)
		{
			this.intervallTime = intervallTime;
			this.intevallCount = intevallCount;
			this.OnIntervallElpased = OnIntervallElpased;
			this.autodestroy = autodestroy;
			this.timeHelper = new Internal.TimerHelper();
		}

		/// <summary>
		/// Start the Intervall
		/// </summary>
		public void Start()
		{
			StartIntervall();
		}
		
		private void StartIntervall()
		{
			timeHelper.StartTimer(intervallTime, null, ()=>{
				elapsedIntevallCount++;
				
				if(OnIntervallElpased != null)
					OnIntervallElpased(elapsedIntevallCount);
				
				if(elapsedIntevallCount >= intevallCount && intevallCount != 0){
					Stop ();

					if(autodestroy)
						Dispose();

					return;
				}
				StartIntervall();
			});
		}

		/// <summary>
		/// Stop the Intervall
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
			timeHelper = null;
			OnIntervallElpased = null;
		}
	}
}