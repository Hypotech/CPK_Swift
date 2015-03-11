//
//  Menu_VC.swift
//  CPK_Prueba2
//
//  Created by desarm on 18/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class Menu_VC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var Im_logoCPK: UIImageView!
    @IBOutlet weak var tbale: UITableView!
    
    @IBOutlet weak var viewBlack: UIView!
    var arrayMenus: [String] = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbale.delegate = self
        tbale.dataSource = self
        
        var gestoIzquierda = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        gestoIzquierda.cancelsTouchesInView = false
        self.view.addGestureRecognizer(gestoIzquierda)
        viewBlack.addGestureRecognizer(gestoIzquierda)
        var gestoDerecha = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(gestoDerecha)
        gestoDerecha.cancelsTouchesInView = false
        viewBlack.addGestureRecognizer(gestoDerecha)
        
        self.initMenus() //agregamos los menus
        
        Im_logoCPK.image = UIImage(named: "logo_cpk_horizontal.png")
    }
    
    override func prefersStatusBarHidden() -> Bool { //ocultar barra de status
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //################################### funciones para control del table view #################################
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { //forzoso para implementar el protocolo
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let animCell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as UITableViewCell
        animCell.textLabel.text = arrayMenus[indexPath.row]

        //--------------------------------  personalizacion de la celda  --------------------------------------
        var imgFlecha = UIImageView(frame:CGRect(x: 0, y: 0, width: 40, height: 15))
        
        imgFlecha.image = UIImage(named: "flecha_siguiente_blanco.png") //imagen para el accesoryView
        animCell.accessoryView = imgFlecha
        
        animCell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        animCell.textLabel.textColor = UIColor(red: 252, green: 217, blue: 0, alpha: 1)
        animCell.textLabel.font = UIFont(name: animCell.textLabel.font.fontName, size: 22)
        //  ---------------------------------------------------------------------------------------------------
        return animCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        println("Celda numero: \(indexPath.row)")
        
        if (indexPath.row == 0){
            self.performSegueWithIdentifier("Segue_Entradas", sender: self)
        }
        else if(indexPath.row == 1){
            self.performSegueWithIdentifier("Segue_Ensaladas", sender: self)
        }
        else if(indexPath.row == 2){
            self.performSegueWithIdentifier("Segue_Sopas", sender: self)
        }
        else if(indexPath.row == 3){
            self.performSegueWithIdentifier("Segue_Sandwiches", sender: self)
        }
        else if(indexPath.row == 4){
            self.performSegueWithIdentifier("Segue_Pastas", sender: self)
        }
        else if(indexPath.row == 5){
            self.performSegueWithIdentifier("Segue_Pizzas", sender: self)
        }
        else if(indexPath.row == 6){
            self.performSegueWithIdentifier("Segue_Selecciones_ligeras", sender: self)
        }
        else if(indexPath.row == 7){
            self.performSegueWithIdentifier("Segue_Especialidades", sender: self)
        }
        else if(indexPath.row == 8){
            self.performSegueWithIdentifier("Segue_Bebidas", sender: self)
        }
    }
    //#############################################################################################################
    
    @IBAction func SwipeHandler(send: UIGestureRecognizer){
        
        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("Segue_IntroReturn", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_Entradas", sender: self)
            default: break
            }
        }
    }
    
    func initMenus(){
        var tmpMenus:[String] = ["Entradas","Ensaladas","Sopas","Sandwiches","Pastas","Pizzas","Selecciones ligeras","Especialidades","Bebidas"]
        
        for i in tmpMenus{
            arrayMenus.append(i)
        }

    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if segue.identifier == "Segue_IntroReturn" {
//            let vc = segue.destinationViewController as Intro_VC
//        }
//        
//        else if segue.identifier == "Segue_Entradas" {
//            let vc = segue.destinationViewController as Entradas_VC
//        }
//    }
    
}