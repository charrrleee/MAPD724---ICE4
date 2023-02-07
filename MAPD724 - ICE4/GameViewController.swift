//
//  GameViewController.swift
//  MAPD724 - ICE3
//
//  Created by Charlene Cheung on 30/1/2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    
    @IBOutlet weak var StartLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var EndLabel: UILabel!
    
    @IBOutlet weak var EndButton: UIButton!
    var currentScene: GKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene()
        
        setScene(sceneName: "StartScene")
        
        // Initialize the Lives and Score
        CollisionManager.gameViewController = self
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFit
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    func presentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartLabel.isHidden = false
        EndLabel.isHidden = true
        EndButton.isHidden = true
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        setScene(sceneName: "EndScene")
    }
    
    @IBAction func startButton_Pressed(_ sender: Any) {
        StartButton.isHidden = true
        StartLabel.isHidden = true
        LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
        
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    @IBAction func restartButton_Pressed(_ sender: Any) {
        
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        EndLabel.isHidden = true
        EndButton.isHidden = true
        
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
}
