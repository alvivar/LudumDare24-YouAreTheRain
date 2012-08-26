import UnityEngine


class AlenaBubble(MonoBehaviour): 


	def FixedUpdate():
		if transform.position.z != 0:
			transform.position.z = 0
			
			
	def OnBecameInvisible():
		Destroy(self.gameObject)