import UnityEngine


class Killers (MonoBehaviour):


	private anime as tk2dAnimatedSprite

	public hp as single = 50
	private speed as single = 0.5F
	private isDead as bool = false
	private isLookingRight = true

	private enemy as GameObject
	private recallVal as single = 2F


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()
		enemy = GameObject.FindWithTag("Player")


	def Update():

		if isDead:
			rigidbody.useGravity = true
			anime.FlipY()
		else:
			direction as Vector3 = (enemy.transform.position - transform.position).normalized
			transform.Translate(direction * speed * Time.deltaTime)

			if hp <= 0:
				isDead = true


	def FixedUpdate():

		if enemy.transform.position.x < transform.position.x:
			LookLeft()
		else:
			LookRight()

		if not isDead:
			transform.position.z = 0
		else:
			transform.position.z = 1


	def OnCollisionEnter():
		Invoke("Recall", recallVal)


	def OnBecameInvisible():
		if isDead:
			Destroy(self.gameObject)


	def LookLeft():
		if isLookingRight:
			anime.FlipX()
			isLookingRight = false


	def LookRight():
		if not isLookingRight:
			anime.FlipX()
			isLookingRight = true


	def Hurt(points as single):
		hp -= points
		rigidbody.AddExplosionForce(1F, transform.position, 0.25F)
		Invoke("Recall", recallVal)


	def Recall():
		rigidbody.velocity = Vector3.zero
		rigidbody.angularVelocity = Vector3.zero
		rigidbody.rotation = Quaternion.identity
		transform.rotation = Quaternion.identity