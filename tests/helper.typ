#let test-rect(fill: white, ..body) = {
  rect(
    width: 100%,
    height: 100%,
    fill: fill.lighten(80%),
    stroke: none,
    [
      #v(1fr)
      #body.pos().join()
      #v(1fr)
    ],
  )
}

#let test-page(
  margin: auto,
  binding: auto,
  dir: auto,
  lang: "en",
  body: auto,
  repeat: 1,
) = {
  set text(lang: lang, dir: dir)
  set page(binding: binding, margin: margin)
  
  for _ in range(repeat) {
    let body = if body == auto [
      Setup
      - margin: #margin (Parsed: #context {  get-page-margins() })
      - binding: #binding (Parsed: #context {  get-page-binding() })
      - dir: #dir (Parsed: #context { get-text-dir() })
      - lang: #lang (Parsed: #context { text.lang })
      - odd page: #context { calc.odd(here().page()) }
    ] else {
      body
    }

    // ... and main text area with colored rectangles that fill the whole area.
    // If the package is correctly implemented, the frame shown should exactly
    // correspond to the rectangle locations.
    test-rect(fill: blue, body)

    pagebreak(weak: true)
  }
}

