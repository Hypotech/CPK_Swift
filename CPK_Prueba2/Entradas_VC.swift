//
//  Entradas_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 23/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class Entradas_VC:UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gestoIzquierda = UISwipeGestureRecognizer(target: self, action: "gestoManejador:") //notar los dos puntos al final de gestoManejador
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        
        var gestoDerecha = UISwipeGestureRecognizer(target: self, action: "gestoManejador:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(gestoIzquierda)
        self.view.addGestureRecognizer(gestoDerecha)
        
    }
    
    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gestoManejador(send: UIGestureRecognizer){
        
        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Menu_Return", sender: self)
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("Segue_Menu_Return", sender: self)
            default: break
            }
        }
    }
}