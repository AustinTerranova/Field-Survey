//
//  FieldEventsJSONParser.swift
//  Field Survey
//
//  Created by Austin Terranova on 4/6/18.
//  Copyright © 2018 Austin Terranova. All rights reserved.
//

import Foundation

class FieldEventsJSONParser {
    static let dateFormatter = DateFormatter()
    class func parse(_ data: Data)-> [FieldSurvey]{
        var fieldSurvey = [FieldSurvey]()
        dateFormatter.dateFormat = "YYYY--MM--dd HH:mm"
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok"{
            
            if let observations = root["observations"] as? [Any]{
                for survey in observations{
                    if let survey = survey as? [String: String]{
                        if let fieldName = survey["classification"]{
                            let title = survey["title"]
                            let description = survey["description"]
                            let dateString = survey["date"]
                            let date = dateFormatter.date(from: dateString){
                            
                                if let fieldSurvey = FieldSurvey(fieldName: fieldName, title: title, description: description, date: Date){
                                    fieldSurvey.append(fieldSurvey)
                                    
                                }
                        
                    }
                }
            
                
            }
            
        }
        
        return fieldSurvey
    }

    }
}
}
