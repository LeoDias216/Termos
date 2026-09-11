const entrada = require('readline-sync')

console.log("Bem-vindo ao calculador de producao Magnum Graphic")
const pecas = entrada.questionInt("Quantas pecas sua maquina produz por ciclo? ")
for (i = 1; i < 11; i++) {
    console.log(`Ciclo ${i}: ${pecas * i}`)
}