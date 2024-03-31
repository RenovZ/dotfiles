command: ""

refreshFrequency: 300000

render: ->"""
<li class="button" id="iCloud">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/iCloud.png">
</li>
<br>
<li class="button" id="Computer">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Computer.png">
</li>
<br>
<li class="button" id=Disk>
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Disk.png">
</li>
<br>
<li class="button" id="Home">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Home.png">
</li>
<br>
<li class="button" id="Library">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Library.png">
</li>
<br>
<li class="button" id="Documents">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Documents.png">
</li>
<br>
<li class="button" id="Pictures">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Pictures.png">
</li>
<br>
<li class="button" id="Movies">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Movies.png">
</li>
<br>
<li class="button" id="Music">
  <img src="TheOneWidget.widget/folder-launcher.widget/Icons/Music.png">
</li>
"""

afterRender: (domEl) ->
  $(domEl).on 'click', '#iCloud', => @run "open '/Users/wyattsmcall/Library/Mobile\ Documents/com~apple~CloudDocs'"
  $(domEl).on 'click', '#Computer', => @run "cd ~/Library/Application\\ Support/Übersicht/widgets/folder-launcher.widget/ && ./script.sh"
  $(domEl).on 'click', '#Disk', => @run "open '/'"
  $(domEl).on 'click', '#Home', => @run "open ~"
  $(domEl).on 'click', '#Library', => @run "open ~/Library"
  $(domEl).on 'click', '#Documents', => @run "open ~/Documents"
  $(domEl).on 'click', '#Pictures', => @run "open ~/Pictures"
  $(domEl).on 'click', '#Movies', => @run "open ~/Movies"
  $(domEl).on 'click', '#Music', => @run "open ~/Music"

style: """
  position: fixed
  top: 657px
  left: 410px
  background:rgba(#FFF, .1)
  border-radius:10px

  img
    height: 35px

  .button
    display: inline
"""
