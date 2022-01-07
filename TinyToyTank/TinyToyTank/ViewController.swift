//
//  ViewController.swift
//  TinyToyTank
//
//  Created by nju on 2022/1/7.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor!.turret?.setParent(tankAnchor!.tank, preservingWorldTransform: true)
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(tankAnchor!)
    }
    
    
    @IBAction func forwordPressed(_ sender: Any) {
        tankAnchor!.notifications.tankForward.post()
    }
    
    @IBAction func tankLeftPressed(_ sender: Any) {
        tankAnchor!.notifications.tankLeft.post()
    }
    
    @IBAction func tankRightPressed(_ sender: Any) {
        tankAnchor!.notifications.tankRight.post()
    }
    
    @IBAction func turretLeftPressed(_ sender: Any) {
        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func turretRightPressed(_ sender: Any) {
        tankAnchor!.notifications.turretRight.post()
    }
    
    @IBAction func firePressed(_ sender: Any) {
        tankAnchor!.notifications.cannonFire.post()
    }
}
