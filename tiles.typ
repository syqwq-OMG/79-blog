#import "@preview/riichinator:0.1.0": *

#let show-tiles(body) = {
  // box(tile("3p"), baseline: .5em)
  let mahjong-pieces = (
    "1m", "2m", "3m", "4m", "5m", "6m", "7m", "8m", "9m",
    "1s", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s",
    "1p", "2p", "3p", "4p", "5p", "6p", "7p", "8p", "9p",
    "1z", "2z", "3z", "4z", "5z", "6z", "7z",
  )

  for i in range(1,10){
    mahjong-pieces.push(str(i)+"m")
    mahjong-pieces.push(str(i)+"s")
    mahjong-pieces.push(str(i)+"p")
  }

  for i in range(1,8){
    mahjong-pieces.push(str(i)+"z")
  }

  for p in mahjong-pieces {
    show p: box(tile(p), baseline: .5em)
  }
  
  show: it => mahjong-pieces.fold(it, (acc, p) => {
    show p: [ #box(tile(p), baseline: .5em) ]
    acc
  })

  body
}

