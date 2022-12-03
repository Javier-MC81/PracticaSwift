import UIKit

// Ejercicio 1

var lista: [Int] = []
for number in 1...555 {
  
    if (number > 1 && lista.count < 100) {

        var cont: Int = 0
        var i: Int = 2
        
        while ( i<number && cont == 0 ) {
            
            var resto: Int = number%i
            if resto == 0 {
                cont += 1
                
            }
            i += 1
        }
        if cont == 0 {
            lista.append(number)
            
        }
    }

}
lista.count
print(lista)

var listaInversa: [Int] = lista.reversed()

for (index,prime) in listaInversa.enumerated() {
    
    if (index < 10) {
       print(prime)
    }
    
}

// Ejercicio 2

var sum: Int = 0
for (index,prime) in lista.enumerated() {
    
    if (index < 50) {
       sum += prime
    }
 
}
print(sum)
