const entrada = require('readline-sync')

let pecasDefeituosas = []

const qtdpecas = entrada.questionInt("Quantas pecas defeituosas foram encontradas? ")

for (let i = 0; i < qtdpecas; i++) {
    let serie = entrada.question(`Digite o numero de serie da peca ${i+1}: `)
    pecasDefeituosas.push(serie)
}

console.log("== RELATORIO DE PECAS DEFEITUOSAS ==")
console.log(`Total de pecas: ${pecasDefeituosas.lenght}`)
console.log(`Numeros de serie: ${pecasDefeituosas.join(" | ")}`)