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
    @IBOutlet weak var tagline: UIImageView!
    
    override func viewDidLoad() {
        ImageIntro.image = UIImage(named: "fondo_intro.jpg")
        img_eatDiff.image = UIImage(named: "headline_intro.png")
        Img_Flecha.image = UIImage(named: "flecha_siguiente.png")
        img_logo.image = UIImage(named: "logo_cpk_horizontal.png")
        tagline.image = UIImage(named: "tagline.png")
        
        var gesto = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gesto.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(gesto)
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SwipeHandler(send: UIGestureRecognizer){

        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("segue_Splash", sender: self)
            default: break
            }
        }
    }
}