using UnityEngine;
using System.Collections;

namespace Gamma {
	public interface IApplicationPause {

		void OnApplicationPause(bool pauseStatus);
	}
}
