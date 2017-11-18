//
//  ViewController.swift
//  FinalWajeb|Abosaoud
//
//  Created by ahmed almuhayzii on ١٩ صفر، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ kayaly. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    let myImegAsButton  = UIButton()
    var background = UIImageView()
    var imegInCorner = UIImageView()
    var imgesMistakes = UIImageView()
    let ArrayImegs = ["img1","img2","img3","img4","img5"]
    var imageMstikArray = [UIImageView(),UIImageView(),UIImageView(),UIImageView()]
    var myLabelTime = UILabel()
    var myLabelScore = UILabel()
    var labelExtraPoint = UILabel()
    var labelGameLevels = UILabel()
    var numGameLevels = 1
    var timeGame = 15
    var numRandomimgCornr = 0
    var numRandomimg = 0
    var randomValueXPostion = 0
    var randomValueYPostion = 0
    var numArrayImegs = 0
    var onAndOf = 0
    var siteImgMistak = 10
    var afterStart = 0
    var accountMistaks = 0
    var scoreUser = 0
    var alartSentence = "nil"
    var gameTimer: Timer!
    var timeOfGem: Timer!
    var audioPlayer = AVAudioPlayer()
    let myDefault = UserDefaults.standard
    let defaultforSaveLevel = UserDefaults.standard
    var defaultNumGameLevels = 1
    
    //  MARK:- viewDidLoad()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         defaultNumGameLevels = defaultforSaveLevel.integer(forKey: "Cheak numer Level")
        self.myDefault.synchronize()

        switch defaultNumGameLevels  {
            
        case 1 :
             startLevlOne( nameBalground: "background.jpg")
             timer(timeLevl : 2)
             timeOfGem = Timer.scheduledTimer(timeInterval: 1 , target: self, selector:
                #selector( timeGemsAndScoreAndLevlsGame), userInfo: nil, repeats: true )
        case 2 :
            startLevlOne( nameBalground: "background.jpg" )
             timer(timeLevl : 1.5)
            TimeOfGem()
        case 3 :
            startLevlOne( nameBalground: "background.jpg" )
             timer(timeLevl : 1)
           TimeOfGem()
        case 4 :
            startLevlOne( nameBalground: "background.jpg")
             timer(timeLevl : 0.7)
            TimeOfGem()
            
        default:
            startLevlOne( nameBalground: "background.jpg")
             timer(timeLevl : 0.5)
            TimeOfGem()
        }
    
        if myDefault.integer(forKey: "Cheak numer Level") == 0 {
            
             //startLevlOne()
            
        }
       
        
    }
    
     //  MARK:- startLevlOne()
    
    func startLevlOne( nameBalground : String ){
        
        background = UIImageView(frame:CGRect(x: 0 , y: 0, width: 320, height: 568))
        background.image = UIImage(named: nameBalground)
        view.addSubview(background)
        
        self.myDefault.set( 0 , forKey: "Cheak Claik or not")
        self.myDefault.synchronize()
    
        timeGemsAndScoreAndLevlsGame()
        start()
        ImegInCorner()

        
    }
    
    
    //  MARK:- start()

    func start(){
 
        if scoreUser >= 5 {
            
            print(" go to level tow ...")
            self.gameTimer.invalidate()
            self.timeOfGem.invalidate()
            userAlertGoToLevelTow()
            numGameLevels = defaultNumGameLevels
            self.defaultforSaveLevel.set( defaultNumGameLevels + 1  , forKey: "Cheak numer Level")
            self.defaultforSaveLevel.synchronize()
           


            
        }
            
        else {
            
        print("start start start  ...")
        labelExtraPoint.removeFromSuperview()

        if onAndOf == 0 {
            
                checkIfUserDontCleckOnImge()

            createImgesGame()
            afterStart = 1

            self.myDefault.set( 1 , forKey: "Cheak Claik or not")
            self.myDefault.synchronize()
            
            
     }
        }
    }
    
    func checkIfUserDontCleckOnImge(){
        
        if  myDefault.integer(forKey: "Cheak Claik or not") == 1 &&  afterStart == 1 {
            
            if numRandomimg == 4 {
                
               print("GOOOD MAN !")
                
            } else {

            
            if numRandomimgCornr != numRandomimg {
                
                print("Mistake  ...")
                imgesMistake()
                
            }
                
            else {
                
                
                scoreUser += 2
                extraPoint()
                
            }
            
            }
            
        }

        
    }
    
    func TimeOfGem(){
        
        timeOfGem = Timer.scheduledTimer(timeInterval: 1 , target: self, selector:
            #selector( timeGemsAndScoreAndLevlsGame), userInfo: nil, repeats: true )
    }
    
    func timer(timeLevl : Double){
        
        gameTimer = Timer.scheduledTimer(timeInterval: timeLevl , target: self, selector:
            #selector(start), userInfo: nil, repeats: true )

        
    }
     //  MARK:- createImgesGame() & clickUser()
    
    func createImgesGame(){
   
        randomValueXPostion = randomValueBetween(min: 20, max: 250)
        randomValueYPostion = randomValueBetween(min: 50, max: 500)
        
        numRandomimg = randomValueBetween(min: 0, max: 4)
        
        myImegAsButton.frame = CGRect(x: randomValueXPostion, y: randomValueYPostion , width: 75, height: 75)
        myImegAsButton.setImage(UIImage(named: ArrayImegs[numRandomimg] )?.withRenderingMode(.alwaysOriginal) , for: .normal)
        self.view.addSubview(myImegAsButton)
        
        print("onAndOf onAndOf : \(onAndOf)")
        
        //
        
        myImegAsButton.addTarget(self,
                                 action: #selector(ViewController.clickUser(_:)),
                                 for: .touchUpInside)
        //
         myDefault.set(1, forKey: "Cheak Claik or not" )
        

        
       
    }
    
    
    
    func clickUser(_ sender: AnyObject) {
        
        
         self.gameTimer.invalidate()
        labelExtraPoint.removeFromSuperview()

        myImegAsButton.removeFromSuperview()
        myDefault.set(2, forKey: "Cheak Claik or not" )
        checkIfUserDontCleckOnImge()

        
        defaultNumGameLevels = defaultforSaveLevel.integer(forKey: "Cheak numer Level")
        self.myDefault.synchronize()
        
        switch defaultNumGameLevels  {
            
        case 1 :
            timer(timeLevl : 2)
            TimeOfGem()
        case 2 :
            timer(timeLevl : 1.5)
            TimeOfGem()
        case 3 :
            timer(timeLevl : 1)
            TimeOfGem()
        case 4 :
            timer(timeLevl : 0.7)
            TimeOfGem()
        default:
            timer(timeLevl : 0.5)
            TimeOfGem()
        }
        
        ifImgesRandomLikeImgCornr()
        
        
        audio(forResource: "click",Type: "mp3" )
       
        if numRandomimg == 4 {
            
            alartSentence = "click on Boom"
            print("Fnish Fnish Fnish .... ")
            self.gameTimer.invalidate()
            self.timeOfGem.invalidate()
            userAlert()

        }
        else {
            
            scoreUser += 1

        }
               createImgesGame()

    }

    
    //  MARK:- randomValueBetween()
    
    func randomValueBetween(min: Int, max: Int) -> Int {
        
        var a = min
        var b = max
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
    
    
     //  MARK:- ImegInCorner()
    
    func ImegInCorner(){
        
        numRandomimgCornr = randomValueBetween(min: 0, max: 3)
        imegInCorner = UIImageView(frame:CGRect(x: 262 , y: 50, width: 50, height: 50))
        imegInCorner.image = UIImage(named: ArrayImegs[numRandomimgCornr])
        self.view.addSubview(imegInCorner)
    }
  
     //  MARK:- imgesMistake()
    
    func imgesMistake(){
        
        imgesMistakes = UIImageView(frame:CGRect(x: siteImgMistak , y: 50, width: 50, height: 50))
        imgesMistakes.image = UIImage(named: ArrayImegs[numRandomimg])
        self.imageMstikArray.append(imgesMistakes)
        self.view.addSubview(imageMstikArray [accountMistaks])
        self.view.addSubview(imgesMistakes)
        siteImgMistak += 50
        accountMistaks += 1
         audio(forResource: "Error",Type: "wav" )
        if accountMistaks == 4 {
            
            
            print("Fnish Fnish Fnish .... ")
            self.gameTimer.invalidate()
            self.timeOfGem.invalidate()
//         onAndOf = 1
            userAlert()
        }
        
        
    }
    
     //  MARK:- ifImgesRandomLikeImgCornr()
    
    func ifImgesRandomLikeImgCornr(){
        
        if numRandomimg == numRandomimgCornr && afterStart == 1  {
            
            if myDefault.integer(forKey: "Cheak Claik or not") == 2 {
                
                alartSentence = "click like imge corner"
                print("Fnish Fnish Fnish .... ")
                self.gameTimer.invalidate()
                self.timeOfGem.invalidate()
                userAlert()
                
            }
                
            else {
                print("complet complet complet .... ")
                
            }
        }
        
        
    }
    
     //  MARK:- timeGemsAndScoreAndLevlsGame()
    
    func timeGemsAndScoreAndLevlsGame(){
        
        myLabelTime.removeFromSuperview()
        myLabelTime = UILabel(frame: CGRect(x: 30, y: 75, width: 100, height: 100) )
        myLabelTime.textColor = UIColor(red:0.19, green:0.18, blue:0.19, alpha:1.0)
        myLabelTime.text = "\(timeGame - 1 )"
        self.view.addSubview(myLabelTime)
        timeGame -= 1
        
        myLabelScore.removeFromSuperview()
        myLabelScore = UILabel(frame: CGRect(x: 220, y: 75, width: 100, height: 100) )
        myLabelScore.textColor = UIColor(red:0.19, green:0.18, blue:0.19, alpha:1.0)
        myLabelScore.text = "\(scoreUser)"
        self.view.addSubview(myLabelScore)
        
        labelGameLevels.removeFromSuperview()
        labelGameLevels = UILabel(frame: CGRect(x: 240, y: 80, width: 100, height: 100) )
        labelGameLevels.textColor = UIColor.gray
        labelGameLevels.text = "Level ..\(numGameLevels)"
        self.view.addSubview(labelGameLevels)

        if timeGame == 0 {
            audio(forResource: "timeFnish",Type: "wav" )
            alartSentence = "time Fnish"
            print("Fnish Fnish Fnish .... ")
//            onAndOf = 1
            self.gameTimer.invalidate()
            self.timeOfGem.invalidate()
            userAlert()
            
        }
        
    }
    
    //  MARK:- userAlert()
    
    func userAlert(){
        
        var myAlert = UIAlertController()
        
        switch alartSentence {
            
        case "click like imge corner":
            myAlert = UIAlertController(title: " غيرها بغيرها  !",
                                        message: "ليش تضغط على الصورة الممنوعة ؟\n درجتك = \(scoreUser)",
                                        preferredStyle: UIAlertControllerStyle.alert)
        case "time Fnish":
            myAlert = UIAlertController(title: " الوقت فنّش ",
                                        message: "  سرّع لعبك وحتفوز\n درجتك = \(scoreUser)",
                                        preferredStyle: UIAlertControllerStyle.alert)
             case "click on Boom" :
                myAlert = UIAlertController(title: " انفجااار ",
                                            message: " أنتبه تضغط على القنبلة مرة ثانية !\n درجتك = \(scoreUser)",
                    preferredStyle: UIAlertControllerStyle.alert)

            
        default:
            
            myAlert = UIAlertController(title: " وراك بطيء !! ",
                                        message: " أفا والله راحت عليك 4 صور ! ",
                                        preferredStyle: UIAlertControllerStyle.alert)
        }
        
        

        myAlert.addAction(UIAlertAction(title: " تتتحدى مرة ثانية ؟ ",
                                        style: UIAlertActionStyle.default,
                                        handler: { action in
                                            
                                       self.processingTheGameAgain()
                                           
        }))
        self.present(myAlert, animated: true , completion: nil)
        
        
    }
    //  MARK:- userAlertGoToLevelTow()

    func userAlertGoToLevelTow(){
        
        var myAlert = UIAlertController()
        
        myAlert = UIAlertController(title: "    Good | تعجبني ",
                                    message: " أنتبه المرحلة الجاية أسرع من هذي\n\nيالله كمل التحدي وروح للمرحلة الي بعدها ",
            preferredStyle: .alert)
        
        let image = UIImage(named: "img1.png")
        
        let action = UIAlertAction(title: " كمل التحدي ",
                                   style: .default,
                                   handler: { action in
                                    
                                    self.processingTheGameAgain()
                                    
        })
        
        action.setValue(image, forKey: "image")
        
        myAlert .addAction(action)
        
         self.present(myAlert, animated: true , completion: nil)
       // myAlert.addAction()
       
        
        
    }
    
    //  MARK:- processingTheGameAgain()

    func processingTheGameAgain(){
        
        self.imegInCorner.removeFromSuperview()
        self.accountMistaks = 0
        self.afterStart = 0
        self.scoreUser = 0
        self.siteImgMistak = 10
        self.numArrayImegs = 0
        self.timeGame = 15
        self.alartSentence = "nil"
        //
        self.myLabelTime.removeFromSuperview()
        self.imgesMistakes.removeFromSuperview()
        //
        self.numRandomimg = self.randomValueBetween(min: 0, max: 4)
        
        //
        for index in 0 ..< self.imageMstikArray.count {
            
            self.imageMstikArray[index].removeFromSuperview()
            
        }
        //
        self.start()
        self.ImegInCorner()
        self.timeGemsAndScoreAndLevlsGame()
        //
        
        defaultNumGameLevels = defaultforSaveLevel.integer(forKey: "Cheak numer Level")
        self.myDefault.synchronize()
        
        switch defaultNumGameLevels  {
            
        case 1 :
            timer(timeLevl : 2)
            TimeOfGem()
        case 2 :
            timer(timeLevl : 1.5)
            TimeOfGem()
        case 3 :
            timer(timeLevl : 1)
            TimeOfGem()
        case 4 :
            timer(timeLevl : 0.7)
            TimeOfGem()
        default:
            timer(timeLevl : 0.5)
            TimeOfGem()
        }
        
        
        self.timeOfGem = Timer.scheduledTimer(timeInterval: 1 , target: self, selector:
            #selector( self.timeGemsAndScoreAndLevlsGame), userInfo: nil, repeats: true )

        
    }

    //  MARK:- extraPoint()
    
    func extraPoint(){
        
              UIView.animate(withDuration: 0.8, delay: 0.1, options: [], animations: {

//
          self.labelExtraPoint = UILabel(frame: CGRect(x: self.randomValueXPostion, y: self.randomValueYPostion  , width: 40, height: 20) )

//
            }, completion: nil)
        
        labelExtraPoint.textColor = UIColor(red:0.89, green:0.71, blue:0.02, alpha:1.0)
        labelExtraPoint.text = "+100"
        self.view.addSubview(labelExtraPoint)
        
        audio(forResource: "100%",Type: "wav" )
    
        print("Frist !!  ...\(myDefault.integer(forKey: "randomValueXPostion"))++\(myDefault.integer(forKey: "randomValueYPostion"))")
        print(">> Secend !  ...\(randomValueXPostion)++\(randomValueYPostion)")

        
    }
    
     //  MARK:- audioFunc
    
    func audio(forResource : String , Type : String ) {
        
        let music = Bundle.main.path(forResource: forResource, ofType: Type)
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: (music)! ))
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            print("to paly sound")
            audioPlayer.play() // to paly sound
            // audioPlayer.stop() // to stop it
        }
        catch{
            
            print(error)
        }
        

    
    }
    
    }
    
    
    


