//
//  ListaUsuarioTableViewController.swift
//  InstaBalada
//
//  Created by Diogo Ribeiro de Oliveira on 1/19/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ListaUsuarioTableViewController: UITableViewController {

    var listaUsuarios: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFUser.query()
        query.findObjectsInBackgroundWithBlock { (usuarios:[AnyObject]!, erro:NSError!) -> Void in
            for usuario in usuarios {
                let usuarioLogado = PFUser.currentUser()
                let umUsuario = usuario as PFUser
//                println("usuarioLogado: \(usuarioLogado.username) e umUsuario: \(umUsuario.username)")
                if usuarioLogado != nil {
                    if umUsuario.username != usuarioLogado.username {
                            self.listaUsuarios.append(umUsuario)
                    }
                } else {
                    let alerta = UIAlertView(title: "Falha", message: "Usuário não logado", delegate: nil, cancelButtonTitle: "Fechar")
                }
            }
//            for usuario in self.listaUsuarios {
//                let usr = usuario as PFUser
//                println(usr)
//            }
        self.tableView.reloadData()
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.listaUsuarios.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celulaUsuario", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
//        println("Entrando no método cellForRow")
        let linha = indexPath.row
//        println(linha)
        let usuario = self.listaUsuarios[indexPath.row] as PFUser
//        println(usuario)
        cell.textLabel?.text = usuario.username
//        println(self.listaUsuarios[indexPath.row])
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let celulaSelecionada = self.tableView.cellForRowAtIndexPath(indexPath)!
        
        if celulaSelecionada.accessoryType == UITableViewCellAccessoryType.Checkmark {
            celulaSelecionada.accessoryType = UITableViewCellAccessoryType.None
            
            let query = PFQuery()
            query.whereKey("usuarioOrigem", equalTo: PFUser.currentUser().username)
            query.whereKey("usuarioDestino", equalTo: celulaSelecionada.textLabel?.text)
            println("Iniciando o bloco da pesquisa")
            query.findObjectsInBackgroundWithBlock({ (usuarios:[AnyObject]!, erro:NSError!) -> Void in
                for usuario in usuarios {
                    println("Usuarios: \(usuario)")
                    if usuario.delete() {
                        let alerta = UIAlertView(title: "Sucesso", message: "Você não está mais seguindo", delegate: nil, cancelButtonTitle: "Fechar")
                        alerta.show()
                    }
                }
            })
            
        } else {
            celulaSelecionada.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            let novaEntrada = PFObject(className: "timeline")
            novaEntrada["usuarioOrigem"] = PFUser.currentUser().username
            novaEntrada["usuarioDestino"] = celulaSelecionada.textLabel?.text
            novaEntrada.saveInBackgroundWithBlock({ (sucesso:Bool, erro:NSError!) -> Void in
                let alerta = UIAlertView(title: "Sucesso", message: "Você está seguindo", delegate: nil, cancelButtonTitle: "Fechar")
                alerta.show()
            })
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
