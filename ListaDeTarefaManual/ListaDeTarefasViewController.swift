//
//  ListaDeTarefasViewController.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/5/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ListaDeTarefasViewController: UIViewController, UITableViewDataSource {

    var arrayTarefas:[Tarefa] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tarefa1 = Tarefa(titulo: "Estudar IOS", descricao: "Assunto: TableView", data: "05/01/2015")
        self.arrayTarefas.append(tarefa1)
        
        let tarefa2 = Tarefa(titulo: "Fazer pizza", descricao: "", data: "05/01/2015")
        self.arrayTarefas.append(tarefa2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTarefas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let minhaCell = tableView.dequeueReusableCellWithIdentifier("minhaCelula") as CelulaTarefaTableViewCell
        
        let minhaTarefa = arrayTarefas[indexPath.row]
        
        minhaCell.tituloTarefa.text = minhaTarefa.titulo
        minhaCell.descricaoTarefa.text = minhaTarefa.descricao
        minhaCell.dataTarefa.text = minhaTarefa.data
        return minhaCell
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
