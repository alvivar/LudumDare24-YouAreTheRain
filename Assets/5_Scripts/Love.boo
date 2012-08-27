import UnityEngine


class Love(MonoBehaviour):


	public loveHate as GUIText
	public mainMessage as GUIText
	public defaultBackgroundColor as Color

	private anime as tk2dAnimatedSprite

	private evolution as single = 0
	private evolutionPoints as single = 10.3F
	private level as single = 0
	private isBlinking as bool = false


	def Start():
		anime = GetComponent[of tk2dAnimatedSprite]()
		loveHate.material.color = Color.black


	def Update():

		if evolution >= 1 and level == 0:
			level++
			Blink0()
			anime.Play("level1")
			CleanGUITexts()
			mainMessage.text = "WHAT ARE YOU\nDOING!?"
			Invoke("CleanGUITexts", 4)

		if evolution >= 25 and level == 1:
			level++
			Blink0()
			anime.Play("level2")
			mainMessage.text = "the egg needs\nmore love"
			Invoke("CleanGUITexts", 4)

		if evolution >= 50 and level == 2:
			level++
			Blink0()
			anime.Play("level3")
			mainMessage.text = "WHY?!\nwe are not ready,\nthere is still time"
			Invoke("CleanGUITexts", 4)

		if evolution >= 75 and level == 3:
			level++
			Blink0()
			anime.Play("level4")
			mainMessage.text = "your sadness\nis poison"
			Invoke("CleanGUITexts", 4)

		if evolution >= 100 and level == 4:
			level++
			Blink0()
			anime.Play("level4")
			mainMessage.text = "we can't control\nhim anymore"


	def OnCollisionEnter(collision as Collision):

		if collision.gameObject.name == "AlenaBubble(Clone)":

			Destroy(collision.gameObject)

			if evolution + evolutionPoints < 100:
				evolution += evolutionPoints
			else:
				evolution = 100

			loveHate.text =  Mathf.Floor(evolution) + "%"


	def CleanGUITexts():
		texts as (GameObject) = GameObject.FindGameObjectsWithTag('GUIText')
		for text in texts:
			text.guiText.text = ""


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
		Camera.mainCamera.backgroundColor = defaultBackgroundColor