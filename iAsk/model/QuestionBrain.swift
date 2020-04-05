//
//  QuestionBrain.swift
//  iAsk
//
//  Created by Amr Moussa on 4/5/20.
//  Copyright © 2020 Amr Moussa. All rights reserved.
//

import Foundation


import UIKit

struct QuestionBrain {
    var score = 0
    var question:Question?
    let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    //    init(questionnum :Int) {
    //        self.questionnum = questionnum
    //    }
    //
    //    let tools = loadImagesFromAlbum(folderName:  )
    //    let animals = loadImagesFromAlbum(folderName: )
    //    let flags = loadImagesFromAlbum(folderName: "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/flags")
    //    let landmarks = loadImagesFromAlbum(folderName: "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/land marks")
    //    let planet = loadImagesFromAlbum(folderName: "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/planets")
    //
    
    
    
    mutating  func getQuestion() -> Question{
        let selectcontent = Int.random(in: 0...4)
        let   toolfolder = [ "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/tools/"
            , "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/animals/"
            ,"/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/land marks/"
            , "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/flags/"
            ,"/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/planets/"]
        var folderContent = QuestionBrain.loadImagesFromAlbum(folderName:  toolfolder[selectcontent])
        
        if let index = folderContent.index(of: ".DS_Store"){
            folderContent.remove(at: index)
            
        }
        
        
        let selectitem = Int.random(in: 0...toolfolder.count - 1)
        var selectitem2 = Int.random(in: 0...toolfolder.count - 1)
        print(folderContent[selectitem])
        ////////////
        repeat{
            selectitem2 = Int.random(in: 0...toolfolder.count - 1)
        }while selectitem == selectitem2
        let arr = [selectitem,selectitem2]
        print(folderContent[selectitem2])
        let selectoptionaitem = arr.randomElement()!
        var lectoptionitem2 = arr.randomElement()!
        repeat{
            lectoptionitem2 = arr[Int.random(in: 0...arr.count - 1)]
        }while selectoptionaitem == lectoptionitem2
        
        
        let urkr  = URL.init(fileURLWithPath: toolfolder[selectcontent] + folderContent[selectitem])
        let data:NSData = NSData(contentsOf: urkr)!
        print(folderContent[selectoptionaitem],folderContent[ lectoptionitem2])
        /////////////////////////////
        question = Question(type: "img", fanswer: String(getnamefromjpg(name: folderContent[selectoptionaitem])[0]), sAnswer: String(getnamefromjpg(name: folderContent[lectoptionitem2])[0]), image: UIImage(data: data as Data)!, correctanswer: String(getnamefromjpg(name: folderContent[selectitem])[0]))
        
        return question!
    }
    
    
    // get images names
    mutating func checkanswer(ans:String)->Bool{
        if  question?.correctanswer == ans {
            score += 1
            return true
        }
        else{
            return false
        }
        
    }
    static  func loadImagesFromAlbum(folderName:String) -> [String]{
        do{
            let files = try FileManager.default.contentsOfDirectory(atPath: folderName)
            print(files)
            
            return files
        }catch{
            print(error)
        }
        
        return [""]
    }
    //
    func getnamefromjpg(name:String)->Array<Substring>{
        return name.split(separator: ".")
        
        
        
    }
    
    //    func loaduiimage(imgname:String) ->UIImage?{
    //        let fm = FileManager.default
    //        let path = Bundle.main.resourcePath
    //
    //        do {
    //            let item = try fm.contents(atPath: "/Users/amrmoussa/IOS COURSE ANGELA/course projects/iAsk/iAsk/tools/guitar.png")
    //            print(item)
    //        }catch{
    //        }
    //        return nil
    //    }
    //    func loaduiimage1(imgname:String) ->UIImage?{
    //
    //
    ////        let data = FileManager.contents(<#T##self: FileManager##FileManager#>)
    //    }
    
}
