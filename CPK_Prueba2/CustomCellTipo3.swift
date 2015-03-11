//
//  CustomCellTipo3.swift
//  CPK_Prueba2
//
//  Created by desarm on 03/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//
// Esta clase agrega los campos de insignia a la clase CustomCellTipo2, esta clase contiene:
//
// - nombre del platillo/menu
// - precio
// -descripción
// - imagen insignia
// - texto con alución a la imagen insignia

import UIKit

class CustomCellTipo3: CustomCellTipo2 {

    var imgV_Insignia = UIImageView()
    var lbl_TextoInsignia = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgV_Insignia.frame = CGRect(x: lbl_nombreMenu.frame.width + 8, y: lbl_nombreMenu.frame.minY, width: 20, height: 20)
        lbl_TextoInsignia.frame = CGRect(x: imgV_Insignia.frame.maxX + 6,
            y: imgV_Insignia.frame.height/2 - 14/2,
            width: 125,
            height: 14)
        
        contentView.addSubview(imgV_Insignia)
        contentView.addSubview(lbl_TextoInsignia)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func rellenarConJSONs(archivo:String, menuNum:Int){
        super.rellenarConJSONs(archivo,menuNum: menuNum)
        
        var ArchivoJSON = JSONParser(ArchivoRuta: archivo)
        var dtosCadena = ArchivoJSON.GetSpecificMenu(["badge"], menuNumero: menuNum)

//        println("badge: " + dtosCadena[0])
        
        switch (dtosCadena[0]){
        case "1":
            imgV_Insignia.image = UIImage(named:"platillofav_label.png")
            lbl_TextoInsignia.text = "Platillo Favorito"
            lbl_TextoInsignia.textColor = UIColor(red: 252, green: 231, blue: 0, alpha: 1) //color Personalizado
        case "2":
            imgV_Insignia.image = UIImage(named: "productonuev_label.png")
            lbl_TextoInsignia.text = "Producto nuevo"
            lbl_TextoInsignia.textColor = UIColor.grayColor() //color Personalizado
        case "3":
            imgV_Insignia.image = UIImage(named: "light_label.png")
            lbl_TextoInsignia.text = "Bajo en calorías"
            lbl_TextoInsignia.textColor = UIColor.greenColor()
        default:
            lbl_TextoInsignia.removeFromSuperview()
            imgV_Insignia.removeFromSuperview()
        }
    }
}