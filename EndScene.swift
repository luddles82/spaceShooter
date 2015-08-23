//
//  EndScene.swift
//  spaceShooter
//
//  Created by Nick Ludlow on 22/08/2015.
//  Copyright (c) 2015 Nick Ludlow. All rights reserved.
//

import Foundation
import SpriteKit

class EndScene : SKScene {
    
    var RestartBtn : UIButton!
    var HighScore : Int!
    var ScoreLbl : UILabel!
    var HighScoreLbl : UILabel!

    override func didMoveToView(view: SKView) {
        scene?.backgroundColor = UIColor.whiteColor()
        
        RestartBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: 30))
        RestartBtn.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.width/7)
        
        RestartBtn.setTitle("Restart", forState: UIControlState.Normal)
        RestartBtn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        RestartBtn.addTarget(self, action: Selector("Restart"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view?.addSubview(RestartBtn)
        
        
        var ScoreDefault = NSUserDefaults.standardUserDefaults()
        var Score = ScoreDefault.valueForKey("Score") as! NSInteger
        NSLog("\(Score)")
        
        var HighScoreDefault = NSUserDefaults.standardUserDefaults()
        HighScore = HighScoreDefault.valueForKey("HighScore") as! NSInteger
        
        ScoreLbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 15, height: 30))
        ScoreLbl.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.width/4)
        ScoreLbl.text = "\(Score)"
        self.view?.addSubview(ScoreLbl)
        
        HighScoreLbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 15, height: 30))
        HighScoreLbl.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.width/2)
        HighScoreLbl.text = "\(HighScore)"
        self.view?.addSubview(HighScoreLbl)
        
        NSLog("\(HighScore)")
        
    }

    func Restart(){
        self.view?.presentScene(GameScene(size: view!.frame.size), transition: SKTransition.crossFadeWithDuration(0.3))
        RestartBtn.removeFromSuperview()
        HighScoreLbl.removeFromSuperview()
        ScoreLbl.removeFromSuperview()
        
    }

}
 