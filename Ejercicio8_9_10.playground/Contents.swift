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
    
    
    
}

enum Miembro {
    case seleccionador(String)
    case jugador(nombre: String, posicion: Posicion)
    case medico(String)
    case cuerpo_tecnico(String)
    case delegado(String)
}

/*var nuevaSeleccion: Seleccion =  Seleccion(name: "España", [Miembro.seleccionador("Luis Enrique"),Miembro.jugador(nombre: "Ansu",posicion: Posicion.delantero),Miembro.jugador(nombre: "Unai Simón", posicion: Posicion.portero),Miembro.jugador(nombre: "Morata", posicion: Posicion.delantero)])
nuevaSeleccion.name
nuevaSeleccion.member
//nuevaSeleccion.member.append(String(Miembro.seleccionador))
print(nuevaSeleccion)
*/
//Ejercicio 6

class Mundial {
    
    var teamsOfWorldCup: [Seleccion] = []
    var team1: Seleccion = Seleccion(name: "España")
    var team2: Seleccion = Seleccion(name: "Brasil")
    var team3: Seleccion = Seleccion(name: "Croacia")
    var team4: Seleccion = Seleccion(name: "Portugal")
    var team5: Seleccion = Seleccion(name: "Argentina")
    var team6: Seleccion = Seleccion(name: "Uruguay")
    var team7: Seleccion = Seleccion(name: "Marruecos")
    var team8: Seleccion = Seleccion(name: "Inglaterra")
    var team9: Seleccion = Seleccion(name: "Suiza")
    var team10: Seleccion = Seleccion(name: "Países Bajos")
    var team11: Seleccion = Seleccion(name: "Senegal")
    var team12: Seleccion = Seleccion(name: "Corea del Sur")
    var team13: Seleccion = Seleccion(name: "Polonia")
    var team14: Seleccion = Seleccion(name: "Francia")
    var team15: Seleccion = Seleccion(name: "Australia")
    var team16: Seleccion = Seleccion(name: "Estados Unidos")
    
    
    
    init () {
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
    
    func createGroups() {
        
        var listAuxiliar: [String] = []
        
        // Ejercicio 8: Generamos una lista de 4 grupos de 4 equipos en cada grupo.
        for i in 1...4 {
            
            var cont: Int = 0
            var groupCreated: Group = Group()
            var listSeleccion: [Seleccion] = []
            var list: [String] = []
            var listWithGoals: [String] = []
            
            //Damos el nombre a cada grupo utilizando la misma variable que recorre el bucle for principal
            switch i {
            case 1: groupCreated.name = "A"
            case 2: groupCreated.name = "B"
            case 3: groupCreated.name = "C"
            case 4: groupCreated.name = "D"
            default: break
            }
            //Generamos los equipos de cada grupo de forma aleatoria y los guardamos en una array de nombres y en otra de selecciones.
            
            while ( cont < 4 ){
                guard let chosen = teamsOfWorldCup.randomElement() else { return }
                if !listAuxiliar.contains(chosen.name!) {
                    listSeleccion.append(chosen)
                    listAuxiliar.append(chosen.name!)
                    groupCreated.fourChosen.append(chosen.name!)
                    cont += 1
                    
                }
                
            }
            // Imprimimos por pantalla los integrantes de cada grupo una vez terminado.
            print("El grupo \(groupCreated.name) está formado por \(groupCreated.fourChosen[0]), \(groupCreated.fourChosen[1]), \(groupCreated.fourChosen[2]), \(groupCreated.fourChosen[3]).\n")
            
            
            //Creamos una array donde se almacenan los puntos obtenidos por cada participante inicialiándola con 0 puntos para cada equipo.
            var points: [Int] = []
            for _ in 0...3 {
                var pointsOfTeam: Int = 0
                points.append(pointsOfTeam)// Creo una lista de enteros que representan de forma ordenada los puntos de cada equipo del grupo creado
                
            }
            
            
            // Ejercicio 10. Generamos los partidos del Mundial con sus resultados aleatorios y los imprimimos.
            for (index,_) in listSeleccion.enumerated() {
                if (index < 3) {
                    for i in (index+1)...3 {
                        guard let goalsLocal = [0,1,2,3,4,5].randomElement() else { return }
                        guard let goalsVisitor = [0,1,2,3,4,5].randomElement() else { return }
                        
                        var match: Match = Match(localTeam: listSeleccion[index], visitorTeam: listSeleccion[i], score: (goalsLocal, goalsVisitor))
                        
                        var local: String = (match.localTeam?.name)!
                        var visitor: String = (match.visitorTeam?.name)!
                        var matches: String = "\(local) vs \(visitor)"
                        var matchWithGoals: String = "Partido: \(String(describing: local)) \(goalsLocal) - \(String(describing: visitor)) \(goalsVisitor)"
                        
             
                        groupCreated.listOfMatchesOfThisGroup.append(match) // Lista de partidos que se juegan en cada grupo en forma de tipo Match
                        //Creamos un array donde se guardan todos los partidos del grupo.
                        groupCreated.listOfMatches.append(matches) // Lista de partidos que se juegan en cada grupo en forma de String
                        
                        listWithGoals.append(matchWithGoals)
                        list = groupCreated.listOfMatches
                        //LÓGICA PARA CONTABILIZAR LOS PUNTOS
                        if goalsLocal > goalsVisitor {
                            points[index] += 3
                        } else if goalsLocal < goalsVisitor {
                            points[i] += 3
                        } else {
                            points[index] += 1
                            points[i] += 1
                        }
                        
                    }
                }
            }
            print("El listado de partidos por jugar es: \(list)\n")
            
            showMatches(listWithGoals: listWithGoals)
            
            
            //Ejercicio 10. Calculamos las dos primeras selecciones del grupo e imprimimos los dos primeros clasificados.
            showList(groupName: groupCreated.name, group: groupCreated)
            
            func showList(groupName: String, group: Group) {
                var listOfTeamsAndPoints: [(String,Int)] = []
                var teamAndPoints: (name: String, points: Int)
                for i in 0...3 {
                    teamAndPoints.name = groupCreated.fourChosen[i]
                    teamAndPoints.points = points[i]
                    listOfTeamsAndPoints.append(teamAndPoints)
                }
                listOfTeamsAndPoints.sort {
                    if ( $0.1 < $1.1 ) {
                        return true
                    } else if ( $0.1 > $1.1 ) {
                        return false
                    } else {
                        return false                  }
                }
                group.teamsAndFinalPoints = listOfTeamsAndPoints
                
    
                
                
            }
            showClassification(nameOfGroup: groupCreated.name, listTeamAndPoints: groupCreated.teamsAndFinalPoints)
            
            func showClassification(nameOfGroup: String, listTeamAndPoints: [(String, Int)]) {
                print("La clasificación del grupo \(nameOfGroup) es: \(listTeamAndPoints)\n")
                print("Los equipos clasificados son \(listTeamAndPoints[2].0) y \(listTeamAndPoints[3].0)\n")
                
            }
            func showMatches (listWithGoals: [String] ){
                listWithGoals.forEach {
                    print($0)
                }
            }
            //Ejercicio 9. Llamamos a la función del grupo para que me muestre los puntos de una selección después de jugarse todos los partidos.
            
            groupCreated.showPoints(nameOfTeam: "Inglaterra") //Escribo como  parámetro el equipo del que quiero saber los puntos obtenidos. Ejercicio 9
            
            //Eliminamos de la lista de equipos los que hayan sido elegidos al formar el grupo, y con los que restan seguimos haciendo grupos.
            teamsOfWorldCup = teamsOfWorldCup.filter({ seleccion in
                var teamToContinue: Bool = false
                groupCreated.fourChosen.forEach({
                    if (seleccion.name != $0) {
                        teamToContinue = true
                    }
                    
                })
                return teamToContinue
            })
            
        }
        
       
    }
}


class Group {
    
