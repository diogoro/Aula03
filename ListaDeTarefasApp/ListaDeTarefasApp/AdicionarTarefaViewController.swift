//
//  AdicionarTarefaViewController.swift
//  ListaDeTarefasApp
//
//  Created by Diogo Ribeiro de Oliveira on 12/29/14.
//  Copyright (c) 2014 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class AdicionarTarefaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tarefaText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func adicionarTarefa(sender: UIButton) {
        arrayDeTarefas.append(self.tarefaText.text)
        self.tarefaText.text = nil
        self.tarefaText.resignFirstResponder() // comando para retirar o teclado da tela quando o texto do campo for retirado
        /*
        // construcao para apagar destruir a view e voltar para a view anterior se a trasicao for do tipo show (push)
        if let navegation = self.navigationController {
            navegation.popViewControllerAnimated(true)
        }
        */
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })// comando para apagar destruir a view e voltar para a view anterior se a transicao for do tipo apresentar modal

    }
    
    //metodo para quando o botão do return do teclado o metodo adicionar tarefa seja chamado
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("Entrou")
        self.adicionarTarefa(UIButton())
        return true
    }
    
    // metodo para que quando toque em qualquer parte da tela esconda o teclado
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.tarefaText.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
