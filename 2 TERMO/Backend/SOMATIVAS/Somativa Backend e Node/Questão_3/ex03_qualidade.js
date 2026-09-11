const entrada = require('readline-sync')

console.log("Bem-vindo ao medidor de pecas Magnum Precise")
const peca = entrada.questionFloat("Insira o peso da sua peca: ")
if (peca >= 95 && peca <= 105) {
    console.log(`A peca de peso ${peca} esta Aprovada!`)
} else {
    console.log(`A peca de peso ${peca} esta Reprovada :(`)
}