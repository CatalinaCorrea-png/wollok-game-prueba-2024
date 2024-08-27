import wollok.game.*
import mapa.constants
object pepita {
  var energy = 100
  var property position = game.origin()

	var airSpeed = 0.0;
	const gravity = 0.04 * constants.getGAMESCALE();
	const jumpSpeed = 2.25 * constants.getGAMESCALE();
	const fallSpeedAfterCollision = 0.5 * constants.getGAMESCALE();
	var inAir = false;


  method energy() = energy
  method posX() = position.x()
  method posY() = position.y()
  method getPosition() = position

  method fly(minutes) {
    energy = energy - minutes * 3
  }

  method golpe() = "auch!"

  method image() = "player_1.png"

  method centrar() {
    position = game.center()
  }

  method derecha(c) {
    position = position.right(c)
  }
  method izquierda(c) {
    position = position.left(c)
  }
  method salto() {
    if(inAir) {
			inAir = true;
    } else {
      inAir = true;
      airSpeed = jumpSpeed;      
    }

	}
  method resetInAir() {
		inAir = false;
		airSpeed = 0;
	}
  method actualizarSalto() {
    if(inAir) {
      position = position.up(airSpeed)
      airSpeed += gravity // if its up, grav is lower num, so speed is slower and vice versa.
      self.derecha(10)
    } else {
      if(airSpeed > 0){
					self.resetInAir()
      } else {
        airSpeed = fallSpeedAfterCollision
      }
    }

  }

  // method updateXPos() {
    
  // }

  method posicionar(x,y) {
    position = position.createPosition(x, y)
  }

  method play(){
    game.sound("fart-with-extra-reverb.mp3")
  }

}
