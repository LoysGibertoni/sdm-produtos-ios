//
//  ViewController.swift
//  trabalho-ios
//
//  Created by pos on 06/09/2019.
//  Copyright © 2019 br.edu.ifsp.scl.sdm. All rights reserved.
//

import UIKit
import CoreData

class ProdutosViewController: UITableViewController {
    
    private var produtos: [Produto]? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        carregarProdutos()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(produtos?.count ?? 0)
        return produtos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let produto = produtos?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
        cell.textLabel?.text = produto?.nome
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalhes" {
            let viewController = segue.destination as! DetalhesViewController
            let produto = produtos?[tableView.indexPathForSelectedRow!.row]
            viewController.produto = produto
        }
    }
    
    private func carregarProdutos() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let requisicao = NSFetchRequest<Produto>(entityName: "Produto")
        let ordenarAZ = NSSortDescriptor(key: "nome", ascending: true)
        requisicao.sortDescriptors = [ordenarAZ]
        
        do {
            produtos = try context.fetch(requisicao)
        } catch {
            let alertController = UIAlertController(title: "Erro", message: "Não foi possível recuperar dados", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true)
        }
    }

}

