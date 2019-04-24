import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myArSceneView: ARSCNView!
    
    override var prefersStatusBarHidden: Bool { return true }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .slide }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mySession = ARSession()
        myArSceneView.session = mySession
        
        myArSceneView.showsStatistics = true
        myArSceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let configuration = ARWorldTrackingConfiguration()
        myArSceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        myArSceneView.session.pause()
    }
    
}
