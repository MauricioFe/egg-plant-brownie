//
//  Item.swift
//  eggplant-brownie
//
//  Created by Mauricio Lacerda Santos Fonseca on 16/08/22.
//

import UIKit

class Item: NSObject{
    let nome: String
    let calorias: Double
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }

}
