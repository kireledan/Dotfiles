command: "echo $(/usr/local/bin/chunkc tiling::query -d id)"

refreshFrequency: 1000

render: (output) ->
  """
    <div class="currentDesktop-container">
      <ul>
        <li id="desktop1">1</li>
        <li id="desktop2">2</li>
        <li id="desktop3">3</li>
        <li id="desktop4">4</li>
        <li id="desktop5">5</li>
        <li id="desktop6">6</li>
        <li id="desktop7">7</li>
      <ul>
    </div>
  """

style: """
  position: relative
  margin-top: 7px
  font: 14px FontAwesome
  color: #aaa

  ul
    list-style: none
    margin: 0 0 0 10px
    padding: 0

  li
    display: inline
    margin: 0 20px

  li.active
    color: #ededed
    border-bottom: 2px solid #ededed
"""

update: (output, domEl) ->
  if ($(domEl).find('li.active').id isnt output)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#desktop' + output).addClass('active')

  $('#desktop1').on "click", => @run "/usr/local/bin/khd -p 'alt - 1'"
  $('#desktop2').on "click", => @run "/usr/local/bin/khd -p 'alt - 2'"
  $('#desktop3').on "click", => @run "/usr/local/bin/khd -p 'alt - 3'"
  $('#desktop4').on "click", => @run "/usr/local/bin/khd -p 'alt - 4'"
  $('#desktop5').on "click", => @run "/usr/local/bin/khd -p 'alt - 5'"
