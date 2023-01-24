tell application "PopClip"
	activate
	set _res to display dialog "This extension requires gather-cli, would you like to install it now?" buttons {"Later", "Manual Install", "Automatic Install"} default button "Automatic Install"
	if button returned of _res is "Automatic Install" then
		set _res to display dialog "A package will be downloaded and you'll be presented an install dialog in a moment." buttons {"Cancel", "OK"} default button "OK"
		if button returned of _res is "OK" then
			do shell script "curl -SsL --output-dir /tmp -O https://cdn3.brettterpstra.com/downloads/gather-cli-latest.pkg && open -W /tmp/gather-cli-latest.pkg"
			display dialog "If all went well, you can now use WebMarkdown. If you ran into any trouble, run WebMarkdown again and choose Manual Install." buttons {"OK"} default button 1
		end if
	else if button returned of _res is "Manual Install" then
		display dialog "Your browser will now be directed to the download page. Please follow the install instructions there" buttons {"OK"} default button 1
		open location "https://brettterpstra.com/projects/gather-cli/"
	else
		display dialog "You won't be able to use WebMarkdown until you install the CLI." buttons {"Got it"} default button 1
	end if
end tell
