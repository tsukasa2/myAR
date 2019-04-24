//
//  ViewController.swift
//  SolarSystem
//
//  Created by Nakamura Tsukasa on 2019/04/18.
//  Copyright © 2019 Nakamura Tsukasa. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var SceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sun = SCNNode(geometry: SCNSphere(radius: 0.20))
        sun.position = SCNVector3(0,0,-1)
        sun.geometry?.firstMaterial?.diffuse.contents = image
        sceneView.scene.rootNode.addChildNode(sun)
    }
    

}

