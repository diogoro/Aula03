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
           return Tarefa.allObjects()
        }
    }
    
    var arrayTarefasC2: RLMResults {
        get{
            return Tarefa.objectsWhere("categoria == 'c2'")
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
        return Int(Categoria.allObjects().count)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(self.arrayTarefas.count) // necessario fazer o typeCast
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categoria = Categoria.allObjects()[UInt(section)] as Categoria
        return categoria.nome
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let minhaCell = tableView.dequeueReusableCellWithIdentifier("minhaCelula") as CelulaTarefaTableViewCell
        
        let minhaTarefa = arrayTarefas[UInt(indexPath.row)] as Tarefa
        
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
