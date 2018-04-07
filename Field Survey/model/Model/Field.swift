//
//  Field.swift
//  Field Survey
//
//  Created by Austin Terranova on 4/6/18.
//  Copyright © 2018 Austin Terranova. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case insect
    case mammal
    case fish
    case reptile
    case plant
    
    var image: UIImage?{
        return UIImage(named: self.rawValue + "Icon")
    }
    
}
