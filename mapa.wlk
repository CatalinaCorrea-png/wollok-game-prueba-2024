import wollok.game.*

object plataforma {
  var property position = game.origin()

  method image() = "outside_sprites.png"

  method posicionar(x,y) {
    position = position.right(x).up(y)
  } // .right y .up SUMAN lo que le pases a la posicion actual.

  method posX() = position.x()
  method posY() = position.y()
  method getPosition() = position

  method play() {
    game.sound("fart-with-reverb.mp3")
  }
}

object constants {
  const gameScale = 1.5

  method getGAMESCALE() = gameScale
  
}