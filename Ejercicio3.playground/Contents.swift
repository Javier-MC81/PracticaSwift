import UIKit

//Ejercicio 3

var players: [String] = ["Vinicius", "Messi", "Ronaldo", "Pedri", "Mbappe","Modric", "Militao", "Morata", "Valverde", "Benzema", "Piqué"]

var vocales: [Character] = ["a", "e", "i", "o", "u"]

var jugadoresFiltrados = players.filter { player in
    var contVocal: Int = 0
    var playerVocal: Bool = false
    //Comparo las vocales de cada jugador con la lista de vocales y llevo la cuenta de las vocales
    return player.contains { char in
            
            if vocales.contains(char) && contVocal < 3 {
                contVocal += 1
                
            }
            if contVocal >= 3 { // Cuando la cuenta llega a 3, se incluye en la nueva lista de jugadores
            playerVocal = true
            
            } else {
            playerVocal
            }
            return playerVocal
            }

}
print(jugadoresFiltrados)
