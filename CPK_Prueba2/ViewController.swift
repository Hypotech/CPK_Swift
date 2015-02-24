//
//  ViewController.swift
//  CPK_Prueba2
//
//  Created by desarm on 18/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageSplash: UIImageView!
    @IBOutlet weak var Logo_CPK: UIImageView!
    @IBOutlet weak var Img_tagline: UIImageView!
    @IBOutlet weak var Img_gesto_icon: UIImageView!
    
    override func viewDidLoad() {
        //agregamos las imagenes
        ImageSplash.image = UIImage(named: "fondo.jpg")
        Logo_CPK.image = UIImage(named: "logo_cpk_vertical.png")
        Img_tagline.image = UIImage(named: "tagline.png")
        Img_gesto_icon.image = UIImage(named: "gesto_icon.png")

        let RecognizerRight = UISwipeGestureRecognizer(target: self, action: Selector("gotoIntro:"))
        
        RecognizerRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(RecognizerRight)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoIntro(send: UIGestureRecognizer){
        
        self.performSegueWithIdentifier("segue_Intro", sender: self)
    }
    
    override func prefersStatusBarHidden() -> Bool { //ocultar barra de status
        return true
    }
}


