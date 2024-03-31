#CHANGE "USER" TO YOUR USERNAME/HOMEFOLDER!!!
command: "`pwd`/TheOneWidget.widget/solar-system.widget/script.sh"

#Sets refresh rate in milliseconds
#Default = 86400000 (1 day)
refreshFrequency: 86400000

#Sets scale of sun and planets
#Default = 1
scale: 1

#Sets scale of asteroids
#Default = 1
scaleAsteroids: 1

#Sets scale of Mercury, Venus, Earth, and Mars
#Default = 23
scaleInner: 30

#Sets scale of Jupiter, Saturn, Uranus, and Neptune
#Default = 10
scaleOuter: 10

#Sets size of sun and planets globally
#Default = 1
sizeScale: 1

#Sets size of sun and planets individually
#Default for all = 5
sizes:
  sun: 5
  mercury: 5
  venus: 5
  earth: 5
  mars: 5
  jupiter: 5
  saturn: 5
  uranus: 5
  neptune: 5

style:"""
  //Sets position of widget in pixels
  position: fixed
  top: 440px
  left: 837px

  //////////////////////////////////////////////////////////////////////
  //DO NOT edit anything below this unless you know what you're doing!!!
  //////////////////////////////////////////////////////////////////////

  #sun
    position: absolute
    transform: translate(-50%,-50%)
  #asteroids
    position: absolute
    transform: translate(-50%,-50%)
  #mercury
    position: absolute
    transform: translate(-50%,-50%)
  #venus
    position: absolute
    transform: translate(-50%,-50%)
  #earth
    position: absolute
    transform: translate(-50%,-50%)    
  #mars
    position: absolute
    transform: translate(-50%,-50%)
  #jupiter
    position: absolute
    transform: translate(-50%,-50%)
  #saturn
    position: absolute
    transform: translate(-50%,-50%)
  #uranus
    position: absolute
    transform: translate(-50%,-50%)
  #neptune
    position: absolute
    transform: translate(-50%,-50%)
"""

render: ->"""
<img id="sun" src="TheOneWidget.widget/solar-system.widget/sun.png"/>
<img id="asteroids" src="TheOneWidget.widget/solar-system.widget/asteroids.png"/>
<img id="mercury" src="TheOneWidget.widget/solar-system.widget/mercury.png"/>
<img id="venus" src="TheOneWidget.widget/solar-system.widget/venus.png"/>
<img id="earth" src="TheOneWidget.widget/solar-system.widget/earth.png"/>
<img id="mars" src="TheOneWidget.widget/solar-system.widget/mars.png"/>
<img id="jupiter" src="TheOneWidget.widget/solar-system.widget/jupiter.png"/>
<img id="saturn" src="TheOneWidget.widget/solar-system.widget/saturn.png"/>
<img id="uranus" src="TheOneWidget.widget/solar-system.widget/uranus.png"/>
<img id="neptune" src="TheOneWidget.widget/solar-system.widget/neptune.png"/>
"""

update: (output, domEl) ->
  planets = ['mercury','venus','earth','mars','jupiter','saturn','uranus','neptune']
  asteroids = 'asteroids'  
  sun = 'sun'  

  rows = output.split("\n")
  for row, i in rows
    x = row.split(" ")[0];  y = row.split(" ")[1]
    if i < 4
      x *= @scaleInner; y *= -@scaleInner
    else
      x *= @scaleOuter; y *= -@scaleOuter

    $("##{planets[i]}").css top: "#{y*@scale}px"
    $("##{planets[i]}").css left: "#{x*@scale}px"

  for element, size of @sizes
    $("##{element}").css height: "#{size}px"
    $("##{element}").css width: "#{size}px"

  $("##{asteroids}").css height: "#{@scaleAsteroids*90}px"
  $("##{asteroids}").css width: "#{@scaleAsteroids*90}px"

  $("##{sun}").css height: "#{@scale*25}px"
  $("##{sun}").css width: "#{@scale*25}px"
