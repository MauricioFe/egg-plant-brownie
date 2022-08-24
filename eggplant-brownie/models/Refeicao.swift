//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Mauricio Lacerda Santos Fonseca on 16/08/22.
//

import UIKit
class Refeicao: NSObject {
    let nome: String
    let felicidade: Int
    let itens: Array<Item>

    init(nome: String, felicidade: Int, itens: [Item] = []){
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func totalDeCalorias() -> Double{
        var total = 0.0
        for item in itens{
            total += item.calorias
        }
        return total
    }
}

