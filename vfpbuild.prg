lparameters filePath
_screen.Visible = .F.
set Asserts on
on Shutdown do CloseApplication
try
	compile (filePath)
catch to loError
	MessageBox("Error compiling file: "+ filePath + Chr(13) + loError.Message,16,"ERROR COMPILING")
endtry

function CloseApplication()
	_screen.Visible = .T.
	clear events
   	close database all
   	close tables
   	release All
   	close All
   	on shutdown 
endfunc