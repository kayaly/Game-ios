//
//  ViewControllerHomePage.swift
//  FinalWajeb|Abosaoud
//
//  Created by ahmed almuhayzii on ٤ ربيع١، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ kayaly. All rights reserved.
//

import UIKit

class ViewControllerHomePage: UIViewController {
    
    var homePage = UIImageView()
    let myImegAsButton  = UIButton()
    let ArrayButtonName = ["buttonStart.png"  , "buttonThree.png" , "buttonTow.png" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       

        disPlayHomePage()
        creatListButton()
      
        
        
    }
    
    func disPlayHomePage(){
        
        homePage = UIImageView(frame:CGRect(x: 0 , y: 0, width: 320, height: 568))
        homePage.image = UIImage(named: "homePage.jpg")
        view.addSubview(homePage)
        
        
    }
    
    func creatListButton(){
        
        var positionY = 340
        
        for indexArray in 0 ..< ArrayButtonName.count {
            let myImegAsButton = [UIButton(),UIButton(),UIButton()]
            
            myImegAsButton[indexArray].frame = CGRect(x: 65, y: positionY , width: 180, height: 50)
            myImegAsButton[indexArray].setImage(UIImage(named:
            ArrayButtonName [indexArray] )?.withRenderingMode(.alwaysOriginal) , for: .normal)
            self.view.addSubview(myImegAsButton[indexArray])
            positionY += 60
            
            myImegAsButton[0].addTarget(self,
                                        action: #selector(ViewControllerHomePage.startPlay(_:)),
                                        for: .touchUpInside)
            myImegAsButton[1].addTarget(self,
                                        action: #selector(ViewControllerHomePage.howToPlay(_:)),
                                        for: .touchUpInside)
            myImegAsButton[2].addTarget(self,
                                        action: #selector(ViewControllerHomePage.connectWithUs(_:)),
                                        for: .touchUpInside)


                   }
        
 }
    
    func startPlay(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "Show", sender: self)
        
    }
    
    func howToPlay(_ sender: AnyObject) {
        
       self.performSegue(withIdentifier: "pageIdeaGame", sender: self)
        print("halaksak")
        
    }
    
    func connectWithUs(_ sender: AnyObject) {
        print("NVKSAL")

       // self.performSegue(withIdentifier: "Show", sender: self)
        
    }
    

    
}
