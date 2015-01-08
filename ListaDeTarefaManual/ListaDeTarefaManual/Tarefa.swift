//
//  Tarefa.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/5/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Realm

class Tarefa: RLMObject {
    dynamic var titulo = ""
    dynamic var descricao = ""
    dynamic var data = NSDate()
}
