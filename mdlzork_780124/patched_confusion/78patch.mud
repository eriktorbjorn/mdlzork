"Additions to make this Zork run under Confusion"

<SETG OBJECTS ()>

"Replace SAVE/RESTORE"

<SET REDEFINE T>

<DEFINE DO-SAVE ("AUX" MSG)
	<SET MSG <SAVE "<SAVEFILE>ZORK.SAVE">>
	<TELL .MSG>>

<DEFINE DO-RESTORE () <TELL "Restored."> <RESTORE "<SAVEFILE>ZORK.SAVE">>

<SET REDEFINE <>>

;"BITS FOR 2ND ARG OF CALL TO TELL (DEFAULT IS 1)"

<MSETG LONG-TELL *400000000000*>

<MSETG PRE-CRLF 2>

<MSETG POST-CRLF 1>

<MSETG NO-CRLF 0>

<MSETG LONG-TELL1 <+ ,LONG-TELL ,POST-CRLF>>

<PSETG NULL-DESC "">

<PSETG NULL-EXIT <CHTYPE [] EXIT>>

<PSETG NULL-SYN ![!]>

<DEFINE START-ZORK ()
	<COND (<G? ,MUDDLE 100> <SETG TENEX? <GETSYS>>)
		(<APPLY ,IPC-OFF>
		 <APPLY ,IPC-ON <UNAME> "ZORK">)>
	<SET BH <ON "BLOCKED" ,BLO 100>>
	<START "WHOUS" ,VERS>>