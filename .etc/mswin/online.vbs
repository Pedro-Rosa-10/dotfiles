set wsc = CreateObject("WScript.Shell")
Do
	'Five minutes
	Wscript.Sleep(5*60* 1000)
	wsc.Sendkeys("{F13}")
Loop