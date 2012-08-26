import UnityEngine


class Killers (MonoBehaviour):


	public hp as single = 50
	public damage as single = 5
	
	private anime as tk2dAnimatedSprite
	
	private isDead as bool = false


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()


	def Update():
		if isDead:
			rigidbody.useGravity = true
			anime.FlipY()
			
			
	def FixedUpdate():
		if not isDead:
			transform.position.z = 0
		else:
			transform.position.z = 1
				
		
	def OnBecameInvisible():
		if isDead:
			Destroy(self.gameObject)
		
		
	def Hurt(points as single):
		hp -= points
		if hp <= 0:
			isDead = true