import UnityEngine


class Alena(MonoBehaviour):


	public ray as LineRenderer
	public bubblePrefab as GameObject
	public guiHP as GUIText
	public guiScore as GUIText

	public laserSound as AudioClip

	private anime as tk2dAnimatedSprite

	public hp as single = 100
	private score as single = 0
	private damage as single = 10
	private speed as single = 0.8F
	private scorePerHit as single = 3
	private isSad as bool = true
	private isLookingRight as bool = true
	private isAttacking as bool = false
	private isDead as bool = false

	private width as single
	private height as single


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()
		height = Camera.mainCamera.orthographicSize * 2
		width = height * Camera.mainCamera.aspect

		
	def Update():
		Controls()


	def FixedUpdate():
		transform.position.z = 0


	def OnCollisionStay(collision as Collision):

		if collision.gameObject.name == "Love":
			return

		hp -= 0.8F

		if hp < 0:
			hp = 0
			isDead = true

		guiHP.text = "hp " + Mathf.Floor(hp) + "%"

		
		
	def LookLeft():
		if isLookingRight:
			isLookingRight = false
			anime.FlipX()

			
	def LookRight():
		if not isLookingRight:
			isLookingRight = true
			anime.FlipX()
			
			
	def Idle():
		if isSad:
			anime.Play("sad")
		else:
			anime.Play("happy")
		isAttacking = false


	def Happiness():
		isSad = false
		Idle()
			
		
	def Controls():

		if Input.GetKey(KeyCode.R):
			Application.LoadLevel(0)

		if isDead:
			return
		
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
			// audio.PlayOneShot(laserSound)

			direction as Vector3 = (click - rayOrigin).normalized
			distance as single = (click - rayOrigin).magnitude

			hits = Physics.RaycastAll(rayOrigin, direction, distance, 1 << LayerMask.NameToLayer("Good"))
			lenHits = len(hits)
			attack as single = damage * lenHits

			if lenHits > 1:
				score += scorePerHit * scorePerHit * lenHits
			else:
				score += scorePerHit * lenHits

			if score > 0:
				guiScore.text = "score " + score

			for hit in hits:
				hit.transform.gameObject.GetComponent[of Killers]().Hurt(attack)
			
			ray.SetPosition(0, rayOrigin)
			ray.SetPosition(1, Vector3(click.x, click.y, -1))
			
			Invoke("AntiRay", 0.1F)
			
		if Input.GetMouseButtonDown(1):
			
			tearOrigin as Vector3 = transform.position
			if isLookingRight:
				tearOrigin.x += 0.022
			else:
				tearOrigin.x -= 0.022
			tearOrigin.y += 0.013
			
			Instantiate(bubblePrefab, tearOrigin, Quaternion.identity)


	def AntiRay():
		ray.SetPosition(0, Vector3.zero)
		ray.SetPosition(1, Vector3.zero)