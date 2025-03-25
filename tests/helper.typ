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
