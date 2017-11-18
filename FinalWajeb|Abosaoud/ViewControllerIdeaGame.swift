//
//  ViewControllerIdeaGame.swift
//  FinalWajeb|Abosaoud
//
//  Created by ahmed almuhayzii on ٥ ربيع١، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ kayaly. All rights reserved.
//

import UIKit

class ViewControllerIdeaGame: UIViewController {

        var background = UIImageView()
        let backButton  = UIButton()
        let twitterButton  = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        background = UIImageView(frame:CGRect(x: 0 , y: 0, width: 320, height: 568))
        background.image = UIImage(named: "ideaGame.jpg")
        view.addSubview(background)
        
       
        creatBackButton()
         creatButtonTwitter()
        
    }

    func creatBackButton(){
        
        backButton.frame = CGRect(x: 2, y: 2 , width: 180, height: 50)
        backButton.setImage(UIImage(named:
            "buttonBack.png" )?.withRenderingMode(.alwaysOriginal) , for: .normal)
        self.view.addSubview(backButton)
        
        backButton.addTarget(self,
                                    action: #selector(ViewControllerIdeaGame.goBack(_:)),
                                    for: .touchUpInside)

    }
    
    func creatButtonTwitter(){
        
        twitterButton.frame = CGRect(x: 210, y: 350 , width: 100, height: 100)
        twitterButton.setImage(UIImage(named:
            "iconTwitter.png" )?.withRenderingMode(.alwaysOriginal) , for: .normal)
        self.view.addSubview(twitterButton)
        
        twitterButton.addTarget(self,
                             action: #selector(ViewControllerIdeaGame.goTwitter(_:)),
                             for: .touchUpInside)


        
    }
    
    func goTwitter(_ sender: AnyObject) {
        
        UIApplication.shared.openURL(NSURL(string: "https://twitter.com/kayaly5/")! as URL)
        
        //UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
        
    }
    func goBack(_ sender: AnyObject) {
        
         dismiss(animated: true, completion: nil)
         // self.performSegue(withIdentifier: "backHomePage", sender: self)
    }

   
   
    
}
