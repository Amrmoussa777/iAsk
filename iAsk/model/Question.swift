//
//  question.swift
//  iAsk
//
//  Created by Amr Moussa on 4/5/20.
//  Copyright © 2020 Amr Moussa. All rights reserved.
//
import UIKit

import Foundation
struct Question {
    let type :String
    let fAnswer:String
    let sAnswer:String
    let image:UIImage
    let  correctanswer:String
    init(type:String,fanswer:String,sAnswer:String,image:UIImage,correctanswer:String) {
        self.type = type
        self.fAnswer = fanswer
        self.sAnswer = sAnswer
        self.image = image
        self.correctanswer = correctanswer
    }
    
    
}
