
var ts = obj_gameplay.StepTime();
var fade = 1 * ts;

image_alpha -= fade;

if (image_alpha <= 0)
{
	instance_destroy();
}
