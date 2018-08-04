command: "sh ./scripts/spotify.sh"

refreshFrequency: '2s' # ms
# echo "<span class='title'>$theArtist -</span><class='artist'>$theName $thePosition</>" || echo "Not Connected To Spotify"

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class='spotify'></div>
  """

style: """
  color: #66d9ef
  font: 12px Hack
  left: 8px
  bottom: 13px
  width:850px
  height: 16px
  .torrentStatus
    position: relative
    bottom: 15px
"""

cutWhiteSpace: (text) ->
  text.replace /^\s+|\s+$/g, ""

update: (output, domEl) ->

   values = output.split('@')
   artist = @cutWhiteSpace(values[0])
   song = @cutWhiteSpace(values[1])
   elapsed = values[2]
   total = values[3]
   status = @cutWhiteSpace(values[4])

   if artist.length >= 14
     artist = artist.substring(0,13)
     artist = @cutWhiteSpace(artist)
     song = song + "…"

   if song.length >= 14
     song = song.substring(0,13)
     song = @cutWhiteSpace(song)
     song = song + "…"

   elaspedValues = elapsed.split(':')
   elaspedSeconds = 60 * parseInt(elaspedValues[0]) + parseInt(elaspedValues)
   
   totalValues = total.split(':')
   totalSeconds = total/1000

   elapsed = elaspedSeconds / totalSeconds

   # Create mpdHtmlString
   mpdHtmlString = "<span class='icon switch'></span><span class='white'>  #{artist} - #{song}&nbsp</span>"

   emptySpace = (70 - artist.length - song.length - 3) / 2

   elapsedCounter = parseInt(elapsed * emptySpace / 100 )
   remainingCounter = emptySpace - elapsedCounter - 1



   mpdHtmlString += "<span class='purple'>"
   i = 0
   while i <= elapsedCounter
     i += 1
     mpdHtmlString += " ● "

   mpdHtmlString += "</span>"
   mpdHtmlString += "<span class='grey'>"

   i = 0
   while i <= remainingCounter
     i += 1
     mpdHtmlString += " ● "

   mpdHtmlString += "</span>"


   mpdHtmlString += "<span class='sicon prev'>&nbsp&nbsp</span>" + " "

   if status == "playing."
      mpdHtmlString += "<span class='sicon pause'></span>" + " "
   else
      mpdHtmlString += "<span class='sicon play'></span>" + " "

   mpdHtmlString += "<span class='sicon next'></span>"


   $(domEl).find('.spotify').html(mpdHtmlString)