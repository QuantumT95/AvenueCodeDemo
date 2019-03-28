//
//  ViewController+ARSCNViewDelegate.swift
//  AvenueCodeDemo01
//
//  Created by Charlie Tran on 11/15/18.
//  Copyright © 2018 QuantumIndustries. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

extension ViewController : ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
            print("Plane Surface detected")
        
//            let planeNode = createNode(planeAnchor: planeAnchor)
//            node.addChildNode(planeNode)
//
        let focusSquare = FocusSquare()
        node.addChildNode(focusSquare)
    }
    
    func createNode(planeAnchor: ARPlaneAnchor) -> SCNNode {
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        plane.firstMaterial?.diffuse.contents = UIImage(named: "grid")
        plane.firstMaterial?.isDoubleSided = true
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        planeNode.simdPosition = planeAnchor.center
        planeNode.eulerAngles.x = GLKMathRadiansToDegrees(-90)
        return planeNode
    }
}
