#import "@preview/riichinator:0.1.0": *

#let show-tiles(body) = {
  // box(tile("3p"), baseline: .5em)
  let mahjong-pieces = ()

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

