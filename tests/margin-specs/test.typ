#import "/tests/helper.typ": test-rect
#import "/src/impl.typ": get-page-binding, get-page-margins, get-text-dir
#import "/src/lib.typ": background

#set page(
  background: background(),
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
) = {
  set text(lang: lang, dir: dir)
  set page(binding: binding, margin: margin)
  
  for _ in range(2) {
    let body = [
      Setup
      - margin: #margin (Parsed: #context {  get-page-margins() })
      - binding: #binding (Parsed: #context {  get-page-binding() })
      - dir: #dir (Parsed: #context { get-text-dir() })
      - lang: #lang (Parsed: #context { text.lang })
      - odd page: #context { calc.odd(here().page()) }
    ]

    // ... and main text area with colored rectangles that fill the whole area.
    // If the package is correctly implemented, the frame shown should exactly
    // correspond to the rectangle locations.
    test-rect(fill: blue, body)

    pagebreak(weak: true)
  }
}

#test-page()
#test-page(margin: 1cm)
#test-page(margin: (inside: 5mm, outside: 3cm))
#test-page(margin: (inside: 5mm, outside: 3cm), binding: left)
#test-page(margin: (inside: 5mm, outside: 3cm), binding: right)
#test-page(margin: (inside: 5mm, outside: 3cm), dir: ltr)
#test-page(margin: (inside: 5mm, outside: 3cm), dir: rtl)
#test-page(margin: (inside: 5mm, outside: 3cm), lang: "de")
#test-page(margin: (inside: 5mm, outside: 3cm), lang: "ar")
#test-page(margin: (top: 5mm, bottom: 3cm), lang: "ar")
#test-page(margin: (left: 1cm, right: 3cm))
