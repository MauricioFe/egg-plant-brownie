//
//  ViewController.swift
//  tabela-dinamica-refeições
//
//  Created by Mauricio Lacerda Santos Fonseca on 17/08/22.
//

import UIKit

class ViewController: UITableViewController {

    //método onde a view foi carregada
    let refeicoes = ["Churros", "Macarrão", "Pizza"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        return celula
    }
    
}

