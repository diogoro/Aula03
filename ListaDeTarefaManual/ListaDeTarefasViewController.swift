//
//  ListaDeTarefasViewController.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/5/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit
import Realm

class ListaDeTarefasViewController: UIViewController, UITableViewDataSource {
    
    var arrayTarefas:RLMResults { // retorna todos os objetos da tabela
        get{
           return Tarefa.allObjects().sortedResultsUsingProperty("posicao", ascending: true)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //Int(Categoria.allObjects().count)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(self.arrayTarefas.count) // necessario fazer o typeCast
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let categoria = Categoria.allObjects()[UInt(section)] as Categoria
//        return categoria.nome
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let minhaCell = tableView.dequeueReusableCellWithIdentifier("minhaCelula") as CelulaTarefaTableViewCell
        
        let minhaTarefa = arrayTarefas[UInt(indexPath.row)] as Tarefa
        
        minhaCell.showsReorderControl = true //Habilita as celulas para ordenação
        
        //converter NSDate para NSString
        var formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM - hh:mm"
        var dataString = formatter.stringFromDate(minhaTarefa.data)
//        println("Data em string: \(dataString)")
        
        minhaCell.tituloTarefa.text = minhaTarefa.titulo
        minhaCell.descricaoTarefa.text = minhaTarefa.descricao
        minhaCell.dataTarefa.text = dataString
        

        minhaCell.backgroundColor = getRandomColor()
        return minhaCell
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        println("IndexPath origem \(sourceIndexPath.row), indexPath destino \(destinationIndexPath.row)")
        
        let posicaoDestino = destinationIndexPath.row
        let posicaoOrigem = sourceIndexPath.row
        let realm = RLMRealm.defaultRealm()
        realm.transactionWithBlock { () -> Void in
            let tarefaAlterada = self.arrayTarefas[UInt(posicaoOrigem)] as Tarefa
            tarefaAlterada.posicao = posicaoDestino
            if posicaoDestino > posicaoOrigem {
                for i in posicaoOrigem+1...posicaoDestino {
//                    println("Numero i: \(i)")
                    let tarefa = self.arrayTarefas[UInt(i)] as Tarefa
//                    println("Tarefa: \(tarefa.titulo) posicao: \(tarefa.posicao)")
                    tarefa.posicao = i-1
//                    println("Tarefa apos alteracao: \(tarefa.titulo) posicao: \(tarefa.posicao)")
                }
            } else if posicaoDestino < posicaoOrigem {
                for i in posicaoDestino...posicaoOrigem-1 {
//                    println("Numero i: \(i)")
                    let tarefa = self.arrayTarefas[UInt(i)] as Tarefa
                    tarefa.posicao = i+1
                }
            }
        }
        
    }
    
    @IBAction func editandoTabela(sender: UIBarButtonItem) {
        
        if self.tableView.editing {
           self.tableView.editing = false
        } else {
            self.tableView.editing = true
        }
        
    }
    /*
        Quando for deletar da tabela tem que deletar do banco de dados e vice-versa
    */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let realm = RLMRealm.defaultRealm()
        realm.transactionWithBlock { () -> Void in
            let tarefaDel = self.arrayTarefas[UInt(indexPath.row)] as Tarefa
            realm.deleteObject(tarefaDel)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        }
        
        
    }
    /*
        CanEditRowAtIndexPath serve para dizer qual célula pode ser editada ou não. Baseado no IndexPath passada
    */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        if indexPath.row == 0 {
//            return false
//        }
        
        return true
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
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
