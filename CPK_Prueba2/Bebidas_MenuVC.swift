//
//  Bebidas_MenuVC.swift
//  CPK_Prueba2
//
//  Created by desarm on 10/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import uikit

class Bebidas_MenuVC: UIViewController {
    
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
                self.performSegueWithIdentifier("Segue_Especialidades_Return", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_BebidasSinAlcohol", sender: self)
            default: break
            }
        }
    }
}
