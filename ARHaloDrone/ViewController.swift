//
//  ViewController.swift
//  ARHaloDrone
//
//  Created by Steve Sopoci on 1/19/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    var arHaloDroneAnchor: ARHaloDrone._ARHaloDrone?
    var isActionEngaged: Bool = false
    
    @IBOutlet var arView: ARView!
    
    @IBAction func turnLeftButton(_ sender: Any) {
        if self.isActionEngaged { return }
        else { self.isActionEngaged = true }
        arHaloDroneAnchor?.notifications.turnLeft.post()
    }
    
    @IBAction func turnRightButton(_ sender: Any) {
        if self.isActionEngaged { return }
        else { self.isActionEngaged = true }
        arHaloDroneAnchor?.notifications.turnRight.post()
    }
    
    @IBAction func moveForwardButton(_ sender: Any) {
        if self.isActionEngaged { return }
        else { self.isActionEngaged = true }
        arHaloDroneAnchor?.notifications.moveForward.post()
    }
    
    @IBAction func moveUpButton(_ sender: Any) {
        if self.isActionEngaged { return }
        else { self.isActionEngaged = true }
        arHaloDroneAnchor?.notifications.moveUp.post()
    }
    
    @IBAction func moveDownButton(_ sender: Any) {
        if self.isActionEngaged { return }
        else { self.isActionEngaged = true }
        arHaloDroneAnchor?.notifications.moveDown.post()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arHaloDroneAnchor = try! ARHaloDrone.load_ARHaloDrone()
        
        arHaloDroneAnchor?.actions.actionFinished.onAction = { _ in
          self.isActionEngaged = false
        }

        arView.scene.anchors.append(arHaloDroneAnchor!)
    }
}
