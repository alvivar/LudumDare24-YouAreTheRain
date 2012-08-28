import UnityEngine


class Killers (MonoBehaviour):


	private anime as tk2dAnimatedSprite

	public hp as single = 50
	private speed as single = 0.5F
	private isDead as bool = false
	private enemy as GameObject


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()
		enemy = GameObject.FindWithTag("Player")
		InvokeRepeating("Recall", 1, 4)


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
		if not isDead:
			transform.position.z = 0
		else:
			transform.position.z = 1


	def OnBecameInvisible():
		if isDead:
			Destroy(self.gameObject)


	def Recall():
		rigidbody.velocity = Vector3.zero
		rigidbody.angularVelocity = Vector3.zero
		rigidbody.rotation = Quaternion.identity
		transform.rotation = Quaternion.identity

		
	def Hurt(points as single):
		hp -= points
		rigidbody.AddExplosionForce(1.5F, transform.position, 0.25F)