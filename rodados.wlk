import wollok.game.*

class Corsa {
  var property color
  var position = new Position(x=4,y=7) //game.at(0,0)
  const pasoPor = []
  method capacidad() {return 4}
  method velocidadMaxima() {return 150}
  method peso() {return 1300}
}
//new Corsa() equivale a crear un objeto de la clase escrita
//new Corsa(color = "rojo") como hay un atributo sin valor fijo se debe definir
//  const listaDeAutos = [new Corsa(color = "rojo")]
// listaDeAutos.add(new Corsa(color = "rojo")) nuevo corsa diferente al anterior
//const primerCorsa = listaDeAutos.get(0)

class Kwid {
  var tieneTanqueAdicional
  method capacidad() {
    if(tieneTanqueAdicional){
      return 3
    }
    else{
      return 4
    }
  }
  method velocidadMaxima() {
    if(tieneTanqueAdicional){
      return 120
    }
    else{
      return 110
    }
  }
  method peso() {
    if(tieneTanqueAdicional){
      return 1200 + 150
    }
    else{
      return 1200
    }
  }
  method color() {return "azul"}
}

object trafic {
  var property interior = comodo
  var property motor = pulenta
  method capacidad() {return interior.capacidad()}
  method peso() {return 4000 + interior.peso() + motor.peso()}
  method velocidadMaxima(){return motor.velocidad()}
  method color() {return "blanco"}
}

object comodo {
  method capacidad() {return 5}
  method peso() {return 700}
}

object popular {
  method capacidad() {return 12}
  method peso() {return 1000}
}

object pulenta {
  method peso() {return 800}
  method velocidad() {return 130}
}

object bataton {
  method peso() {return 500}
  method velocidad() {return 80}
}

class Especial{
  var property capacidad
  var property peso
  var property color
  const velocidadMaxima
  method velocidadMaxima() {return velocidadMaxima.min(topeVelocidadMaxima.tope)} //el limite va a ser el tope. O devuelve la velocidad si es menor a 200 o devuelve el tope si es mayor a 200
}

object topeVelocidadMaxima {
  var property tope = 200
}

class Dependencia {
  const flotaRodados = {}
  var property empleados = 0
  method agregarAFlota(rodado){
    flotaRodados.add(rodado)
  }
  method quitarDeFlota(rodado){
    flotaRodados.remove(rodado)
  }
  method pesoTotalFlota(){
    flotaRodados.sum({c=>c.peso()})
  }
  method estaBienEquipada(){
    return self.tieneAlmenosRodados(3) && self.todosVanA100()
  }
  method tieneAlmenosRodados(cantidad){
    return flotaRodados.size() >= cantidad
  }
  method todosVanA100(){
    return flotaRodados.all({c=>c.velocidadMaxima() >= 100})
  }
  method capacidadTotalEnColor(color){
    return self.rodadosDeColor(color).sum({c=>c.capacidad()})
  }
  method rodadosDeColor(color){
    return flotaRodados.filter({c=>c.color() == color})
  }
  method colorDelRodadoMasRapido(){
    return self.autoMasRapido().color()
  }
  method autoMasRapido(){
    return flotaRodados.max({c=>c.velocidadMaxima()})

  }
  method capacidadFaltante(){
    return (empleados - self.capacidadTotalSumadaFlota()).max(0)
  }
  method capacidadTotalSumadaFlota(){
    return flotaRodados.sum({c=>c.capacidad()})
  }
  method esGrande(){
    return empleados >= 40 && self.tieneAlmenosRodados(5)
  }
}