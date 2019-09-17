//
//  ViewController.swift
//  AR Cubes
//
//  Created by Ishan Madan on 9/16/19.
//  Copyright © 2019 Ishan Madan. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Container to hold all of the 3D geometry
        let scene = SCNScene();
        
        // The 3D cube geometry we want to draw
        let boxGeometry = SCNBox();
        boxGeometry.height = 0.1;
        boxGeometry.width = 0.1;
        boxGeometry.length = 0.1;
        boxGeometry.chamferRadius = 0.0;
        
        // The node that wraps the geometry so we can add it to the scene
        let boxNode = SCNNode(geometry: boxGeometry);
        
        // Position the box just in front of the camera
        boxNode.position = SCNVector3Make(0, 0, -0.5);
        
        // rootNode is a special node, it is the starting point of all the items in the 3D scene
        scene.rootNode.addChildNode(boxNode);
        
        self.sceneView.scene = scene;
        self.sceneView.autoenablesDefaultLighting = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
