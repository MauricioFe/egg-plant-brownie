//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Mauricio Lacerda Santos Fonseca on 18/08/22.
//

import UIKit


class RefeicoesTableViewController: UITableViewController, ViewControllerDelegate{
    var refeicoes = [Refeicao(nome:"Macarrão", felicidade:4), Refeicao(nome:"Pizza", felicidade:4), Refeicao(nome:"Comida Japonesa", felicidade:4)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        cell.textLabel?.text = refeicao.nome
        
        return cell
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }
}
