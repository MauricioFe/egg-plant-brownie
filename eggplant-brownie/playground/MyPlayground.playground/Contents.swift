import UIKit

class Refeicao{
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    var bacon = Array<Item>()

    init(nome: String, felicidade: String){
        self.nome = nome
        self.felicidade = nome
    }
    
    func totalDeCalorias() -> Double{
        var total = 0.0
        for item in itens{
            total += item.calorias
        }
        return total
    }
}

class Item{
    var nome: String
    var calorias: Double
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}


let refeicao =  Refeicao(nome: "almoço", felicidade: "5")
let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 90.0)
let contraFile = Item(nome: "Contra Filé", calorias: 287.0)


refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)
