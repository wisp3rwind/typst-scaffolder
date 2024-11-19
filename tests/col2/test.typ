#import "/src/lib.typ": background

#let columns = 2

#set page(
  background: background(),
  footer: rect(width: 100%, height: 100%, fill: red, stroke: none),
  header: rect(width: 100%, height: 100%, fill: red, stroke: none),
  columns: columns,
  paper: "a6",
)

#for _i in range(columns) {
  rect(height: 5mm, width: 100%, fill: blue, stroke: none)

  v(1fr)

  lorem(20)

  v(1fr)

  rect(height: 5mm, width: 100%, fill: blue, stroke: none)

  colbreak()
}
