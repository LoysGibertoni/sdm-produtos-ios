//
//  DetalhesViewController.swift
//  trabalho-ios
//
//  Created by pos on 20/09/2019.
//  Copyright © 2019 br.edu.ifsp.scl.sdm. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var produto: Produto? = nil

    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelDescricao: UITextView!
    @IBOutlet weak var labelPreco: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelNome?.text = produto?.nome
        labelDescricao?.text = produto?.descricao
        labelPreco?.text = "R$ \(produto?.preco ?? 0)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
