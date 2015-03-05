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
    
    var arrayMenus: [String] = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbale.delegate = self
        tbale.dataSource = self
        
        var gestoIzquierda = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gestoIzquierda.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(gestoIzquierda)
        
        var gestoDerecha = UISwipeGestureRecognizer(target:self,action:"SwipeHandler:")
        gestoDerecha.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(gestoDerecha)
        
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
        var imgTm = UIImageView(frame:CGRect(x: 0, y: 0, width: 40, height: 15))
        
        imgTm.image = UIImage(named: "flecha_siguiente_blanco.png") //imagen para el accesoryView
        animCell.accessoryView = imgTm
        
        animCell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        animCell.textLabel.textColor = UIColor(red: 252, green: 217, blue: 0, alpha: 1)
        animCell.textLabel.font = UIFont(name: animCell.textLabel.font.fontName, size: 22)
        //  ---------------------------------------------------------------------------------------------------
        return animCell
    }
    //#############################################################################################################
    
    @IBAction func SwipeHandler(send: UIGestureRecognizer){
        
        if let swipeGesture = send as? UISwipeGestureRecognizer { //casting si es un GestureSwipe
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("Segue_IntroReturn", sender: self)
            case UISwipeGestureRecognizerDirection.Right:
                self.performSegueWithIdentifier("Segue_Entradas", sender: self)
            default: break
            }
        }
    }
    
    func initMenus(){
//        var tmpMenus:NSArray = [Menu(nombre:"Entradas"),Menu(nombre:"Ensaladas"),Menu(nombre:"Sopas"),Menu(nombre:"Sandwiches"),Menu(nombre:"Pastas"),Menu(nombre:"Pizzas"),Menu(nombre:"Selecciones ligeras"),Menu(nombre:"Especialidades"),Menu(nombre:"Bebidas")]
        var tmpMenus:[String] = ["Entradas","Ensaladas","Sopas","Sandwiches","Pastas","Pizzas","Selecciones ligeras","Especialidades","Bebidas"]
        
        for i in tmpMenus{
            arrayMenus.append(i)
        }

    }
}