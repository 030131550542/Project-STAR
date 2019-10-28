//
//  PortalsViewController.swift
//  Star
//
//  Created by Токтаганов Турлыхан on 10/19/19.
//  Copyright © 2019 Токтаганов Турлыхан. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
class PortalsViewController: UIViewController, ARSCNViewDelegate {
    
    
    var index = 0
    var names = ["Mars","Moon","Venus"]
    
    @IBOutlet weak var arView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the view's delegate
        arView.delegate = self
        
        // Show statistics such as fps and timing information
        arView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        arView.scene = scene
        setVideo(title: "Mars"); setVideo(title: "Moon"); setVideo(title: "Venus")
        
    }
    func setVideo(title: String) {
        var node = arView.scene.rootNode.childNode(withName: title, recursively: true)
        var spriteKitScene = SKScene(size: CGSize(width: arView.frame.width, height: arView.frame.height))
        spriteKitScene.scaleMode = .aspectFit
        
        let videoUrl  = Bundle.main.url(forResource: node!.name, withExtension: "mp4")
        let videoPlayer = AVPlayer(url: videoUrl!)
        let videoSpriteKitNode = SKVideoNode(avPlayer:videoPlayer)
        videoSpriteKitNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        videoSpriteKitNode.size = spriteKitScene.size
        videoSpriteKitNode.yScale = -1.0
        videoSpriteKitNode.play()
        spriteKitScene.addChild(videoSpriteKitNode)
        node!.geometry?.firstMaterial?.isDoubleSided = true
        node!.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let configuration = ARWorldTrackingConfiguration()
        
        arView.session.run(configuration)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        arView.session.pause()
    }
}
