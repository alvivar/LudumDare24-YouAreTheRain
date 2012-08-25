import UnityEngine


class Alena(MonoBehaviour):
	
	
	private anime as tk2dAnimatedSprite
	private speed as single = 0.35F
	private isLookingRight as bool = true


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()

		
	def Update():
		Controls()				

				
	def FixedUpdate():
		pass
		
		
	def LookLeft():
		if isLookingRight:
			isLookingRight = false
			anime.FlipX()
			
			
	def LookRight():
		if not isLookingRight:
			isLookingRight = true
			anime.FlipX()
			
		
	def Controls():
		
		if Input.GetKey(KeyCode.W):
			transform.Translate(Vector3.up * speed * Time.deltaTime)
			
		if Input.GetKey(KeyCode.A):
			LookLeft()
			transform.Translate(Vector3.left * speed * Time.deltaTime)
			
		if Input.GetKey(KeyCode.D):
			LookRight()
			transform.Translate(Vector3.right * speed * Time.deltaTime)
			
		if Input.GetKey(KeyCode.S):
			transform.Translate(Vector3.down * speed * Time.deltaTime)