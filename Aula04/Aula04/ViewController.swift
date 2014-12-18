//
//  ViewController.swift
//  Aula04
//
//  Created by Diogo Ribeiro de Oliveira on 12/17/14.
//  Copyright (c) 2014 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func abrirTelaDeDetalhe(sender: UIButton) {
        let telaDeDetalheVC = DetalheViewControler()
        self.navigationController?.pushViewController(telaDeDetalheVC, animated: true)
    }

}

