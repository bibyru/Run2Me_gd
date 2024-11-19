extends HBoxContainer

func Fill(number : int, score : int, time : int):
	$Number.text = "%02d" % [number+1]
	$Score.text = "%05d" % score
	$Time.text = "%02d:%02d" % [time/60, time%60]
