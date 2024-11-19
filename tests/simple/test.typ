#import "/src/lib.typ": background

#set page(
  background: background(),
  footer: rect(width: 100%, height: 100%, fill: red, stroke: none),
  header: rect(width: 100%, height: 100%, fill: red, stroke: none),
  paper: "a6",
)

#rect(height: 5mm, width: 100%, fill: blue, stroke: none)

#v(1fr)

#lorem(100)

#v(1fr)

#rect(height: 5mm, width: 100%, fill: blue, stroke: none)
