[![Tests](https://github.com/wisp3rwind/typst-showframe/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/wisp3rwind/typst-showframe/actions/workflows/tests.yml)

# The `showframe` Package

Show borders around the main text area, header and footer in Typst documents.

This may be useful to understand and debug layout issues.
The idea is similar to the LaTeX  [`showframe`](https://ctan.org/pkg/showframe)
package.

## Usage

```typst
#import "@preview/showframe:v0.1.0": background
#set page(paper: "a6")

#set page(background: background())
#lorem(100)

#pagebreak()

#set page(background: background(stroke: blue + 1pt))
#lorem(100)
```

![Output of the usage example, page 1](/docs/example-1-p1.svg) ![Output of the usage example, page 2](/docs/example-1-p2.svg)

## Known issues

The following limitations are known, PRs to address them are always welcome!:

- If `page.margin` contains the `inside` or `outside` keys, and `page.binding`
  is set to `auto`, the package will currently assume an LTR document with
  binding on the left side. It would be correct to follow Typst and determine
  the binding according to the text direction.

## Feature ideas

The following are some ideas of functionality that might be added or improved
in this package:

- Further separate measuring and rendering steps in the implementation.
  This would allow to make the rendering more customizable
  e.g. like the cross markers in this related
  [`tex.SE` question](https://tex.stackexchange.com/questions/2792/display-text-area-markers),
  or by not having contiguous lines but just rectangles around the main and
  margin text areas.

## Acknowledgements
The following Typst issues and forum post inspired this package and informed
its design and implementation:

- https://github.com/typst/typst/issues/5311

## LaTeX equivalents
- the [`layout`](https://ctan.org/pkg/layout) package shows the page dimensions
- the [`showframe`](https://ctan.org/pkg/showframe) package
- the [`geometry`](https://ctan.org/pkg/geometry) package used as `\usepackge[showframe,pass]{geometry}`
- a related [`tex.SE` question](https://tex.stackexchange.com/questions/2792/display-text-area-markers)
