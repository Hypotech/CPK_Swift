//
//  SANDWICHES.swift
//  CPK_Prueba2
//
//  Created by desarm on 06/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class Sandwiches_VC: MenusCPK {
    var arraysPlatillos: [CustomCell] = [
        CustomCellTipo3(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
    ]
    var Myfondo: UIImage = UIImage(named: "sandwiches_foto.jpg")!
    
    override func viewDidLoad() {
        
        ////// inicializando variables ///////
        super.menusPlatillos = arraysPlatillos
        super.platoFondo = Myfondo
        super.nombreJSON = "sandwich"
        super.NombreFondo = "BBQ"
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
                self.performSegueWithIdentifier("Segue_Sopas_Return", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Pastas", sender: self)
            default: break
            }
        }
    }
}