//
//  Categoria.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/11/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Realm

class Categoria: RLMObject {
    dynamic var nome = ""
    
    override class func primaryKey() -> String! {
        return "nome"
    }
}
