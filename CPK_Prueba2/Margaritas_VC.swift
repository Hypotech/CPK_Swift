//
//  Margaritas_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 10/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import uikit

class Margaritas_VC:MenusCPK{
    
    var arraysPlatillos: [CustomCell] = [
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
    ]
    
    override func viewDidLoad() {
        
        var Myfondo: UIImage = UIImage(named: "margarita_foto.jpg")!
        ////// inicializando variables ///////
        super.menusPlatillos = arraysPlatillos
        super.platoFondo = Myfondo
        super.nombreJSON = "margarita"
        super.NombreFondo = "MARGARITAS"
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
                self.performSegueWithIdentifier("Segue_Sangrias_Return", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Final", sender: self)
            default: break
            }
        }
    }
    
    @IBAction override func IrAMenu(){
        self.performSegueWithIdentifier("Segue_Menu_Bebidas_Return", sender: self)
        
    }
}
