//
//  AppDelegate.swift
//  InstaBalada
//
//  Created by Diogo Ribeiro de Oliveira on 1/14/15.
//  Copyright (c) 2015 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setApplicationId("OcT3hQI0aI80mtJDhfsTELifZki8CoGBhschNvIl", clientKey: "k8SOYMKxIpQmuIwgaR85uz8aOwYdhc5HoRNPJYRU")
        //Exemplo de codigo usando o Parse para inserir, consultar e criar tabela
//        let foto = PFObject(className: "Foto")
//        foto.setObject("Uma foto", forKey: "titulo")
//        foto.setObject("Descricao", forKey: "descricao")
//        foto.setObject("14/01/2015", forKey: "data")
//        
//        foto.saveInBackgroundWithBlock { (sucesso, erro) -> Void in
//            if sucesso == true {
//                println("Foto salva com sucesso")
//            } else {
//                println(erro)
//            }
//        }
//        println("Esse print deve ser por ultimo")
//        println()
//
//        let query = PFQuery(className: "Foto")
//        query.getObjectInBackgroundWithId("uB4kgh9nXl", block: { (foto, erro) -> Void in
//            if let aFoto = foto{
//                aFoto.setObject("Outra Descricao", forKey: "descricao")
//                aFoto["data"] = "19/01/2015"
//                aFoto.save()
//            }
//        })
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

