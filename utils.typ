#import "tiles.typ":*
#import "@preview/theorion:0.6.0":*
#import "@preview/showybox:2.0.4":showybox


#let cn-serif = "Source Han Serif SC"
#let en-serif = "New Computer Modern"
#let cn-sans = "Source Han Sans SC"
#let en-sans = "New Computer Modern Sans"
#let cn-kai = "LXGW WenKai"

#let mhand(..arg) = {
  set align(center)
  hand(..arg)
}

#let thmprefix(t, color: rgb("#000000")) = {
  text(font: (en-sans, cn-sans), weight: 650, fill: color)[#t]
}
#let thmtitle(t, color: rgb("#000000")) = {
  text(font: (en-sans, cn-sans), weight: 350, fill: color)[#t]
}
#let thmtext(t, color: rgb("#000000")) = {
  let a = t.children
  if (a.at(0) == [ ]) {
    a.remove(0)
  }
  t = a.join()

  text(font: (en-sans, cn-sans), weight: 326, fill: color)[#t]
}

#let rect-box-style(prefix: auto, title: "", full-title: auto, fill: luma(500), body) = {
  let titlefmt = thmtitle.with(color: fill.darken(30%))
  let bodyfmt = thmtext.with(color: fill.darken(70%))
  let prefixfmt = thmprefix.with(color: fill.darken(30%))

  showybox(
    width: 100%,
    radius: 0.3em,
    breakable: false,
    padding: (top: 0em, bottom: 0em),
    frame: (
      body-color: fill.lighten(96%).transparentize(50%),
      border-color: fill.darken(10%),
      thickness: (left: 2pt),
      inset: 1.2em,
      radius: 0em,
    ),
    [
      #set par(first-line-indent: 2em)
      #block[
        #prefixfmt(prefix) #titlefmt(title)
      ]
      #bodyfmt(body)
    ],
  )
}

#let (example-counter, example-box, example, show-example) = make-frame(
  "example",
  // theorion-i18n-map.at("example"),
  [例],
  inherited-levels: 2,
  inherited-from: heading,
  render: rect-box-style.with(fill: rgb("#402eb6")),
)