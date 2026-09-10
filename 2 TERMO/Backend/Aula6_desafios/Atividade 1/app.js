const entrada = require('readline-sync')
const conversor = require('./conversor')

console.log("=== CONVERSOR DE MOEDAS MAGNUM ENTERPRISES ===")

const valorDolar = entrada.questionFloat("Digite quantos dolares deseja converter: ")

const valorConvertido = conversor.converterMoeda(valorDolar)

console.log(`Voce tem $${valorDolar} dolares, ou R$${valorConvertido} reais.`)