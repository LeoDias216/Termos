const entrada = require('readline-sync')
let listaVisitantes = []

while (true) {
    let opcao = entrada.question("Deseja cadastrar um visitante? (s/n): ");

    if (opcao.toLowerCase() !== 's') {
        break;
    }

    let nomeVis = entrada.question("Nome do visitante: ");
    let empresaVis = entrada.question("Empresa: ");

    listaVisitantes.push({
        nome: nomeVis,
        empresa: empresaVis
    });

    console.log("✅ Registrado com sucesso!\n");
}

console.log("\n=== VISITANTES DO DIA ===");
for (let i = 0; i < listaVisitantes.length; i++) {
    console.log(`${i + 1}. ${listaVisitantes[i].nome} (${listaVisitantes[i].empresa})`);
}