//
//  ViewController.swift
//  Aula03
//
//  Created by Diogo Ribeiro de Oliveira on 12/15/14.
//  Copyright (c) 2014 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSaudacao: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var textSaudacao: UITextField!
    
    @IBOutlet weak var textNome: UITextField!
    
    @IBOutlet weak var botao: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func modificarLabel(sender: UIButton) {
        labelSaudacao.hidden = false
        labelNome.hidden = false
        labelSaudacao.text = textSaudacao.text
        labelNome.text = textNome.text
        textNome.text = ""
        textSaudacao.text = ""
        textSaudacao.resignFirstResponder()
        textNome.resignFirstResponder()
        
        labelNome.textColor = UIColor(red: 0.7, green: 0.5, blue: 0.8, alpha: 1.0)
        
        //mudar o nome do botao
        botao.setTitle("Modificar :P", forState: UIControlState.Normal)
        botao.setTitle("Modificar Precionado", forState: UIControlState.Highlighted)
    }

}

