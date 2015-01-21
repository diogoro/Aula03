//
//  ViewController.swift
//  InstaBalada
//
//  Created by Diogo Ribeiro de Oliveira on 1/14/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    @IBOutlet weak var imagemSeleciona: UIImageView!
    
    func signUpViewController(signUpController: PFSignUpViewController!, shouldBeginSignUp info: [NSObject : AnyObject]!) -> Bool {
        let dados = info as Dictionary
        var dadosCompletos = true
        println("ENtrou no should signUP")
        for (chave,valor) in dados {
            if let campo =  dados[chave] as? NSString {
                if campo.length == 0 {
                    println("If tamanho")
                    dadosCompletos = false
                }
            }
        }
       
        if !dadosCompletos {
            let  alerta = UIAlertView(title: "Falha", message: "Preencha os campos para se cadastrar", delegate: nil, cancelButtonTitle: "Fechar")
            alerta.show()
            
            return false
        }
        
        return true
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didFailToSignUpWithError error: NSError!) {
        println("Erro \(error)")
    }

    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
//        println("Entrou no shouldBeginLoginInWithUsername")
        println("username: \(username) e password: \(password)")
        if username == "" || password == "" {
                println("Entrou no if")
            let alerta = UIAlertView (title: "Falha", message: "Preencha os campos username e password", delegate: nil, cancelButtonTitle: "Fechar")
            alerta.show()

            return false
        }
        
        return true
    }
    
    func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!) {
        println("Erro \(error)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // se usuario já logado entrar no app, caso contraário mostrar tela de login
        if PFUser.currentUser() != nil {
            println("Usuário já logado. \(PFUser.currentUser())")
            
            let alertaSucesso = UIAlertView(title: "Sucesso", message: "Usuário logado com sucesso", delegate: nil, cancelButtonTitle: "Fechar")
            alertaSucesso.show()
        
        } else {
            
            let loginViewControler = PFLogInViewController()
            let cadastrarViewControler = PFSignUpViewController()
            
            loginViewControler.signUpController = cadastrarViewControler // diz ao controle do signUp da tela de login quem é o controle
            
            loginViewControler.fields = PFLogInFields.Facebook |
                PFLogInFields.Twitter |
                PFLogInFields.UsernameAndPassword |
                PFLogInFields.PasswordForgotten |
                PFLogInFields.LogInButton |
                PFLogInFields.SignUpButton
            
            loginViewControler.delegate = self
            cadastrarViewControler.delegate = self
            
            self.presentViewController(loginViewControler, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mostrarCamera(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }

        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("Entrou no método")
        self.imagemSeleciona.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }


}