    var name: String
    var fourChosen: [String]
    var listOfMatchesOfThisGroup: [Match]
    var listOfMatches: [String]
    var teamsAndFinalPoints: [(String, Int)]
    
    init() {
        self.name = ""
        self.fourChosen = []
        self.listOfMatchesOfThisGroup = []
        self.teamsAndFinalPoints = []
        self.listOfMatches = []
    }
    //Función para mostrar los puntos del equipo pedido. EJERCICIO 9. Ejemplo de llamada en la línea 225
    
    func showPoints(nameOfTeam: String) {
        //Comprobación de las listas de los grupos creados y las recorremos para buscar el país elegido dentro de cada grupo
        var teamThatPlay: Bool = false
    
        switch name {
        case "A": findName(list: teamsAndFinalPoints)
        case "B": findName(list: teamsAndFinalPoints)
        case "C": findName(list: teamsAndFinalPoints)
        case "D": findName(list: teamsAndFinalPoints)
        default:break
        }
        
        // Creamos una función para pintar los puntos conseguidos por el equipo pedido en el ejercicio 9
        func findName (list: [(String,Int)]) {
            list.forEach({
                if (nameOfTeam == $0.0 && $0.1 != 1) {
                    teamThatPlay = true
                    print("\(nameOfTeam) ha conseguido \($0.1) puntos.\n")
                    
                } else if (nameOfTeam == $0.0 && $0.1 == 1) {
                    teamThatPlay = true
                    print("\(nameOfTeam) ha conseguido \($0.1) punto.\n")
                }
            })
    
        }
        if teamThatPlay == false {
            print("\(nameOfTeam) no juega en este grupo\n ")
        }
               
    }
    
}





// Ejercicio 7

/*protocol MatchDelegate: AnyObject {
    
    func makeMatch(_ lista: [Seleccion])
    
}*/

class Match {
    //weak var delegate: MatchDelegate?
    
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


    /*func generateMatch() {
 
        delegate?.makeMatch(Qatar.teamsOfWorldCup)
        
    }*/
}


    

/*class MatchCreateDelegate: MatchDelegate {
        
    func makeMatch(_ list: [Seleccion]) {
        var listOfmatches: [Match] =  []
        
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
*/

//Creamos el Mundial con todos sus grupos, partidos y sus clasificaciones finales después de jugar la fase de grupos

var Qatar: Mundial = Mundial()
Qatar.createGroups()




