import UnityEngine


class Love(MonoBehaviour):


	public loveHate as GUIText

	private anime as tk2dAnimatedSprite

	private evolution as single = 0
	private evolutionPoints as single = 0.3F
	private level as single = 0
	private isBlinking as bool = false


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()
		loveHate.material.color = Color.black
		Invoke("Blink0", 1)


	def Update():

		if evolution >= 25 and level == 0:
			level++
			Blink0()
			anime.Play("level2")

		if evolution >= 50 and level == 1:
			level++
			Blink0()
			anime.Play("level3")

		if evolution >= 75 and level == 2:
			level++
			Blink0()
			anime.Play("level4")


	def OnCollisionEnter(collision as Collision):

		if collision.gameObject.name == "AlenaBubble(Clone)":

			Destroy(collision.gameObject)

			if evolution < 100:
				evolution += evolutionPoints
			else:
				evolution = 100


	def OnGUI():
		loveHate.text =  Mathf.Floor(evolution) + "%"


	# THE SHAME!

	def Blink0():
		Camera.mainCamera.backgroundColor = Color.red
		Invoke("Blink1", 0.1F)

	def Blink1():
		Camera.mainCamera.backgroundColor = Color.yellow
		Invoke("Blink2", 0.1F)

	def Blink2():
		Camera.mainCamera.backgroundColor = Color.white
		Invoke("Blink3", 0.1F)

	def Blink3():
		Camera.mainCamera.backgroundColor = Color.red
		Invoke("Blink4", 0.1F)

	def Blink4():
		Camera.mainCamera.backgroundColor = Color.yellow
		Invoke("Blink5", 0.1F)

	def Blink5():
		Camera.mainCamera.backgroundColor = Color.white