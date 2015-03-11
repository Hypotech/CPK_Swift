//
//  Pizzas_Menu.swift
//  CPK_Prueba2
//
//  Created by desarm on 06/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIkit

class Pizzas_Menu_VC:UIViewController{
    
    @IBAction func IrAMenu(){
        self.performSegueWithIdentifier("Segue_Menu_Return", sender: self)
    }
    
    override func viewDidLoad() {
        var gestoIzquierda = UISwipeGestureRecognizer(target: self, action: "gestoManejador:") //notar los dos puntos al final de gestoManejador
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        
        var gestoDerecha = UISwipeGestureRecognizer(target: self, action: "gestoManejador:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(gestoIzquierda)
        self.view.addGestureRecognizer(gestoDerecha)
        
        super.viewDidLoad()
    }
    
    override func prefersStatusBarHidden() -> Bool { //ocultar barra de status
        return true
    }
    
    @IBAction func gestoManejador(send: UIGestureRecognizer){
        
        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("Segue_Pastas_Return", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Pizza_Thin_Crust", sender: self)
            default: break
            }
        }
    }
}