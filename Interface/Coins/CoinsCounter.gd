extends NinePatchRect

func on_cash_updated(cash):
	$Label.text = str(cash)