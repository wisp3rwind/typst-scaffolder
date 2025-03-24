#import "/tests/helper.typ": test-rect, test-page
#import "/src/lib.typ": background

#set page(
  background: background(),
  footer: test-rect(fill: red),
  header: test-rect(fill: green),
  paper: "a6",
)

#let test-page(
  margin: auto,
  binding: auto,
  dir: auto,
  lang: "en",
  columns: 1,
) = {
  set text(lang: lang, dir: dir)
  set page(binding: binding, margin: margin, columns: columns)
  
  for _ in range(columns) {
    // ... and main text area with colored rectangles that fill the whole area.
    // If the package is correctly implemented, the frame shown should exactly
    // correspond to the rectangle locations.
    test-rect(fill: blue, lorem(20))
    colbreak()
  }

  pagebreak(weak: true)
}


#test-page(columns: 2)
#test-page(columns: 3)
#test-page(columns: 3, margin: (inside: 5mm, outside: 3cm))
