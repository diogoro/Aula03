//
//  ViewController.swift
//  Aula04Exercicio
//
//  Created by Diogo Ribeiro de Oliveira on 12/22/14.
//  Copyright (c) 2014 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let margemEsquerda:CGFloat = 10.0
    let margemDireita:CGFloat = 10.0
    let margemEntreImagens:CGFloat = 10.0
    
    let listaDeImagens = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    let imagem0:UIImageView! = UIImageView()
    let imagem1:UIImageView! = UIImageView()
    let imagem2:UIImageView! = UIImageView()
    var ultimosSorteados:[Int] = [0, 0, 0]
    let labelResutado = UILabel(frame: CGRectMake(30, 220, 170, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Minha Tela de Cartas"
        self.view.backgroundColor = UIColor.blueColor()
        self.labelResutado.text = "As cartas são iguais"
        self.labelResutado.backgroundColor = UIColor.greenColor()
        self.labelResutado.hidden = true
        self.view.addSubview(labelResutado)
        construirTela()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func construirTela() {
        self.imagem0.frame = CGRectMake(margemEsquerda, 100, 100, 100)
        self.imagem0.image = UIImage(named: "Ace")
        self.view.addSubview(imagem0)
        
        self.imagem2.frame = CGRectMake(self.view.frame.width - margemDireita - 100, 100, 100, 100)
        self.imagem2.image = UIImage(named: "Ace")
        self.view.addSubview(imagem2)
        
        self.imagem1.frame = CGRectMake(self.imagem0.frame.width + margemEsquerda + margemEntreImagens, 100, 100, 100)
        // self.imagem1.center = (self.imagem0.center + self.imagem2.center) Olhar como fazer essa ideia
        self.imagem1.image = UIImage(named: "Ace")
        self.view.addSubview(imagem1)
        
        let botao = UIButton.buttonWithType(UIButtonType.System) as UIButton
        botao.frame = CGRectMake(10, 100, 100, 44)
        botao.setTitle("Mudar Cartas", forState: UIControlState.Normal)
        botao.backgroundColor = UIColor.greenColor()
        botao.center = self.view.center
        botao.addTarget(self, action: "mudarImagens", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(botao)
        
    }
    
    func mudarImagens() {
        var posicaoSorteada:Int = 0
        for i in 0...2 {
            do{
                posicaoSorteada = Int(arc4random_uniform(13))
            } while posicaoSorteada == ultimosSorteados[i]
            ultimosSorteados[i] = posicaoSorteada
        }
        self.imagem0.image = UIImage(named: listaDeImagens[ultimosSorteados[0]])
        self.imagem1.image = UIImage(named: listaDeImagens[ultimosSorteados[1]])
        self.imagem2.image = UIImage(named: listaDeImagens[ultimosSorteados[2]])
        
        if(ultimosSorteados[0] == ultimosSorteados[1] && ultimosSorteados[0] == ultimosSorteados[2]) {
            self.labelResutado.hidden = false
        }

    }

}

