//
//  Ensaladas_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 05/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class Ensaladas_VC: MenusCPK {
    var arraysPlatillos: [CustomCell] = [
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo3(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
    ]
    var Myfondo: UIImage = UIImage(named: "ensaladas_foto.jpg")!
    
    override func viewDidLoad() {
        
        ////// inicializando variables ///////
        super.menusPlatillos = arraysPlatillos
        super.platoFondo = Myfondo
        super.nombreJSON = "ensalada"
        super.NombreFondo = "CALIFORNIA PEACH SALAD"
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
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("Segue_Entradas_Return", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Sopas", sender: self)
            default: break
            }
        }
    }
}