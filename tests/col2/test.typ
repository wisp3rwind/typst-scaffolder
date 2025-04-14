#import "/tests/helper.typ": test-rect
#import "/src/lib.typ": scaffolding

#set page(
  background: scaffolding(),
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
  flipped: false,
) = {
  set text(lang: lang, dir: dir)
  set page(binding: binding, margin: margin, columns: columns, flipped: flipped)

  for _ in range(columns) {
    // ... and main text area with colored rectangles that fill the whole area.
    // If the package is correctly implemented, the frame shown should exactly
    // correspond to the rectangle locations.
    test-rect(fill: blue, lorem(20))
    colbreak()
  }

  pagebreak(weak: true)
}

#for flipped in  (false, true) {
  test-page(columns: 2, flipped: flipped)
  test-page(columns: 3, flipped: flipped)
  test-page(columns: 3, margin: (inside: 5mm, outside: 3cm), flipped: flipped)
}

