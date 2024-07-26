//
//  Extensions.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/24/24.
//

import Foundation

extension Encodable{ // What is Encodable?
    
    func asDictionary() -> [String: Any]{
        
        guard let data = try? JSONEncoder().encode(self) else{
            return [:] // return empty dictionary
            
        }
        
        // Do loop
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch{
            
            return[:]
            
        }
    }
}



