//
//  CustomCell.swift
//  CPK_Prueba2
//
//  Created by desarm on 05/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit

protocol trabjarJSONs{
    func rellenarConJSONs(archivo:String, menuNum:Int)
}

class CustomCell: UITableViewCell,trabjarJSONs {
    var altoRow:CGFloat = 300.0
    
    init(tmañoCelda:CGFloat) {
        super.init()
        altoRow = tmañoCelda
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func rellenarConJSONs(archivo:String, menuNum:Int){
        
    }
}