import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene(named: "models.scnassets/eevee/eevee.scn")!
        //let scene = SCNScene()
        let eeveeNode = scene.rootNode.childNode(withName: "eevee_model", recursively: true)
        let (min, max) = (eeveeNode?.boundingBox)!
        let w = CGFloat(max.x - min.x)
        let magnification = 0.3/w
        eeveeNode?.scale = SCNVector3(magnification, magnification, magnification)
        eeveeNode?.position = SCNVector3(0,0,0)
        //eeveeNode?.scale = SCNVector3(0.5, 0.5, 0.5)
        sceneView.scene.rootNode.addChildNode(eeveeNode!)
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
        //sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    /*func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor){
        guard let planeAnchor = anchor as? ARPlaneAnchor else { fatalError() }
        guard let scene = SCNScene(named: "eevee.scn", inDirectory: "models.scnassets/eevee")
            else{ fatalError() }
        guard let eeveeNode = scene.rootNode.childNode(withName: "pm0133_00", recursively: true)
            else{ fatalError() }
        let (min,max) = eeveeNode.boundingBox
        let w = CGFloat(max.x - min.x)
        let magnification = 0.01/w
        eeveeNode.scale = SCNVector3(magnification, magnification, magnification)
        //eeveeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
        eeveeNode.position = SCNVector3(0, 0, -1)
        
        DispatchQueue.main.async(execute: {
            node.addChildNode(eeveeNode)
        })
    }*/
}


