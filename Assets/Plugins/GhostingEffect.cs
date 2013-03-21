using UnityEngine;
using System.Collections;

public class GhostingEffect : MonoBehaviour
{
	public bool isEnabled = false;
	protected float _offsetFix = 0.025f;
	protected float height;
	protected float width;

	void Start ()
	{
		height = Camera.mainCamera.orthographicSize * 2;

		width = height * Camera.mainCamera.aspect;
	}

	void Update ()
	{
		if (isEnabled) {
			Ghosting ();
		}
	}

	void OnBecameVisible ()
	{
		Invoke ("Reset", 1);
	}

	public void Reset ()
	{
		isEnabled = true;
	}

	public void Stop ()
	{
		isEnabled = false;
	}

	protected void Ghosting ()
	{
		float gX = 0;

		float gY = 0;

		if (transform.position.x > width / 2) {

			gX = (Mathf.Abs (transform.position.x) - _offsetFix) * -1;

			print ("r");
		}

		if (transform.position.x < -width / 2) {

			gX = (Mathf.Abs (transform.position.x));

			print ("l");
		}

		if (transform.position.y > height / 2) {

			gY = (Mathf.Abs (transform.position.y) - _offsetFix) * -1;

			print ("u");
		}

		if (transform.position.y < -height / 2) {

			gY = (Mathf.Abs (transform.position.y));

			print ("d");
		}

		if (gX != 0 || gY != 0) {

			gX = gX == 0 ? transform.position.x : gX;

			gY = gY == 0 ? transform.position.y : gY;

			transform.position = new Vector3 (gX, gY, 0);
		}
	}
}
