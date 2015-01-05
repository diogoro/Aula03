//
//  ListaDeTarefasViewController.swift
//  ListaDeTarefaManual
//
//  Created by Diogo Ribeiro de Oliveira on 1/5/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ListaDeTarefasViewController: UIViewController, UITableViewDataSource {

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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let minhaCell = tableView.dequeueReusableCellWithIdentifier("minhaCelula") as CelulaTarefaTableViewCell
        
        minhaCell.tituloTarefa.text = "Tarefa 1"
        minhaCell.descricaoTarefa.text = "Realizar tarefa 1"
        minhaCell.dataTarefa.text = "05/01/2015"
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
