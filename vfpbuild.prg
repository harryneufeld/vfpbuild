lparameters filePath

_screen.Visible = .F.
set Asserts on
on Shutdown do CloseApplication

local llOk, lcErrFile
lcErrFile = strtran(filePath, "prg", "err")

try
	compile (filePath)
	if file(lcErrFile)
		llOk = .F.
	endif
catch to loError
	llOk = .F.
	MessageBox("Error compiling file: "+ filePath + Chr(13) + loError.Message,16,"ERROR COMPILING")
endtry

if !llOk and file(lcErrFile)
	lcMessage = FileToStr(lcErrFile)
	MessageBox(lcMessage)
endif

function CloseApplication()
	_screen.Visible = .T.
	clear events
   	close database all
   	close tables
   	release All
   	close All
   	on shutdown 
endfunc