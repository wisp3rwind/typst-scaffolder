#import "/tests/helper.typ": test-rect
#import "/src/impl.typ": get-page-binding, get-page-margins, get-text-dir
#import "/src/lib.typ": scaffolding

#set page(
  background: scaffolding(),
  // Fill header, footer, ...
  footer: test-rect(fill: red),
  header: test-rect(fill: green),
  paper: "a6",
)

#let test-page(
  margin: auto,
  binding: auto,
  dir: auto,
  lang: "en",
  flipped: false,

) = {
  set text(lang: lang, dir: dir)
  set page(binding: binding, margin: margin, flipped: flipped)

  for _ in range(2) {
    let body = [
      Setup
      - margin: #margin (Parsed: #context {  get-page-margins() })
      - binding: #binding (Parsed: #context {  get-page-binding() })
      - dir: #dir (Parsed: #context { get-text-dir() })
      - lang: #lang (Parsed: #context { text.lang })
      - odd page: #context { calc.odd(here().page()) }
      #if flipped [
        // Only show this line when `flipped` is `true` such that old tests
        // outputs that were generated before adding landscape support don't
        // change.
        - flipped: #context { page.flipped }
      ]
    ]

    // ... and main text area with colored rectangles that fill the whole area.
    // If the package is correctly implemented, the frame shown should exactly
    // correspond to the rectangle locations.
    test-rect(fill: blue, body)

    pagebreak(weak: true)
  }
}

#for flipped in (false, true) {
  test-page(flipped: flipped)
  test-page(margin: 1cm, flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), binding: left, flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), binding: right, flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), dir: ltr, flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), dir: rtl, flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), lang: "de", flipped: flipped)
  test-page(margin: (inside: 5mm, outside: 3cm), lang: "ar", flipped: flipped)
  test-page(margin: (top: 5mm, bottom: 3cm), lang: "ar", flipped: flipped)
  test-page(margin: (left: 1cm, right: 3cm), flipped: flipped)
}

