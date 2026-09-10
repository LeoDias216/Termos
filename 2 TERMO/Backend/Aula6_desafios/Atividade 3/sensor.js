function checarTemperatura(temperatura) {
    if (temperatura <= 40) {
        return("Temperatura estável")
    } else {
        return("ALERTA: Caldeira Superaquecida!")
    }
}

function checarUmidade(umidade) {
    if (umidade >= 20) {
        return("Umidade em niveis agradaveis")
    } else {
        return("ALERTA: Ar muito seco!")
    }
}

module.exports = {
    checarTemperatura,
    checarUmidade
}