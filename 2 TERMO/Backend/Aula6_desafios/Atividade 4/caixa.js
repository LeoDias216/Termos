const entrada = require('readline-sync')
const calculos = require('./calculosVenda')

let Total = 0
const nome = entrada.question("Insira seu nome: ")

let escolha = -1

while (escolha !== 0) {
    
    console.log("|   MERCADINHO DO PIERRE 🛎️    |")
    console.log("|1- Cenoura🥕      - R$2.00   |")
    console.log("|2- Alface🥬       - R$7.00   |")
    console.log("|3- Tomate🍅       - R$3.00   |")
    console.log("|4- Pimenta🌶️       - R$4.00   |")
    console.log("|5- Berinjela🍆    - R$8.00   |")
    console.log("|• Digite 0 para finalizar ✅ |")
    console.log(`🛒 Total no carrinho: R$${Total.toFixed(2)}`)

    escolha = entrada.questionInt("Digite o numero do que deseja: ")
    let qtd = 0

    if (escolha === 1) {
        console.log("Voce escolheu comprar Cenoura")
        qtd = entrada.questionFloat("Quantas deseja levar? ")
        Total += calculos.calcularTotal(2.00, qtd)
    } else if (escolha === 2) {
        console.log("Voce escolheu comprar Alface")
        qtd = entrada.questionFloat("Quantos deseja levar? ")
        Total += calculos.calcularTotal(7.00, qtd)
    } else if (escolha === 3) {
        console.log("Voce escolheu comprar Tomate")
        qtd = entrada.questionFloat("Quantos deseja levar? ")
        Total += calculos.calcularTotal(3.00, qtd)
    } else if (escolha === 4) {
        console.log("Voce escolheu comprar Pimenta")
        qtd = entrada.questionFloat("Quantas deseja levar? ")
        Total += calculos.calcularTotal(4.00, qtd)
    } else if (escolha === 5) {
        console.log("Voce escolheu comprar Berinjela")
        qtd = entrada.questionFloat("Quantas deseja levar? ")
        Total += calculos.calcularTotal(8.00, qtd)
    } else if (escolha === 0) {
        console.log(calculos.gerarCupom(nome, Total))
        break
    } else {
        console.log("Valor invalido...")
    }
}