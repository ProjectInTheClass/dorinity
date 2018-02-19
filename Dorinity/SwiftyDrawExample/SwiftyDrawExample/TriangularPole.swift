//
//  TriangularPole.swift
//  SwiftyDrawExample
//
//  Created by mme on 2018. 2. 19..
//  Copyright © 2018년 Walzy. All rights reserved.
//

import GLKit

class TriangularPole1 : Model {
    let vertexList : [Vertex] = [
        /// Left
        Vertex(1, -1.5,  1, 1, 0, 0, 1,  1, 1), // 8
        Vertex(1,  1.5,  1, 0, 1, 0, 1,  0, 1), // 9
        Vertex(-1,  1.5, -1, 0, 0, 1, 1,  0, 0), // 10
        Vertex(-1, -1.5, -1, 0, 0, 0, 1,  1, 0), // 11
    ]
    
    let indexList : [GLubyte] = [
        // Left
        0, 1, 2,
        2, 3, 0
    ]
    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    
    override func updateWithDelta(_ dtY: CGFloat, _ dtZ: CGFloat) {
        self.rotationZ = self.rotationZ + Float(CGFloat.pi*dtZ)
        self.rotationY = self.rotationY + Float(CGFloat.pi*dtY)
    }
}
class TriangularPole2 : Model {
    let vertexList : [Vertex] = [
        
        // Back
        Vertex(-1, -1.5, -1, 0, 0, 1, 1,  1, 1), // 4
        Vertex(-1,  1.5, -1, 0, 1, 0, 1,  0, 1), // 5
        Vertex( 1,  1.5, -1, 1, 0, 0, 1,  0, 0), // 6
        Vertex( 1, -1.5, -1, 0, 0, 0, 1,  1, 0)// 7
        
        
    ]
    
    let indexList : [GLubyte] = [
        // Back
        0, 1, 2,
        2, 3, 0
    ]
    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    override func updateWithDelta(_ dtY: CGFloat, _ dtZ: CGFloat) {
        self.rotationZ = self.rotationZ + Float(CGFloat.pi*dtZ)
        self.rotationY = self.rotationY + Float(CGFloat.pi*dtY)
    }
}


class TriangularPole3 : Model {
    let vertexList : [Vertex] = [
        /// Right
        Vertex( 1, -1.5, -1, 1, 0, 0, 1,  1, 1), // 12
        Vertex( 1,  1.5, -1, 0, 1, 0, 1,  0, 1), // 13
        Vertex( 1,  1.5,  1, 0, 0, 1, 1,  0, 0), // 14
        Vertex( 1, -1.5,  1, 0, 0, 0, 1,  1, 0), // 15
    ]
    
    let indexList : [GLubyte] = [
        // Right
        0, 1, 2,
        2, 3, 0
    ]
    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    
    override func updateWithDelta(_ dtY: CGFloat, _ dtZ: CGFloat) {
        self.rotationZ = self.rotationZ + Float(CGFloat.pi*dtZ)
        self.rotationY = self.rotationY + Float(CGFloat.pi*dtY)
    }
}
class TriangularPole4 : Model {
    let vertexList : [Vertex] = [
        // Top
        Vertex( 1,  1.5,  1, 1, 0, 0, 1,  0, 0), // 16
        Vertex( 1,  1.5, -1, 0, 1, 0, 1,  1, 0), // 17
        Vertex(-1,  1.5, -1, 0, 0, 1, 1,  1, 1), // 18
    ]
    
    let indexList : [GLubyte] = [
        // Top
        0, 1, 2,
        ]
    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    
    override func updateWithDelta(_ dtY: CGFloat, _ dtZ: CGFloat) {
        self.rotationZ = self.rotationZ + Float(CGFloat.pi*dtZ)
        self.rotationY = self.rotationY + Float(CGFloat.pi*dtY)
    }
}
class TriangularPole5 : Model {
    let vertexList : [Vertex] = [
        
        // Bottom
        Vertex( 1, -1.5, -1, 1, 0, 0, 1,  0, 0), // 20
        Vertex( 1, -1.5,  1, 0, 1, 0, 1,  1, 0), // 21
        Vertex(-1, -1.5, -1, 0, 0, 0, 1,  0, 1), // 23
        
        
    ]
    
    let indexList : [GLubyte] = [
        // Bottom
        0, 1, 2,
        ]
    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    
    override func updateWithDelta(_ dtY: CGFloat, _ dtZ: CGFloat) {
        self.rotationZ = self.rotationZ + Float(CGFloat.pi*dtZ)
        self.rotationY = self.rotationY + Float(CGFloat.pi*dtY)
    }
}
