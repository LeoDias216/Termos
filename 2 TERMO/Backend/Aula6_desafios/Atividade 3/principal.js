const entrada = require('readline-sync')
const sensores = require('./sensor')

console.log("== SETOR DE SEGURANCA - BEM-VINDO! ==")

const temperaturaAtual = entrada.questionFloat("Insira a temperatura atual: ")
console.log(sensores.checarTemperatura(temperaturaAtual))

const umidadeAtual = entrada.questionFloat("Insira a umidade do ar atual: ")
console.log(sensores.checarUmidade(umidadeAtual))