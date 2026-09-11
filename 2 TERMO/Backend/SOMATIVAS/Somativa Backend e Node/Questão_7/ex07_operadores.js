const entrada = require('readline-sync')

let operadores = []

console.log("Bem-vindo ao cadastro de operarios Magnum Job")
for (i = 1; i < 6; i++) {
    let nome = entrada.question(`Digite seu nome, operador ${i}: `)

    operadores.push ({
        Operador: nome
    })

    console.log("Nome registrado!")
}
console.log("Operadores Registrados:")
for (i = 0; i < operadores.length; i++) {
    console.log(`${i + 1} - ${operadores[i].Operador}`)
}