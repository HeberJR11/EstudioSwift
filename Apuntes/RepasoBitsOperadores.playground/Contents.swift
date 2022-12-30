import UIKit

/*
 - Un bit almacena un 1 o 0
 - Un byte almacena 8-bits (ob0000_0000 -> 0b1111_1111)
 - Los bytes tienen signo pero existen los bytes isn signo
 - Con signo el bit mas a la izquierda inidca el signo(0-positivo, 1-negativo). Los bits negativos se invierten (0-negativo, 1-positivo)
 - Sin signo: Podemos usar UInt<8, 16, 32, 64> en lugar de los Int<8, 16, 32, 64>
 */

//Cual seria el numero 73?
// 73:[0]1001001 : 01001001
// -73: [1]0110110: 10110110


let a: UInt8 = 0b00001100 // 12
let b: UInt8 = 0b00010011 //19

let c1 = a+b
print(c1)
//Suma binaria (bit por bit, para evitar overFlow<desbordameinto de bits>)
let c2 = a &+ b
print(c2)

//Problema de overflow
let a1: UInt8 = 0b10000100 // 12
let b1: UInt8 = 0b10010011 //19
//             ------------
//                  0100111

let c3 = a+b
print(c1)
//Suma binaria (bit por bit, para evitar overFlow<desbordameinto de bits>)
let c4 = a &+ b
print(c2)

// Sobreescritura de operadores

struct Producto {
    let id: Int
    let nombre: String
}

