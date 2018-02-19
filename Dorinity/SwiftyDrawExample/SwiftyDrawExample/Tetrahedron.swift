//
//  Cube.swift
//  AnimateCube
//
//  Created by burt on 2016. 2. 28..
//  Copyright © 2016년 BurtK. All rights reserved.
//

import GLKit


class Tetrahedron1 : Model {
    let vertexList : [Vertex] = [
        
        // Front
        Vertex( 1, -1, 1,  1, 0, 0, 1,  1, 0), // 0 오른쪽 아래
        Vertex( 0,  1, 0,  0, 1, 0, 1,  0.5, 1), // 1
        //      Vertex(-1,  1, 1,  0, 0, 1, 1,  0, 1), // 2
        Vertex(-1, -1, 1,  0, 0, 0, 1,  0, 0) // 3
        
    ]
    
    let indexList : [GLubyte] = [
        
        // Front
        0, 1, 2,
        //     2, 3, 0
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


class Tetrahedron2 : Model {
    let vertexList : [Vertex] = [
        /// Right
        Vertex( 1, -1, -1, 1, 0, 0, 1,  0, 0), // 12
        Vertex( 0,  1, 0, 0, 1, 0, 1,  1, 0.5), // 13
        //       Vertex( 1,  1,  1, 0, 0, 1, 1,  0, 1), // 14
        Vertex( 1, -1,  1, 0, 0, 0, 1,  0, 1), // 15
    ]
    
    let indexList : [GLubyte] = [
        // Right
        0, 1, 2,
        //      2, 3, 0
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


class Tetrahedron3 : Model {
    let vertexList : [Vertex] = [
        
        // Back
        Vertex(-1, -1, -1, 0, 0, 1, 1,  0, 1), // 4
        //     Vertex(-1,  1, -1, 0, 1, 0, 1,  1, 1), // 5
        Vertex( 0,  1, 0, 1, 0, 0, 1,  0.5, 0), // 6
        Vertex( 1, -1, -1, 0, 0, 0, 1,  1, 1)// 7
        
        
    ]
    
    let indexList : [GLubyte] = [
        // Back
        0, 1, 2,
        //    2, 3, 0
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

class Tetrahedron4 : Model {
    let vertexList : [Vertex] = [
        /// Left
        Vertex(-1, -1,  1, 1, 0, 0, 1,  1, 1), // 8
        Vertex(0,  1,  0, 0, 1, 0, 1,  0, 0.5), // 9
        //    Vertex(-1,  1, -1, 0, 0, 1, 1,  0, 1), // 10
        Vertex(-1, -1, -1, 0, 0, 0, 1,  1, 0), // 11 왼쪽 아래
    ]
    
    let indexList : [GLubyte] = [
        // Left
        0, 1, 2,
        //     2, 3, 0
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

class Tetrahedron5 : Model {
    let vertexList : [Vertex] = [
        
        // Bottom
        Vertex( 1, -1, -1, 1, 0, 0, 1,  1, 0), // 20
        Vertex( 1, -1,  1, 0, 1, 0, 1,  1, 1), // 21
        Vertex(-1, -1,  1, 0, 0, 1, 1,  0, 1), // 22
        Vertex(-1, -1, -1, 0, 0, 0, 1,  0, 0), // 23
        
        
    ]
    
    let indexList : [GLubyte] = [
        // Bottom
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



