-- # Wait until zoom is launched
tell application "System Events"
	repeat until exists process "zoom.us"
		log "waiting for the zoom.us process"
		delay 0.5
	end repeat
end tell

--  # Setup to do a screen recording.
tell application "System Events" to keystroke "%" using {shift down, command down}

--  # Start the screen recording.
tell application "System Events" to tell process "Screen Shot"
	repeat until exists its front window
		delay 0.1
	end repeat
	if not (exists button "Record" of its front window) then
		click checkbox "Record Entire Screen" of its front window
	end if
	click button "Record" of its front window
end tell

--  # Open the chat window
tell application "zoom.us" to activate
tell application "System Events" to tell process "zoom.us" -- Wait until the actual meeting window is there
	repeat until window "Zoom Meeting" exists
		delay 1.0
	end repeat
	
	repeat until menu bar 1's menu bar item "View"'s menu 1's menu item "Close Chat" exists
		if exists menu bar 1's menu bar item "View"'s menu 1's menu item "Show Chat" then -- Click to show chat
			click menu bar 1's menu bar item "View"'s menu 1's menu item "Show Chat"
		end if
		delay 1.0
	end repeat
end tell

-- # Consent to recording
tell application "System Events" to tell process "zoom.us"
	repeat until window 1 exists
		delay 5.0
	end repeat
	
	repeat until window 1's description is "This meeting is being recorded, By continuing to be in the meeting, you are consenting to be recorded."
		log "waiting for the recording consent window"
		delay 1.0
	end repeat
	
	click button 1 of window 1
end tell

tell application "System Events" to tell process "zoom.us" -- Wait until the meeting window disappears (i.e. meeting ends)
	repeat until not (window "Zoom Meeting" exists)
		delay 1.0
	end repeat
end tell

--  # Stop the recording.
tell application "System Events" to click menu bar item 1 of menu bar 1 of application process "screencaptureui"
