// This is the README example
#import "/src/lib.typ": background
#set page(paper: "a6")

#set page(background: background())

#lorem(100)

#pagebreak()

#set page(
  background: background(stroke: blue + 1pt),
  columns: 2,
)

#lorem(100)

