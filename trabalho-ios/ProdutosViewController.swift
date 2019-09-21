//
//  ViewController.swift
//  trabalho-ios
//
//  Created by pos on 06/09/2019.
//  Copyright © 2019 br.edu.ifsp.scl.sdm. All rights reserved.
//

import UIKit

class ProdutosViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}

