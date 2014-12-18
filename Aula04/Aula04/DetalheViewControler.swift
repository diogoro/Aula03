//
//  DetalheViewControler.swift
//  Aula04
//
//  Created by Diogo Ribeiro de Oliveira on 12/17/14.
//  Copyright (c) 2014 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class DetalheViewControler : UIViewController {
    
    let listaDeImagens = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    let margemDireita:CGFloat = 20.0
    var ultimoIndiceSorteado = 0
    let minhaImagem:UIImageView! = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("View carregada")
        
        self.title = "Minha Tela de Detalhe"
        self.view.backgroundColor = UIColor.blueColor()
        var minhaLabel = UILabel()
        minhaLabel.text = "Minha Label Nova "
        minhaLabel.frame = CGRectMake(25, 200, 100	, 100)
        minhaLabel.backgroundColor = UIColor.greenColor()
        self.view.addSubview(minhaLabel)
        
        construirTela()
    }
    
    func construirTela() {
        // fazer frame
        self.minhaImagem.frame = CGRectMake(self.view.frame.width - margemDireita - 100, 100, 100, 100)
        self.minhaImagem.image = UIImage(named:"Ace")
        self.view.addSubview(minhaImagem)
        
        let botao = UIButton.buttonWithType(UIButtonType.System) as UIButton
        botao.frame = CGRectMake(10, 100, 100, 44)
        botao.setTitle("Mudar Carta", forState: UIControlState.Normal)
        botao.backgroundColor = UIColor.greenColor()
        botao.center = self.view.center
        botao.addTarget(self, action: "mudarImagem", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(botao)
    }
    
    func mudarImagem() {
        var posicaoSorteada = 0
        do{
            posicaoSorteada = Int(arc4random_uniform(13))
        } while posicaoSorteada == ultimoIndiceSorteado
        ultimoIndiceSorteado = posicaoSorteada
        self.minhaImagem.image = UIImage(named: listaDeImagens[ultimoIndiceSorteado])
        var label = self.view.viewWithTag(20) as UILabel // pegar a label pela tag 20
        label.text = listaDeImagens[ultimoIndiceSorteado]
    }
    
}
