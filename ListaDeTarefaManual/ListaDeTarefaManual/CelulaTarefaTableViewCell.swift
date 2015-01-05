//
//  CelulaTarefaTableViewCell.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/5/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class CelulaTarefaTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloTarefa: UILabel!
    @IBOutlet weak var descricaoTarefa: UILabel!
    @IBOutlet weak var dataTarefa: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
