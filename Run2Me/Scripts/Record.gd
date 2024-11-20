extends HBoxContainer

func Fill(date : Dictionary, score : int, time : int):
	$Number.text = "%d/%02d/%02d" % [date.year, date.month, date.day]
	$Score.text = "%05d" % score
	$Time.text = "%02d:%02d" % [time/60, time%60]
