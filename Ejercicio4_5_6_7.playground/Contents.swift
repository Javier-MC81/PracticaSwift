import UIKit

//Ejercicio 4

enum Posicion {
    case portero
    case lateral_derecho
    case lateral_izquierdo
    case central
    case medio_centro
    case extremo_derecha
    case extremo_izquierda
    case delantero
}

//Ejercicio 5

class Seleccion {
    var name: String?
    var member: [Miembro?]
    
    init () {
        name = ""
        member = []
    }
    
    convenience init(name: String? ){
        self.init()
        
        self.name = name
    }
    
    init (name: String?,_ member: [Miembro?]) {
        self.name = name
        self.member = member
    }
    
    
    
}// Creo el enumerado

enum Miembro {
    case seleccionador(String)
    case jugador(nombre: String, posicion: Posicion)
    case medico(String)
    case cuerpo_tecnico(String)
    case delegado(String)
}

//Ejercicio 6

class Mundial {
    //Genero todos los equipos con un ejemplo de miembros con tuplas de jugador - posición
    var teamsOfWorldCup: [Seleccion] = []
    var team1: Seleccion = Seleccion(name: "España", [Miembro.seleccionador("Luis Enrique"), Miembro.jugador(nombre: "Morata", posicion: Posicion.delantero)])
    var team2: Seleccion = Seleccion(name: "Brasil", [Miembro.seleccionador("Tite"), Miembro.jugador(nombre: "Neymal", posicion: Posicion.delantero)])
    var team3: Seleccion = Seleccion(name: "Croacia", [Miembro.seleccionador("Dalic"), Miembro.jugador(nombre: "Modric", posicion: Posicion.medio_centro)])
    var team4: Seleccion = Seleccion(name: "Portugal",[Miembro.seleccionador("Fernando Santos"), Miembro.jugador(nombre: "Pepe", posicion: Posicion.central)])
    var team5: Seleccion = Seleccion(name: "Argentina", [Miembro.seleccionador("Scaloni"), Miembro.jugador(nombre: "Di María", posicion: Posicion.extremo_izquierda)])
    var team6: Seleccion = Seleccion(name: "Uruguay", [Miembro.seleccionador("Diego Alonso"), Miembro.jugador(nombre: "Cavani", posicion: Posicion.delantero)])
    var team7: Seleccion = Seleccion(name: "Marruecos", [Miembro.seleccionador("Walid Regragui"), Miembro.jugador(nombre: "Ziyech", posicion: Posicion.extremo_derecha)])
    var team8: Seleccion = Seleccion(name: "Inglaterra", [Miembro.seleccionador("Southgate"), Miembro.jugador(nombre: "Pickford", posicion: Posicion.portero)])
    var team9: Seleccion = Seleccion(name: "Suiza", [Miembro.seleccionador("Yakin"), Miembro.jugador(nombre: "Sommer", posicion: Posicion.portero)])
    var team10: Seleccion = Seleccion(name: "Países Bajos", [Miembro.seleccionador("Van Gaal"), Miembro.jugador(nombre: "Dumfries", posicion: Posicion.lateral_derecho)])
    var team11: Seleccion = Seleccion(name: "Senegal", [Miembro.seleccionador("Cissé"), Miembro.jugador(nombre: "Sabaly", posicion: Posicion.lateral_derecho)])
    var team12: Seleccion = Seleccion(name: "Corea del Sur", [Miembro.seleccionador("Paulo Bento"), Miembro.jugador(nombre: "Hwang", posicion: Posicion.extremo_izquierda)])
    var team13: Seleccion = Seleccion(name: "Polonia", [Miembro.seleccionador("Michniewicz"), Miembro.jugador(nombre: "Lewandowsky", posicion: Posicion.delantero)])
    var team14: Seleccion = Seleccion(name: "Francia", [Miembro.seleccionador("Deschamps"), Miembro.jugador(nombre: "Theo Hernández", posicion: Posicion.lateral_izquierdo)])
    var team15: Seleccion = Seleccion(name: "Australia", [Miembro.seleccionador("Graham Arnold"), Miembro.jugador(nombre: "Mooy", posicion: Posicion.medio_centro)])
    var team16: Seleccion = Seleccion(name: "Estados Unidos", [Miembro.seleccionador("Gregg Berhalter"), Miembro.jugador(nombre: "Weah", posicion: Posicion.delantero)])
    
    
    init () {
        //Inicializo el Mundial metiendo a todos los equipos con todos sus datos
        teamsOfWorldCup.append(team1)
        teamsOfWorldCup.append(team2)
        teamsOfWorldCup.append(team3)
        teamsOfWorldCup.append(team4)
        teamsOfWorldCup.append(team5)
        teamsOfWorldCup.append(team6)
        teamsOfWorldCup.append(team7)
        teamsOfWorldCup.append(team8)
        teamsOfWorldCup.append(team9)
        teamsOfWorldCup.append(team10)
        teamsOfWorldCup.append(team11)
        teamsOfWorldCup.append(team12)
        teamsOfWorldCup.append(team13)
        teamsOfWorldCup.append(team14)
        teamsOfWorldCup.append(team15)
        teamsOfWorldCup.append(team16)
    }
}

// Ejercicio 7

protocol MatchDelegate: AnyObject {
    
    func makeMatch(_ lista: [Seleccion])
    
}

class Match {
    weak var delegate: MatchDelegate?
    
    var localTeam: Seleccion?
    var visitorTeam: Seleccion?
    var score: (goalsLocal: Int, goalsVisitor: Int)
    
    init() {
        localTeam = nil
        visitorTeam = nil
        score = (0,0)
    }
    
    init(localTeam: Seleccion, visitorTeam: Seleccion, score: (Int, Int) ){
        self.localTeam = localTeam
        self.visitorTeam = visitorTeam
        self.score = score
    }
    func generateMatch() {
        var Qatar: Mundial = Mundial()
        
        // Lanzo al delegado toda la lista de equipos para que haga unos enfrentamientos aleatorios
        delegate?.makeMatch(Qatar.teamsOfWorldCup)
        
    }
}


    

class MatchCreateDelegate: MatchDelegate {
        
    func makeMatch(_ list: [Seleccion]) {
        var listOfmatches: [Match] =  []
        
        //Genero y hago print de una lista de 10 partidos con resultados aleatorios
        while (listOfmatches.count < 10){
            guard let teamChoosen = list.randomElement() else { return }
            guard let teamChoosen2 = list.randomElement() else { return }
            guard let goalsLocal = [0,1,2,3,4,5].randomElement() else { return }
            guard let goalsVisitor = [0,1,2,3,4,5].randomElement() else { return }
            
            if teamChoosen.name != teamChoosen2.name {
                let match: Match = Match(localTeam: teamChoosen, visitorTeam: teamChoosen2, score: (goalsLocal,goalsVisitor))
                var local: String = (match.localTeam?.name)!
                var visitor: String = (match.visitorTeam?.name)!
                print("Partido: \(String(describing: local)) \(goalsLocal) - \(String(describing: visitor)) \(goalsVisitor)")
                listOfmatches.append(match)
                
            }
        }
    }
            
}
// Creo la clase Match y su delegado para que hagan todo lo ordenado
let partido = Match()
let partidoDelegado = MatchCreateDelegate()

partido.delegate = partidoDelegado
partido.generateMatch()

