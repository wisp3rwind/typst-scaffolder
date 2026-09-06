#import "/tests/helper.typ": test-rect
#import "/src/lib.typ": scaffolding

#set page(background: scaffolding())

#let content() = rect(fill: blue.lighten(80%), stroke: none)[
  #v(1fr)
  #lorem(10)
  #v(1fr)
]

#set page(height: auto, width: 3cm)
#content()

#set page(height: auto, width: auto)
#content()

#set page(height: 5cm, width: auto)
#content()

#set page(height: auto, width: 3cm, flipped: true)
#content()

#set page(height: auto, width: auto, flipped: true)
#content()

#set page(height: 5cm, width: auto, flipped: true)
#content()
