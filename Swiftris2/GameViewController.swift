//
//  GameViewController.swift
//  Swiftris2
//
//  Created by Elliott Barnes on 2020-05-30.
//  Copyright © 2020 Barnes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // create instance of GameScene
    
    var scene: GameScene!
    var swiftris: Swiftris!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuring the view
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        // creating & configuring the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
        scene.tick = didTick
        
        swiftris = Swiftris()
        swiftris.beginGame()
        
        // display scene
        skView.presentScene(scene)
        
        scene.addPreviewShapeToScene(shape: swiftris.nextShape!) {
            self.swiftris.nextShape?.moveTo(column: StartingColumn, row: StartingRow)
            self.scene.movePreviewShape(shape: self.swiftris.nextShape!) {
                let nextShapes = self.swiftris.newShape()
                self.scene.startTicking()
                self.scene.addPreviewShapeToScene(shape: nextShapes.nextShape!) {}
            }
        }
        
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func didTick() {
        swiftris.fallingShape?.lowerShapeByOneRow()
        scene.redrawShape(shape: swiftris.fallingShape!, completion: {})
    }
}
