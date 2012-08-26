import UnityEngine


class AlenaBubble(MonoBehaviour): 


	def FixedUpdate():
		transform.position.z = 0
			
			
	def OnBecameInvisible():
		Destroy(self.gameObject)