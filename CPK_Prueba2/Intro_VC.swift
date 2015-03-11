//
//  Intro_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 18/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit
class Intro_VC: UIViewController {
    
    @IBOutlet weak var ImageIntro: UIImageView!
    @IBOutlet weak var img_eatDiff: UIImageView!
    @IBOutlet weak var Img_Flecha: UIImageView!
    @IBOutlet weak var img_logo: UIImageView!
    
    override func viewDidLoad() {
        
        //********************** cargamos las imagenes *****************
        ImageIntro.image = UIImage(named: "fondo_intro.jpg")
        img_eatDiff.image = UIImage(named: "headline_intro.png")
        Img_Flecha.image = UIImage(named: "flecha_siguiente.png")
        img_logo.image = UIImage(named: "logo_cpk_horizontal.png")
        //***************************************************************//
        var gestoIzquierda = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(gestoIzquierda)
        
        var gestoDerecha = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(gestoDerecha)
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SwipeHandler(send: UIGestureRecognizer){

        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("segue_Splash", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Menu", sender: self)
            default: break
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool { //ocultar barra de status
        return true
    }
}