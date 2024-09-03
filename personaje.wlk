import wollok.game.*
import mapa.constants
object player {
  var energy = 100
  const width = 40
  const height = 28
  var property position = game.origin()
  var xSpeed = 10

	var airSpeed = 0.0;
	const gravity = 0.04 * constants.getGAMESCALE();
	const jumpSpeed = 2.25 * constants.getGAMESCALE();
	const fallSpeedAfterCollision = 0.5 * constants.getGAMESCALE();
	var inAir = false;


  method energy() = energy
  method xPos() = position.x()
  method yPos() = position.y()
  method getPosition() = position
  method width() = width
  method height() = height

  method golpe() = "auch!"
  method noPasa() = "No puedo pasar!"
  method image() = "player_1.png"

  method centrar() {
    position = position.up(game.height()/2 - height/2 ).right(game.width()/2 - width/2) 
  } 
  method xSpeed() = xSpeed
  method xSpeed(c) {
    xSpeed = c
  }
  method derecha() {
    position = position.right(xSpeed)
  }
  method izquierda() {
    position = position.left(xSpeed)
  }
  method up() {
    position = position.up(xSpeed)
  }
  //-----------------------------
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
      self.derecha()
    } else {
      if(airSpeed > 0){
					self.resetInAir()
      } else {
        airSpeed = fallSpeedAfterCollision
      }
    }
  }
//-----------------------------------------

  method canMoveHereX(x) {
    return (game.getObjectsIn(x).size() == 0)
  }
  method canMoveHereY(y, plataforma) {
    return !(y == plataforma)
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


//-- CLASE PARA HACER HITBOXES
class Hitbox {
  const width
  const height
  // const property objeto
  var property position = game.origin()

  method xPos() = position.x()
  method yPos() = position.y()
  method getPosition() = position

  method xHitbox(x) = x + width
  method yHitbox(y) = y

  method updatexPos(x) {
    position = position.right(x)
  }
  method updateyPos(y) {
    position = position.up(y)
  }

  method initHitbox(objeto) {
    position = position.createPosition(self.xHitbox(objeto.xPos()), self.yHitbox(objeto.yPos()))
  }
}
