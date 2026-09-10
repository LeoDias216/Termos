function calcularTotal(preco, qtd) {
    return preco * qtd
}

function gerarCupom(nome, Total) {
    return `== CUPOM FISCAL ==\n= CLIENTE: ${nome} \n= TOTAL A PAGAR: R$${Total.toFixed(2)}`
}

module.exports = {
    calcularTotal,
    gerarCupom
}