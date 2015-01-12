//
//  AdicionaTarefaViewController.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/6/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit
import Realm

class AdicionaTarefaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tituloTarefa: UITextField!
    @IBOutlet weak var descricaoTarefa: UITextField!
    @IBOutlet weak var dataTarefa: UIDatePicker!
    @IBOutlet weak var categoriaTarefa: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissTela(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func salvarTarefa(sender: UIBarButtonItem) {
        
        let realm = RLMRealm.defaultRealm()
        realm.transactionWithBlock { () -> Void in
            let categoria = Categoria()
            categoria.nome = self.categoriaTarefa.text
            let novaTarefa = Tarefa()
            novaTarefa.titulo = self.tituloTarefa.text
            novaTarefa.descricao = self.descricaoTarefa.text
            novaTarefa.data = self.dataTarefa.date
            novaTarefa.categoria = categoria
//            realm.addObject(novaTarefa)
            Tarefa.createOrUpdateInDefaultRealmWithObject(novaTarefa)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.tituloTarefa.resignFirstResponder()
        self.descricaoTarefa.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.salvarTarefa(UIBarButtonItem())
        return true
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
