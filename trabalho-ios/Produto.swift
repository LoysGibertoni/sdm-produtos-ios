//
//  Produto.swift
//  trabalho-ios
//
//  Created by pos on 20/09/2019.
//  Copyright © 2019 br.edu.ifsp.scl.sdm. All rights reserved.
//

import Foundation

class Produto {
    
    var nome: String
    var descricao: String
    var preco: Float
    
    init(nome: String, descricao: String, preco: Float) {
        self.nome = nome
        self.descricao = descricao
        self.preco = preco
    }
}
