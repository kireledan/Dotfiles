IFS='|' read -r theArtist theName theState thePosition theDuration <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        set theState to player state as string
        set thePosition to player position as integer
        set theDuration to duration of current track
        return theArtist & "|" & theName & "|" & theState  & "|" & thePosition & "|" & theDuration
    end tell')"



echo "$theArtist@$theName@$thePosition@$theDuration@$theState" 