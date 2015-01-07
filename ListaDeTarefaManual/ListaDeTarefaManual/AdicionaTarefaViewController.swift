//
//  AdicionaTarefaViewController.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/6/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class AdicionaTarefaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tituloTarefa: UITextField!
    @IBOutlet weak var descricaoTarefa: UITextField!
    @IBOutlet weak var dataTarefa: UIDatePicker!
    
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
        let titulo = self.tituloTarefa.text
        let descricao = self.descricaoTarefa.text
        let data = self.dataTarefa.date
        
        //converter NSDate para NSString
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dataString = formatter.stringFromDate(NSDate())

        let tarefa = Tarefa(titulo: titulo, descricao: descricao, data: dataString)
        arrayTarefas.append(tarefa)
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
