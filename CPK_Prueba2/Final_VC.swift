//
//  Final_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 10/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIkit

class Final_VC:UIViewController{
    @IBOutlet weak var lbl_textFinal: UILabel!
    
    
    override func viewDidLoad() {
        lbl_textFinal.text = "Precios en moneda nacional \n\"Consumir carnes, aves, pescado, mariscos, huevos crudos, o semi crudos, puede aumentar el riesgo de contraer enfermedades alimenticias; especialmente si usted presenta ciertas condiciones físicas.\"\n\nCentro de Atención a clientes\n01800-2282272\ncomentarios@cpkmexico.com.mx"
        lbl_textFinal.textColor = UIColor.whiteColor()
        lbl_textFinal.textAlignment = NSTextAlignment.Center
        lbl_textFinal.font.fontWithSize(11.0)
    
        
//        var gestoIzquierda = UISwipeGestureRecognizer(target: self, action: "gestoManejador:") //notar los dos puntos al final de gestoManejador
//        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        
        var gestoDerecha = UISwipeGestureRecognizer(target: self, action: "gestoManejador:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        
//        self.view.addGestureRecognizer(gestoIzquierda)
        self.view.addGestureRecognizer(gestoDerecha)
        
        
        super.viewDidLoad()
    }
    
    @IBAction func gestoManejador(send: UIGestureRecognizer){
        
        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("Segue_Margaritas_Return", sender: self)
//            case UISwipeGestureRecognizerDirection.Left:
//                self.performSegueWithIdentifier("Segue_Final", sender: self)
            default: break
            }
        }
    }
}