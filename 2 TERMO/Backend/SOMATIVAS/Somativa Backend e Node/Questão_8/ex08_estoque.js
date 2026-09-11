const entrada = require('readline-sync')

const estoqueMin = 20
let estoque = []

console.log("Bem-vindo ao analista de estoques Magnum Manager")
for (i = 1;i < 4; i++) {
    let nomeInf = entrada.question(`Insira o nome do produto ${i}: `)
    let qtdInf = entrada.questionInt(`Quantidade que voce possui do produto ${i}: `)

    estoque.push({
        Nome: nomeInf,
        Quantidade: qtdInf
    })

    console.log("Produto enviado ao estoque!")
}
console.log("Lista de Produtos:")
for (i = 0; i < estoque.length; i++) {
    console.log(`${i + 1} - ${estoque[i].Nome} | qtd:${estoque[i].Quantidade}`)
    if (estoque[i].Quantidade <= estoqueMin) {
        console.log("Necessario repor estoque")
    } else {
        console.log("Estoque Ok")
    }
}