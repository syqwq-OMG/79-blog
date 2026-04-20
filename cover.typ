#import "utils.typ": *
#{
  set align(center + horizon)
  set text(font: (en-serif, cn-serif))

  place(
    right,
    tile("9m", tile-height: 180pt, rotation: -30deg),
  )

  box(
    stroke: 2.5pt,
    outset: 19pt,
    box(
      stroke: 2pt,
      outset: 15pt,
      text(size: 30pt)[
        初学者 の 幸运 \
        Seventh 9 先生 の \
        麻将课堂
      ],
    ),
  )

  place(
    dx:-1em,
    dy:-8em,
    tile("7m", tile-height: 80pt, rotation: 30deg),
  )

    place(
    right,
    dy:8em,
    tile("1s", tile-height: 130pt, rotation: 60deg),
  )
}
