//
//  MenusCPK.swift
//  CPK_Prueba2
//
//  Created by desarm on 24/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIkit

class MenusCPK:UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tablaMenus: UITableView! //tabla donde se deplegaran los Menus/Platillos
    private var Platillos: [CustomCell] = [] //Lista de nombres de los platillos
    private var imgFondo: UIImage = UIImage() //Plato representativo del Menu
    @IBOutlet weak var Btn_Menu: UIButton! //Boton de regreso al menu principal
    @IBOutlet weak var Lbl_Path: UILabel! //Ruta actual
    @IBOutlet weak var img_fondoMenu: UIImageView! //donde se despliega la imgFondo
    @IBOutlet weak var img_logoVertical: UIImageView! //logo de la compañia
    @IBOutlet weak var Lbl_NombreFondo: UILabel! //etiqueta para img_fondoMenu
    
    //.............................. casos especiales ..............................//
//    var conMensajeIntro:Bool = false
//    var lbl_introTexto:UILabel! //mensaje Introductorio
//    var view_imgIntroMenu: UIImageView!//imagen que hace alusión al mensaje intro
    //..............................................................................//
    var menusPlatillos:[CustomCell]{ //getter y setter para Celdas
        get{
            return Platillos
        }
        set{
        Platillos = newValue
        }
    }
    
    var platoFondo: UIImage{ //getter y setter para ImgPlato
        get{
            return imgFondo
        }
        set{
            imgFondo = newValue
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
//        tablaMenus.rowHeight = UITableViewAutomaticDimension
        tablaMenus.separatorStyle = .None // sin separadaores
        
        Btn_Menu.setBackgroundImage(UIImage(named: "menu_boton.png"), forState: UIControlState.Normal)
        img_fondoMenu.image = imgFondo
        img_logoVertical.image = UIImage(named: "logo_cpk_horizontal.png")
//        Lbl_Path.font = UIFont(name: "Archer-Bold", size: 14.0) // <---- checar esto (no funciona)
        
//        if (conMensajeIntro){
//            lbl_introTexto.frame = CGRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
//            
//            let TAMAÑO_TEXT:CGFloat = 72.0
//            view_imgIntroMenu.frame = CGRect(x: tablaMenus.frame.minX, y: tablaMenus.frame.minY, width: 90.0, height: 40.0)
//            
//            tablaMenus.frame = CGRect(x: tablaMenus.frame.minX , y: tablaMenus.frame.minY + TAMAÑO_TEXT+8, width: tablaMenus.frame.width, height: tablaMenus.frame.height - (TAMAÑO_TEXT+8) ) // reubica la tabla
//        }
    }

    override func prefersStatusBarHidden() -> Bool { //ocultar barra de status
        return true
    }
    
    //################################### funciones para control del table view #################################
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { //forzoso para implementar el protocolo
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Platillos.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Platillos[indexPath.row].altoRow
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var celda = tableView.dequeueReusableCellWithIdentifier("MyCustomCell") as? CustomCell
//        
//        if celda == nil {
//            celda = CustomCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCustomCell")
//        }
        
        //--------------------------------  personalizacion de la celda  --------------------------------------

        Platillos[indexPath.row].backgroundColor = UIColor.whiteColor()
//        celda!.lbl_nombreMenu.text = "Menu \(indexPath.row) blablabla"
//        celda!.lbl_descripcion.text = "Descripcion \(indexPath.row) blablablablablabla"
//        celda!.lbl_precio.text = "$10\(indexPath.row)"
//        celda!.lbl_ConcienciaSoc.text = "to specify the width and height of the label with constraints because the frame no longer is used. Finally, you also should set the textAlignment to .Center so that your text is centered in your label."
//        celda!.imgV_ConcienciaSocial.image = UIImage(named: "wrap_bullet.png")
//        celda!.imgV_Insignia.image = UIImage(named: "platillofav_label.png")
        
        Platillos[indexPath.row].rellenarConJSONs("entrada",menuNum: indexPath.row) //Autorellena con el JSON especificado
        
        Platillos[indexPath.row].setNeedsUpdateConstraints()
        Platillos[indexPath.row].updateConstraintsIfNeeded()
        
        //  ---------------------------------------------------------------------------------------------------
        return Platillos[indexPath.row]
    }
    //#############################################################################################################
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
