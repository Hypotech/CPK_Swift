//
//  Entradas_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 23/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class Entradas_VC:MenusCPK{

    var platillos: [Menu] = [Menu(nombre:"Entradas"),Menu(nombre:"Ensaladas"),Menu(nombre:"Sopas"),Menu(nombre:"Sandwiches"),Menu(nombre:"Pastas"),Menu(nombre:"Pizzas"),Menu(nombre:"Selecciones ligeras"),Menu(nombre:"Especialidades"),Menu(nombre:"Bebidas")]
    
    var Myfondo: UIImage = UIImage(named: "entradas_foto.jpg")!
    var PathEntrada = "Menú – <font color=\"#FEAC0D\">Sopas</font>"
    var nombreFondo = "WRAPS DE LECHUGA CON POLLO A LA NARANJA"
    
    override func viewDidLoad() {
        
        ////// inicializando variables ///////
        super.menusPlatillos = platillos
        super.platoFondo = Myfondo
        super.Ruta = PathEntrada
        super.NombreFondo = nombreFondo
        ////////////////////////////////////
        var gestoIzquierda = UISwipeGestureRecognizer(target: self, action: "gestoManejador:") //notar los dos puntos al final de gestoManejador
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        
        var gestoDerecha = UISwipeGestureRecognizer(target: self, action: "gestoManejador:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(gestoIzquierda)
        self.view.addGestureRecognizer(gestoDerecha)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gestoManejador(send: UIGestureRecognizer){
        
        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Menu_Return", sender: self)
//            case UISwipeGestureRecognizerDirection.Right:
//                self.performSegueWithIdentifier("Segue_Menu_Return", sender: self)
            default: break
            }
        }
    }
}