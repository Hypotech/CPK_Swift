//
//  CustomCellTipo2.swift
//  CPK_Prueba2
//
//  Created by desarm on 03/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//
// Esta clase agrega el campo de descripción a la clase CustomCellTipo1


import UIKit


class CustomCellTipo2:CustomCellTipo1 {
    
    var lbl_descripcion = UILabel()
    var err:NSError?
    
    override func CalculaAlto(){
        super.CalculaAlto()
        var maximumLabelSize:CGSize = CGSize(width: lbl_descripcion.frame.width, height: 9999);
        var expectSize:CGSize = lbl_descripcion.sizeThatFits(maximumLabelSize)
        
        var newFrame:CGRect = lbl_descripcion.frame
        newFrame.size.height = expectSize.height
        newFrame.origin.y = lbl_nombreMenu.frame.height + 10.0
        lbl_descripcion.frame = newFrame
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //___________________________________ Personalizando lbl_descripcion  _______________________________________
        lbl_descripcion.frame = CGRect(x: 0, y: lbl_nombreMenu.frame.height + 10, width: 382, height: 0)
        lbl_descripcion.numberOfLines = 0
        lbl_descripcion.lineBreakMode = .ByWordWrapping
        lbl_descripcion.backgroundColor = UIColor.yellowColor()
        //___________________________________________________________________________________________________________
        contentView.addSubview(lbl_descripcion)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func rellenarConJSONs(archivo:String, menuNum:Int){
        super.rellenarConJSONs(archivo,menuNum: menuNum)
        
        var ArchivoJSON = JSONParser(ArchivoRuta: archivo)
        var dtosCadena = ArchivoJSON.GetSpecificMenu(["description"], menuNumero: menuNum)
        
        lbl_descripcion.attributedText = NSAttributedString(
            data: dtosCadena[0].dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
            options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType] ,
            documentAttributes: nil,
            error: &err)
        
        lbl_descripcion.font = lbl_descripcion.font.fontWithSize(17.0)
        self.CalculaAlto()
        altoRow = lbl_descripcion.frame.maxY + 8.0
    }
}