import wollok.game.*

const mapaPosiciones = [100,200,300,400]

object mapa {
  const property plataformas = []
  const property platHitbox = []
  var property cantidad = 0

  method addPlataforma(plataforma) {
    plataformas.add(plataforma)
    self.cantidad(1)
  }
  method platHitbox(plataforma) {
    platHitbox.add(plataforma)
    // self.cantidad(1)
  }

  method cantidad(n) {
    cantidad += n
  }
}


//-- CLASE PARA CREAR PLATAFORMAS
class Plataforma {
  const imagen
  const width
  const height
  var property position = game.origin()

  method image() = imagen

  method posicionar(x,y) {
    position = position.right(x).up(y)
  } // .right y .up SUMAN lo que le pases a la posicion actual.

  method xPos() = position.x()
  method yPos() = position.y()
  method getPosition() = position
  method width() = width
  method height() = height



}

object constants {
  const gameScale = 1.5

  method getGAMESCALE() = gameScale
  
}

//-- Clase para crear visuales como ventanas de pausa, etc.
class Visual {
  const imagen
  const width
  const height

  var property position = game.origin()

  method centrar() {
    position = position.up(game.height()/2 - height/2 ).right(game.width()/2 - width/2) 
  } 
  method image() = imagen
}

const gameOverBg = new Visual(imagen = "background_menu.jpg", width = 1280, height = 720 )
const gameOverText = new Visual(imagen = "game_over_cute.png", width = 630, height = 630)
