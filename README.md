[![Tests](https://github.com/wisp3rwind/typst-scaffolder/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/wisp3rwind/typst-scaffolder/actions/workflows/tests.yml)

# The `scaffolder` Package

Show borders around the main text area, header and footer in Typst documents.

This may be useful to understand and debug layout issues.
The idea is similar to the LaTeX  [`showframe`](https://ctan.org/pkg/showframe)
package.

Additionally, some internal functions for resolving page and margin dimensions
are exposed since they might be useful beyond this package.

## Usage

The main entry point is the `scaffolding` method, which renders a grid to
indicate text area, header and footer. It should be placed in the page's
background:

```typst
#import "@preview/scaffolder:0.2.1": scaffolding
#set page(paper: "a6")

#set page(background: scaffolding())

#lorem(100)

#pagebreak()

#set page(
  background: scaffolding(stroke: blue + 1pt),
  columns: 2,
)

#lorem(100)
```

![Output of the usage example, page 1](/docs/example-1-p1.svg) ![Output of the usage example, page 2](/docs/example-1-p2.svg)


The following methods resolve the actual values of some parameters
related to layout:

- `get-text-dir`: Resolves `text.dir` to either `ltr` or `rtl`.
- `get-page-binding`: Resolves `page.binding` to either `left` or `right`.
- `get-page-margins`: Resolves `page.margin` to a dictionary with keys `left`, `right`, `top` and `bottom`.

All of the require context:

```typst
#import "@preview/scaffolder:0.2.1": get-text-dir, get-page-binding, get-page-margins

#context {
  let dir = get-text-dir()

  let binding = get-page-binding()

  let margins = get-page-margins()
}

```

## Known issues

The following limitations are known, PRs to address them are always welcome!:

- (none)

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

A more general _visual debug mode_ for Typst has also
been proposed in [typst/#5226](https://github.com/typst/typst/issues/5226).

## LaTeX equivalents
- the [`layout`](https://ctan.org/pkg/layout) package shows the page dimensions
- the [`showframe`](https://ctan.org/pkg/showframe) package
- the [`geometry`](https://ctan.org/pkg/geometry) package used as `\usepackge[showframe,pass]{geometry}`
- a related [`tex.SE` question](https://tex.stackexchange.com/questions/2792/display-text-area-markers)
