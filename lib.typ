#import "utils.typ": *
#import "@preview/itemize:0.2.0" as _itemize
#import "@preview/cjk-unbreak:0.2.3": remove-cjk-break-space

#let blog-style(body) = {
  set text(font: (en-serif, cn-serif), lang: "zh")

  set page(numbering: "1")
  set par(justify: true, first-line-indent: 2em)

  set heading(numbering: "1.1")
  set enum(numbering: "(1.a)")
  show heading.where(level: 1): h => context {
    set align(center + horizon)
    set page(numbering: (t, ..) => none)
    set text(size: 30pt)

    box(
      fill: red,
      height: 25pt,
      width: 25pt,
      radius: 50%,
      outset: 3pt,
      text(fill: white, str(counter(heading).get().first())),
    )

    linebreak()

    underline(
      stroke: 1.5pt + red,
      offset: 4pt,
      underline(
        stroke: 1.5pt + red,
        offset: 6.5pt,
        h.body,
      ),
    )
    pagebreak()
  }
  show heading.where(level: 2): text.with(font: cn-kai, fill: rgb("#3020ad"), size: 17pt, weight: "bold")
  show heading.where(level: 3): h => {
    set align(center)
    linebreak()

    box(
      // fill:teal,
      stroke: 1pt + teal,
      outset: 4pt,
      text(fill: teal, weight: 900, size: 13pt, font: (en-serif, cn-serif), h.body),
    )
  }

  show: _itemize.default-enum-list.with(indent: 1em)
  show: show-example
  show: show-tiles
  show: remove-cjk-break-space

  include "cover.typ"

  show outline.entry: it => if it.level == 1 {
    link(
      it.element.location(),
      it.indented(it.prefix(), text(weight: "bold", it.body())),
    )
  } else {
    it
  }

  outline(
    depth: 2,
  )

  body
}
