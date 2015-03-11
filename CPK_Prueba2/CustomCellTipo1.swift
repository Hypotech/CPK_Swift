//
//  CustomTableCell.swift
//  CPK_Prueba2
//
//  Created by desarm on 23/02/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//
//Celda que representa la descripción de un menu/platillo, el cuál contiene:
//
// - nombre del platillo/menu
// - precio

import UIKit

class CustomCellTipo1:CustomCell {

    var lbl_nombreMenu = UILabel()
    var lbl_precio = UILabel()
    
    internal func CalculaAlto(){
        
        var maximumLabelSize:CGSize = CGSize(width: lbl_nombreMenu.frame.width, height: 9999);
        var expectSize:CGSize = lbl_nombreMenu.sizeThatFits(maximumLabelSize)
        
        var newFrame:CGRect = lbl_nombreMenu.frame;
        newFrame.size.height = expectSize.height;
        lbl_nombreMenu.frame = newFrame
        
    }
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // tipo de letra //
        //        lbl_nombre.font = lbl_ConcienciaSoc.font.fontWithSize(12)
        //        lbl_precio.font = lbl_nombre.font
        //        lbl_descripcion.font = lbl_precio.font
        
        lbl_nombreMenu.frame = CGRect(x: 0, y: 0, width: 219, height: 70)

        lbl_nombreMenu.textAlignment = .Left
        
        lbl_nombreMenu.numberOfLines = 0
        lbl_nombreMenu.lineBreakMode = .ByWordWrapping
        lbl_precio.font = UIFont.boldSystemFontOfSize(15.0)
        
//        lbl_nombreMenu.backgroundColor = UIColor.brownColor()
        
        lbl_precio.frame = CGRect(x: 472, y: 0, width: 55, height: 40)
        lbl_precio.textAlignment = .Right
//        lbl_precio.backgroundColor = UIColor.blueColor()
        lbl_precio.font = lbl_precio.font.fontWithSize(17.0)
        lbl_precio.textColor = UIColor.orangeColor()
        
//        println(lbl_nombreMenu.font)
//        println("\(lbl_precio.frame.minX)")
        
        contentView.addSubview(lbl_nombreMenu)
        contentView.addSubview(lbl_precio)
        
        
        //############################################### Constrains ################################################//
        //        lbl_nombreMenu.setTranslatesAutoresizingMaskIntoConstraints(false)
        //        lbl_descripcion.setTranslatesAutoresizingMaskIntoConstraints(false)
        //        lbl_precio.setTranslatesAutoresizingMaskIntoConstraints(false)
        //        lbl_ConcienciaSoc.setTranslatesAutoresizingMaskIntoConstraints(false)
        //        imgV_Insignia.setTranslatesAutoresizingMaskIntoConstraints(false)
        //        imgV_ConcienciaSocial.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        //        var viewsDict = [
        //            "nombreMenu":lbl_nombreMenu,
        //            "descripcion": lbl_descripcion,
        //            "precio": lbl_precio,
        //            "lblConcienciaSocial": lbl_ConcienciaSoc,
        //            "Insignia": imgV_Insignia,
        //            "imgConcienciasocial": imgV_ConcienciaSocial,
        //        ]
        
        //        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[Insignia(20)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDict)) //dist. 1 desde el superview, 35 hight
        //        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[precio(21)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDict)) //dist. 0 desde el superview, 21 hight
        //        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[nombreMenu(70)]-[descripcion]-[imgConcienciasocial(47)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDict)) //dist. 0 desde el superview, 70 hight, dist. standard (8) forma vertical
        //        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[descripcion]-24-[precio(42)]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDict))
        //        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imgConcienciasocial(120)]-[lblConcienciaSocial(400)-|]", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: viewsDict))//120 width p/descripcion, 400 de width para lblConc...
        //        var centerX = NSLayoutConstraint(item: imgV_ConcienciaSocial, attribute: .CenterX, relatedBy: .Equal, toItem: lbl_ConcienciaSoc, attribute: .CenterX, multiplier: 1, constant: 0)
        //        var centerY = NSLayoutConstraint(item: imgV_ConcienciaSocial, attribute: .CenterY, relatedBy: .Equal, toItem: lbl_ConcienciaSoc, attribute: .CenterY, multiplier: 1, constant: 0)
        
        //        imgV_ConcienciaSocial.addConstraint(centerX)
        //        imgV_ConcienciaSocial.addConstraint(centerY)
        
        //#######################################################################################################//
    }
    
    override func rellenarConJSONs(archivo:String, menuNum:Int){

        var ArchivoJSON = JSONParser(ArchivoRuta: archivo)
        var dtosCadena = ArchivoJSON.GetSpecificMenu(["title","price"], menuNumero: menuNum)
        
        lbl_nombreMenu.text = dtosCadena[0]
        lbl_precio.text = "$" + dtosCadena[1]
        self.CalculaAlto()
        altoRow = lbl_nombreMenu.frame.maxY + 8
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
