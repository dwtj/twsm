on run {input, parameters}
	repeat with i in input
		set workspace_root to (POSIX path of i as text)
		set cmd to "twsm attach-workspace --root \"" & workspace_root & "\""
		launch_cmd(cmd)
	end repeat
end run


on launch_cmd(cmd)
	tell application "iTerm"
		activate
		if (count of terminals) = 0 then
			set t to (make new terminal)
		else
			set t to current terminal
		end if
		
		tell t
			set s to (make new session at the end of sessions)
			tell s
				exec command "zsh -i"
				write text cmd
			end tell
		end tell
	end tell
end launch_cmd
