/// sound_machine(snd)
function sound_machine(snd) {
	
	with (o_audio_controller) audio_play_sound(snd, false, false);
	
}