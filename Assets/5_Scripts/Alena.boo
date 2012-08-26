import UnityEngine


class Alena(MonoBehaviour):


	public ray as LineRenderer
	
	private anime as tk2dAnimatedSprite
	private speed as single = 0.35F
	private isLookingRight as bool = true
	private isAttacking as bool = false


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
			
			
	def Idle():
		anime.Play("sad")
		isAttacking = false
			
		
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
			
		if Input.GetMouseButtonDown(0):
			
			isAttacking = true
			anime.Play("attack")
			anime.animationCompleteDelegate = Idle
			
			# The Ray.
			
			click = Camera.mainCamera.ScreenToWorldPoint(Input.mousePosition)
			click.z = 0
			rayOrigin as Vector3 = transform.position
			if isLookingRight:
				rayOrigin.x += 0.022
			else:
				rayOrigin.x -= 0.022
			rayOrigin.y += 0.013
			rayOrigin.z = 0
			
			hits = Physics.RaycastAll(rayOrigin, (click - rayOrigin).normalized)
			for hit in hits:
				print(hit.transform.gameObject.name)
			
			ray.SetPosition(0, rayOrigin)
			ray.SetPosition(1, Vector3(click.x, click.y, -1))
			
			Invoke("AntiRay", 0.10F)
			
			
	# 0 Ray
	def AntiRay():
		ray.SetPosition(0, Vector3.zero)
		ray.SetPosition(1, Vector3.zero)