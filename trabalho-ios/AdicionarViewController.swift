//
//  ProdutoViewController.swift
//  trabalho-ios
//
//  Created by pos on 20/09/2019.
//  Copyright © 2019 br.edu.ifsp.scl.sdm. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController {

    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldDescricao: UITextField!
    @IBOutlet weak var textFieldPreco: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func salvarProduto(_ sender: Any) {
        if (validarCampos()) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let produto = Produto(context: context)
            produto.nome = textFieldNome.text
            produto.descricao = textFieldDescricao.text
            produto.preco = Float(textFieldPreco.text!)!
            context.insert(produto)
            
            do {
                try context.save()
                let alertController = UIAlertController(title: "Sucesso", message: "Dados inseridos com sucesso", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default) {
                    (alert) in
                    self.navigationController?.popViewController(animated: true)
                })
                present(alertController, animated: true)
            } catch {
                let alertController = UIAlertController(title: "Erro", message: "Não foi possível inserir dados", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                present(alertController, animated: true)
            }
        }
    }
    
    private func validarCampos() -> Bool {
        var mensagem: String? = nil
        if textFieldNome.text!.isEmpty {
            mensagem = "Preencha o nome"
        } else if textFieldDescricao.text!.isEmpty {
            mensagem = "Preencha a descrição"
        } else if textFieldPreco.text!.isEmpty {
            mensagem = "Preencha o preço"
        }
        
        if mensagem != nil {
            let alertController = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true)
            return false
        } else {
            return true
        }
    }
}
