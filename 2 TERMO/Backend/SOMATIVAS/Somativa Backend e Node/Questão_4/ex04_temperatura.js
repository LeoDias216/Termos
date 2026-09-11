const entrada = require('readline-sync')

console.log("Bem-vindo ao classificador de temperatura Magnum Hot")
const temperatura = entrada.questionFloat("Digite a temperatura da maquina: ")
if (temperatura <= 60) {
    console.log(`A temperatura de ${temperatura}°C esta normal`)
} else if (temperatura >= 61 && temperatura <= 80) {
    console.log(`A temperatura de ${temperatura}°C deve ter Atencao!`)
} else {
    console.log(`Atencao! A temperatura de ${temperatura}°C esta Critica!`)
}