//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Mauricio Lacerda Santos Fonseca on 22/08/22.
//

import UIKit

protocol AdicionaItensDelegate{
    func add(_ item: Item)
}
class AdicionarItensViewController: UIViewController {

    //MARK: - Atributes
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - View LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBAction
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else{return}
        guard let numeroDeCalorias = Double(calorias) else{return}
        let item = Item(nome: nome, calorias: numeroDeCalorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
}
