//
//  Entradas_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 23/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class Entradas_VC:MenusCPK{

    var nombresPlatillos: [CustomCell] = [
        CustomCellTipo4(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell"),
        CustomCellTipo2(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell")
    ]
    
    var Myfondo: UIImage = UIImage(named: "entradas_foto.jpg")!
    
    override func viewDidLoad() {
        
        ////// inicializando variables ///////
        super.menusPlatillos = nombresPlatillos
        super.platoFondo = Myfondo
//        super.Ruta = PathEntrada
//        super.NombreFondo = nombreFondo
        ////////////////////////////////////
        var gestoIzquierda = UISwipeGestureRecognizer(target: self, action: "gestoManejador:") //notar los dos puntos al final de gestoManejador
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        
        var gestoDerecha = UISwipeGestureRecognizer(target: self, action: "gestoManejador:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(gestoIzquierda)
        self.view.addGestureRecognizer(gestoDerecha)
//        
//        var cabeceras:[String] = ["title","breadcrumb"]
//        var camposMenus:[String] = ["title","price", "badge","extratext","description","text"]
//        
//        var test = JSONParser(ArchivoRuta: "entrada")
//        
//        test.GetHeader(cabeceras)
//        test.GetSpecificMenu(camposMenus, menuNumero: 0)
        
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