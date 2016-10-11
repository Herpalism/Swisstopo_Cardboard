using UnityEngine;
using System.Collections;

namespace Gamma.Tweening {
	public interface ITweenable {

		void StartTween(System.Action finishedCallback);
	}
}
