//
//  ConnectionStrings.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 24/10/2021.
//

import Foundation
class ConnectionStrings{
    private static let connectionFile = "ConnectionStrings";
    
    public static func read(filtro: String) -> String {
      if let path = Bundle.main.path(forResource: connectionFile, ofType: "plist"), let plist = FileManager.default.contents(atPath: path) {
        do {
            let pListData = try PropertyListSerialization.propertyList(from: plist, options: [], format: nil) as! [String:AnyObject]
            for datos in pListData {
               
                if(filtro == datos.key){
                   return datos.value as? String ?? "";
                }
            }
        } catch {
            print("Error leyendo plist: \(error)")
        }
    }
    return "";
 }
    
}
