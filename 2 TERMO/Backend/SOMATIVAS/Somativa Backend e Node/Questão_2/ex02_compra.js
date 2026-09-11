const entrada = require('readline-sync')

console.log("== Bem-vindo ao varejo Magnum Economic ==")
const material = entrada.question("Qual o nome do material que deseja comprar? ")
const qtd = entrada.questionInt("Qual a quantidade? ")
const preco = entrada.questionFloat("Qual o preco dele? ")
const total = qtd * preco
console.log("==== CUPOM FISCAL ====")
console.log(`Nome do material: ${material}`)
console.log(`Quantidade comprada: ${qtd}`)
console.log(`Preco individual: ${preco.toFixed(2)}`)
console.log("======================")
console.log(`Total a pagar: ${total.toFixed(2)}`)