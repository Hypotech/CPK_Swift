//
//  CustomCellTipo3.swift
//  CPK_Prueba2
//
//  Created by desarm on 03/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//
// Esta clase agrega los campos de insignia a la clase CustomCellTipo2

import UIKit

class CustomCellTipo3: CustomCellTipo2 {

    var imgV_Insignia = UIImageView()
    var lbl_TextoInsignia = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgV_Insignia.frame = CGRect(x: lbl_nombreMenu.frame.width + 8, y: lbl_nombreMenu.frame.minY, width: 32, height: 34)
        lbl_TextoInsignia.frame = CGRect(x: imgV_Insignia.frame.maxX + 6,
            y: imgV_Insignia.frame.height/2 - 14/2,
            width: 125,
            height: 14)
        lbl_TextoInsignia.textColor = UIColor(red: 254, green: 215, blue: 5, alpha: 1) //color Personalizado
        
//        lbl_TextoInsignia.backgroundColor = UIColor.greenColor()
        
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

        
        switch (dtosCadena[0]){
        case "1":
            imgV_Insignia.image = UIImage(named:"platillofav_label.png")
            lbl_TextoInsignia.text = "Platillo Favorito"
        case "2":
            imgV_Insignia.image = UIImage(named: "productonuev_label.png")
            lbl_TextoInsignia.text = "Producto nuevo"
        case "3":
            imgV_Insignia.image = UIImage(named: "light_label.png")
            lbl_TextoInsignia.text = "Bajo en calorías"
        default:
            lbl_TextoInsignia.removeFromSuperview()
        }
    }
}