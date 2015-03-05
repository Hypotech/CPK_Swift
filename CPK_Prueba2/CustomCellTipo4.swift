//
//  CustomCellTipo4.swift
//  CPK_Prueba2
//
//  Created by desarm on 03/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

class CustomCellTipo4: CustomCellTipo3 {
    
    var lbl_ConcienciaSoc = UILabel()
    var imgV_ConcienciaSocial = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        lbl_ConcienciaSoc.backgroundColor = UIColor.greenColor()
        lbl_ConcienciaSoc.numberOfLines = 0 //auto
        lbl_ConcienciaSoc.lineBreakMode = .ByWordWrapping
        
        lbl_ConcienciaSoc.font = lbl_ConcienciaSoc.font.fontWithSize(11.0)
        
        contentView.addSubview(imgV_ConcienciaSocial)
        contentView.addSubview(lbl_ConcienciaSoc)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func rellenarConJSONs(archivo:String, menuNum:Int){
        super.rellenarConJSONs(archivo,menuNum: menuNum)
        lbl_ConcienciaSoc.text = "Por cada WRAP DE LECHUGA CON POLLO A LA NARANJA que compres, CPK dona $1 al Movimiento Va por mi Cuenta. 100% del dinero recaudado será para dar comidas nutritivas a los niños en pobreza alimentaria de nuestro país."
        imgV_ConcienciaSocial.image = UIImage(named: "wrap_bullet.png")
        
        let H_imgConcSoci:CGFloat = 49.0
        let W_imgConcSoci:CGFloat = 137.0
        
        lbl_ConcienciaSoc.frame = CGRect(x: lbl_descripcion.frame.minX+W_imgConcSoci+8, y: lbl_descripcion.frame.maxY + 4, width: 322, height: 55)
        imgV_ConcienciaSocial.frame = CGRect(x: lbl_descripcion.frame.minX, y: lbl_ConcienciaSoc.frame.height/2-(H_imgConcSoci/2)+lbl_ConcienciaSoc.frame.minY, width: W_imgConcSoci, height: H_imgConcSoci)
        
    }

}