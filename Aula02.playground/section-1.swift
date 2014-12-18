// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let conta = 20.00

let porcentagemGorjeta = 0.20

let porcentagemImposto = 0.06

let gorjeta = conta * porcentagemGorjeta

let imposto = conta * porcentagemImposto

let total = conta + gorjeta + imposto

var linguagens = ["Python", "Ruby", "Java", "Objective-C"]

linguagens.append("Swift")

linguagens.insert("JavaScript", atIndex: 2)

let indicieJava = find(linguagens,"Java")

if let indicie = indicieJava {
    linguagens.removeAtIndex(indicie)
}

var dicGOT = ["Oberyn":"Lança", "Arya":"Espada", "Ygritte":"Arco"]

dicGOT["Tyrion"] = "Besta"

println(dicGOT)

dicGOT.removeValueForKey("Oberyn")
dicGOT.removeValueForKey("Ygritte")

println(dicGOT)

for i in 1...100{
    if i%5 == 0 && i%3 == 0 {
        println("FizzBuzz")
    } else if i%3 == 0 {
        println("Fizz")
    } else if i%5 == 0 {
        println("Buzz")
    } else {
        println(i)
    }
}



func somar (parcela1 valorA:Int,parcela2 valorB:Int) -> Int{
    return valorA + valorB
}

somar(parcela1: 2,parcela2: 3)

func somaDeMutiplos (multiplo1:Int, multiplo2:Int, max valorMax:Int) -> Int {
    var result = 0
    for i in 1..<valorMax {
        if i%multiplo1 == 0 && i%multiplo2 == 0 {
            result += i
            println("Multiplo de \(multiplo1) e \(multiplo2): \(i) ")
        } else if i%multiplo1 == 0 {
            result += i
            println("Multiplo de \(multiplo1): \(i)")
        } else if i%multiplo2 == 0 {
            result += i
            println("Multiplo de \(multiplo2): \(i)")
        }
    }
    return result
}

somaDeMutiplos(3, 5, max: 1000)


for var i = 10; i > 0 ; --i  { //for decrescente igual ao C
    println(i)
}
