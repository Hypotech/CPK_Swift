//
//  JSONParser.swift
//  CPK_Prueba2
//
//  Created by desarm on 03/03/15.
//  Copyright (c) 2015 Desarrollo RM. All rights reserved.
//

import UIKit


class JSONParser {

    private let jsonData: NSData
    private var jsonDic: NSDictionary
    
    private enum tipo
    {
        case Integer
        case Cadena
        case Double
        case Array
    }
    
    private var tiposCampos:[String:tipo] = ["title":tipo.Cadena,
                                            "price":tipo.Double,
                                            "badge":tipo.Integer,
                                            "extratext":tipo.Cadena,
        "description":tipo.Array//,
//                                            "text":tipo.Cadena
    ]
    
    init(ArchivoRuta:String){
        
        let fullPath:String  = NSBundle.mainBundle().pathForResource(ArchivoRuta, ofType: "js")! //obtenemos el full path
        jsonData = NSData(contentsOfMappedFile: fullPath)! //obtenemos los datos
        jsonDic = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary // creamos un NSDicticonary a partir del JSON
    }
    
    func getHeader(cabeceras:[String]) -> [String] {

        var resultCabeceras:[String] = [] //mutable object
        
        for (var i=0; i < cabeceras.count; i++){
            
            resultCabeceras.append(jsonDic[cabeceras[i]] as String)
            //println(resultCabeceras[i])
        }
        
        return resultCabeceras
    }
    
    func GetSpecificMenu(campos:[String], menuNumero:Int) -> [String]{

        var resultMenu: [String] = []
        var tempElements: AnyObject = (jsonDic["menu"] as NSArray )

        if (menuNumero < tempElements.count!) //el menu solicitado esta dentro del rango
        {
            for( var i = 0; i < campos.count; i++ ){ //hacer hasta obtener todos los campos
//                println(campos[i])
                
                if (tiposCampos[campos[i]] == tipo.Cadena){
                    resultMenu.append( (tempElements[menuNumero].objectForKey(campos[i]) as String) )
                    //println(resultMenu[i])
                }
                else if (tiposCampos[campos[i]] == tipo.Double){
                    resultMenu.append( "\(tempElements[menuNumero].objectForKey(campos[i]) as Double)" )
                    //println(resultMenu[i])
                }
                else if(tiposCampos[campos[i]] == tipo.Integer){
                    resultMenu.append( "\(tempElements[menuNumero].objectForKey(campos[i]) as Int)" )
                    //println(resultMenu[i])
                }
                else if(tiposCampos[campos[i]] == tipo.Array){

                    var temp1:AnyObject = (tempElements[menuNumero].objectForKey(campos[i]) as NSArray)
                    var descripcion = GetDescription(temp1)
                    resultMenu.append(descripcion)

                }
            }
        }
        return resultMenu
    }
    
    func GetDescription(descricion:AnyObject) -> String {
        var desAppend: String = String()
        
        for var i = 0; i < descricion.count; i++ {
            desAppend += descricion[i].objectForKey("text") as String //concatenar
            if (i != descricion.count - 1){
                desAppend += "<br>" //agremos salto de linea
            }
        }
        
        return desAppend
    }
}