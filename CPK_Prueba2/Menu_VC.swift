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
    
    
    var arrayMenus: [Menu] = [Menu] ()
//    let scRect:CGRect = UIScreen.mainScreen().bounds
    
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
        
//        self.ConfigMenus()
        
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
        animCell.textLabel.text = "ROW : \(indexPath.row)"
        println("ROW : \(indexPath.row)")
        
        animCell.accessoryView = UIImageView(image: UIImage(named: "flecha_siguiente_blanco.png"))
        animCell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        animCell.textLabel.textColor = UIColor(red: 252, green: 217, blue: 0, alpha: 1)
        
        return animCell
    }
    //#############################################################################################################
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        cell.frame = CGRectMake(scRect.width, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)
//    }
    
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
    
//    func ConfigMenus(){
//        var Menu1 = Menu(nombre: "Entradas")
//    }
}