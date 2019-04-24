//
//  ViewController.swift
//  put2
//
//  Created by Nakamura Tsukasa on 2019/04/19.
//  Copyright © 2019 Nakamura Tsukasa. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainSceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    var selectedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        registerGestureRecognizers()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize(){
        self.mainSceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.mainSceneView.session.run(configuration)
        self.mainSceneView.automaticallyUpdatesLighting = true
    }
    
    func registerGestureRecognizers(){
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(tapped))
        self.mainSceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
   @objc func tapped(sender: UITapGestureRecognizer){
        let sceneView = sender.view as! ARSCNView
        let tapLocation = sender.location(in: sceneView)
        
        let hitTest = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        if !hitTest.isEmpty {
            // タップした箇所が取得できていればitemを追加
            if hitTest.first != nil {
                self.addItem(hitTestResult: hitTest.first!)
            }
        }
    }
    
    /// アイテム配置メソッド
    func addItem(hitTestResult: ARHitTestResult) {
        if let selectedItem = self.selectedItem {
            
            // アセットのより、シーンを作成
            let scene = SCNScene(named: "models.scnassets/\(selectedItem).scn")
            //let scene = SCNScene(named: "models.scnassets/glass_model.scn")
            
            // ノード作成
            let node = (scene?.rootNode.childNode(withName: "Spider_Armature", recursively: false))!
            
            // 現実世界の座標を取得
            let transform = hitTestResult.worldTransform
            let thirdColumn = transform.columns.3
            
            // アイテムの配置
            node.position = SCNVector3(thirdColumn.x, thirdColumn.y, thirdColumn.z)
            self.mainSceneView.scene.rootNode.addChildNode(node)
        }
    }
    
    
    @IBAction func spiderButtonTapped(_ sender: Any) {
        selectedItem = "spider_model"
     }
    @IBAction func cupButtonTapped(_ sender: Any) {
        selectedItem = "cup"
    }
    
    @IBAction func wineButtonTapped(_ sender: Any) {
        selectedItem = "wine_glass"
    }
}

/*import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene(named: "models.scnassets/spider_model.scn")!
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
}
*/
