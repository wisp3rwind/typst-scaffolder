// This is the README example
#import "/src/lib.typ": scaffolding
#set page(paper: "a6")

#set page(background: scaffolding())

#lorem(100)

#pagebreak()

#set page(
  background: scaffolding(stroke: blue + 1pt),
  columns: 2,
)

#lorem(100)

