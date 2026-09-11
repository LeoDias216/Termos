const entrada = require('readline-sync')

total = 0

console.log("Bem-vindo ao calculador de medias Magnum Calculator")
for (i = 1; i < 6; i++) {
    total+= entrada.questionFloat(`Insira a medicao numero ${i}: `)
}
console.log(`A medicao total é de ${total.toFixed(2)} e a media e de ${(total / 5).toFixed(2)}`)