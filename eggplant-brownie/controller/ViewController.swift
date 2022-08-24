//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Mauricio Lacerda Santos Fonseca on 11/08/22.
//

import UIKit
//Equivalente a uma inteface
protocol ViewControllerDelegate{
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate,
                      AdicionaItensDelegate
{

    
    //MARK: - Atributos
    var delegate: ViewControllerDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                         Item(nome:"Queijo", calorias: 40.0),
                         Item(nome: "Molho apimentado", calorias: 40.0),
                         Item(nome:"Manjericão", calorias: 40.0)]
    
    var itensSelcicionados: [Item] = []
    
    //MARK: - IBOutlets
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet var nomeTextField: UITextField?
    
    @IBOutlet weak var itensTableView: UITableView!
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = itens[indexPath.row].nome
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType == .none{
            cell.accessoryType = .checkmark
            itensSelcicionados.append(itens[indexPath.row])
        }else{
            cell.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelcicionados.firstIndex(of: item){
                itensSelcicionados.remove(at: position)
            }
        }
    }
    //MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelcicionados)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: -VIEW Life cycle
    
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    @objc func adicionarItem(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
}

