const entrada = require('readline-sync')

function calcularEficiencia(real,prevista) {
    percentual = (real / prevista) * 100
    return percentual
}

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return "Meta atingida!"
    } else if (percentual >= 70 && percentual <= 89.99) {
        return "Atencao!"
    } else {
        return "Abaixo da Meta!"
    }
}

console.log("Bem-vindo ao calculador de eficiencia Magnum Statistcs")

const Real = entrada.questionFloat("Qual e o valor da producao real? ")
const Prevista = entrada.questionFloat("Qual o valor da producao prevista? ")

const Percentual = calcularEficiencia(Real,Prevista)
const meta = classificarEficiencia(percentual)

console.log(`Producao real: ${Real}`)
console.log(`Producao prevista: ${Prevista}`)
console.log(`Porcentagem: ${Percentual}% e ${meta}`)