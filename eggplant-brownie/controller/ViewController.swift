//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Mauricio Lacerda Santos Fonseca on 11/08/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet var nomeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
    }
}

