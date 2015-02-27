//
//  MenusCPK.swift
//  CPK_Prueba2
//
//  Created by desarm on 24/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIkit

class MenusCPK:UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tablaMenus: UITableView!
    private var menusArray: [Menu] = [] //inicializador inline
    private var ImgPlato: UIImage = UIImage() //inicializador inline
    @IBOutlet weak var Btn_Menu: UIButton!
    @IBOutlet weak var Lbl_Path: UILabel!
    @IBOutlet weak var img_fondoMenu: UIImageView!
    @IBOutlet weak var img_logoVertical: UIImageView!
    @IBOutlet weak var Lbl_NombreFondo: UILabel!
    
    var menusPlatillos:[Menu]{ //getter y setter para Celdas
        get{
            return menusArray
        }
        set{
        menusArray = newValue
        }
    }
    
    var platoFondo: UIImage{ //getter y setter para ImgPlato
        get{
            return ImgPlato
        }
        set{
            ImgPlato = newValue
        }
    }
    var NombreFondo:String{
        get{
            return Lbl_NombreFondo.text!
        }
        set{
            Lbl_NombreFondo.text = newValue
        }
    }
    
    var Ruta:String{
        get{
            return Lbl_Path.text!
        }
        set(texto){
            //HTML sintasix
            var err:NSError?
            self.Lbl_Path.attributedText = NSAttributedString(
                data: texto.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType] ,
                documentAttributes: nil,
                error: &err)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaMenus.delegate = self
        tablaMenus.dataSource = self
        tablaMenus.separatorStyle = .None // sin separadaores
        
        Btn_Menu.setBackgroundImage(UIImage(named: "menu_boton.png"), forState: UIControlState.Normal)
        img_fondoMenu.image = ImgPlato
        img_logoVertical.image = UIImage(named: "logo_cpk_horizontal.png")
//        Lbl_Path.font = UIFont(name: "Archer-Bold", size: 14.0) // <---- checar esto (no funciona)
    }

    override func prefersStatusBarHidden() -> Bool { //ocultar barra de status
        return true
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
        
        let CustCell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as UITableViewCell
        CustCell.textLabel.text = menusArray[indexPath.row].nombre
        
        //--------------------------------  personalizacion de la celda  --------------------------------------
        var imgTm = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 15))
        imgTm.image = UIImage(named: "flecha_siguiente_blanco.png")
        CustCell.accessoryView = imgTm
        
        CustCell.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        CustCell.textLabel.textColor = UIColor(red: 252, green: 217, blue: 0, alpha: 1) //amarillo personalizado
        CustCell.textLabel.font = UIFont(name: CustCell.textLabel.font.fontName, size: 22)
        //  ---------------------------------------------------------------------------------------------------
        return CustCell
    }
    //#############################################################################################################
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
