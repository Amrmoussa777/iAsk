//
//  ViewController.swift
//  iAsk
//
//  Created by Amr Moussa on 4/4/20.
//  Copyright © 2020 Amr Moussa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secoreLabel: UILabel!
    @IBOutlet weak var fBtn: UIButton!
    @IBOutlet weak var sBtn: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    var timer :Timer?
    var  quiz = QuestionBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UpdateUI()
        fBtn.layer.cornerRadius = 10
        fBtn.clipsToBounds = true
        sBtn.layer.cornerRadius = 10
        sBtn.clipsToBounds = true
      
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOpacity = 1
//        imageView.layer.shadowOffset = CGSize.zero
//        imageView.layer.shadowRadius =  30
//        imageView.layer.cornerRadius = 30
//
//        imageView.clipsToBounds =  true
//        imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds , cornerRadius: 10).cgPath
   
    
    
    }
    
    @objc  func  UpdateUI(){
        let qu = quiz.getQuestion()
        self.imageView.image = qu.image
        self.imageView.layer.cornerRadius = 40
        self.imageView.layer.masksToBounds = true
//        imageView.applyshadowtiTHcorner(imageView:imageView , cornerradius: 30.0)
        self.fBtn.setTitle(qu.fAnswer, for: .normal)
        self.sBtn.setTitle(qu.sAnswer, for: .normal)
        timer?.invalidate()
        timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateUI),userInfo: nil
            ,repeats: false)
    }
    
    @IBAction func answerspreesed(_ sender: UIButton) {
        secoreLabel.transform.scaledBy(x: 1, y: 1)
        alertLabel.text = ""
        let ans = sender.currentTitle!
        if quiz.checkanswer(ans: ans){
            secoreLabel.text = "$ " + String(quiz.score)
            secoreLabel.transform.scaledBy(x: 1.5, y: 1.5)
            UpdateUI()
            
        }
        else{
            alertLabel.text = "Got Wrong!"
            UpdateUI()
            
        }
        
    }
   
   
}
extension UIImageView {
    func applyshadowtiTHcorner(imageView:UIView,cornerradius :CGFloat){
        imageView.clipsToBounds  = false
                imageView.layer.shadowColor = UIColor.black.cgColor
                imageView.layer.shadowOpacity = 1
                imageView.layer.shadowOffset = CGSize.zero
                imageView.layer.shadowRadius =  30
                imageView.layer.cornerRadius = cornerradius
                self.clipsToBounds = true
                self.layer.cornerRadius = cornerradius
        //
        //
        //        imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds , cornerRadius: 10).cgPath
        
        
    }
       
   }


