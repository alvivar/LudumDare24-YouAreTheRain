import UnityEngine


class Blood(MonoBehaviour):


	def Start():
		Invoke("Suicide", 3)


	def Suicide():
		Destroy(self.gameObject)