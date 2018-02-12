//
//  Cube.swift
//  AnimateCube
//
//  Created by burt on 2016. 2. 28..
//  Copyright © 2016년 BurtK. All rights reserved.
//

import GLKit

class Cube : Model {
    let vertexList : [Vertex] = [
        
        // Front
        Vertex( 1, -1, 1,  1, 0, 0, 1,  1, 0), // 0
        Vertex( 1,  1, 1,  0, 1, 0, 1,  1, 1), // 1
        Vertex(-1,  1, 1,  0, 0, 1, 1,  0, 1), // 2
        Vertex(-1, -1, 1,  0, 0, 0, 1,  0, 0), // 3
        
        // Back
        Vertex(-1, -1, -1, 0, 0, 1, 1,  1, 0), // 4
        Vertex(-1,  1, -1, 0, 1, 0, 1,  1, 1), // 5
        Vertex( 1,  1, -1, 1, 0, 0, 1,  0, 1), // 6
        Vertex( 1, -1, -1, 0, 0, 0, 1,  0, 0), // 7
        
        // Left
        Vertex(-1, -1,  1, 1, 0, 0, 1,  1, 0), // 8
        Vertex(-1,  1,  1, 0, 1, 0, 1,  1, 1), // 9
        Vertex(-1,  1, -1, 0, 0, 1, 1,  0, 1), // 10
        Vertex(-1, -1, -1, 0, 0, 0, 1,  0, 0), // 11
        
        // Right
        Vertex( 1, -1, -1, 1, 0, 0, 1,  1, 0), // 12
        Vertex( 1,  1, -1, 0, 1, 0, 1,  1, 1), // 13
        Vertex( 1,  1,  1, 0, 0, 1, 1,  0, 1), // 14
        Vertex( 1, -1,  1, 0, 0, 0, 1,  0, 0), // 15
        
        // Top
        Vertex( 1,  1,  1, 1, 0, 0, 1,  1, 0), // 16
        Vertex( 1,  1, -1, 0, 1, 0, 1,  1, 1), // 17
        Vertex(-1,  1, -1, 0, 0, 1, 1,  0, 1), // 18
        Vertex(-1,  1,  1, 0, 0, 0, 1,  0, 0), // 19
        
        // Bottom
        Vertex( 1, -1, -1, 1, 0, 0, 1,  1, 0), // 20
        Vertex( 1, -1,  1, 0, 1, 0, 1,  1, 1), // 21
        Vertex(-1, -1,  1, 0, 0, 1, 1,  0, 1), // 22
        Vertex(-1, -1, -1, 0, 0, 0, 1,  0, 0), // 23
        
    ]
    
    let indexList : [GLubyte] = [
        
        // Front
        0, 1, 2,
        2, 3, 0,
        
        // Back
        4, 5, 6,
        6, 7, 4,
        
        // Left
        8, 9, 10,
        10, 11, 8,
        
        // Right
        12, 13, 14,
        14, 15, 12,
        
        // Top
        16, 17, 18,
        18, 19, 16,
        
        // Bottom
        20, 21, 22,
        22, 23, 20
    ]
    let indexList1 : [GLubyte] = [
    0, 1, 2,
    2, 3, 0
    ]
    init(shader: BaseEffect) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList1)
        self.loadTexture("razewarelogo_128.png")
    }
    
    override func updateWithDelta(_ dt: TimeInterval) {
        self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }

}

//
//  Cube.swift
//  AnimateCube
//
//  Created by burt on 2016. 2. 28..
//  Copyright © 2016년 BurtK. All rights reserved.
//


class Cube1 : Model {
    let vertexList : [Vertex] = [
        
        // Front
        Vertex( 1, -1, 1,  1, 0, 0, 1,  1, 0), // 0
        Vertex( 1,  1, 1,  0, 1, 0, 1,  1, 1), // 1
        Vertex(-1,  1, 1,  0, 0, 1, 1,  0, 1), // 2
        Vertex(-1, -1, 1,  0, 0, 0, 1,  0, 0) // 3
        
    ]
    
    let indexList : [GLubyte] = [
        
        // Front
        0, 1, 2,
        2, 3, 0
    ]

    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    
    override func updateWithDelta(_ dt: TimeInterval) {
    //    self.rotationX = self.rotationX + Float(Double.pi*dt)
    //    self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }
    
}

//
//  Cube.swift
//  AnimateCube
//
//  Created by burt on 2016. 2. 28..
//  Copyright © 2016년 BurtK. All rights reserved.
//

class Cube2 : Model {
    let vertexList : [Vertex] = [
        
        // Back
        Vertex(-1, -1, -1, 0, 0, 1, 1,  1, 0), // 4
        Vertex(-1,  1, -1, 0, 1, 0, 1,  1, 1), // 5
        Vertex( 1,  1, -1, 1, 0, 0, 1,  0, 1), // 6
        Vertex( 1, -1, -1, 0, 0, 0, 1,  0, 0)// 7
        
        
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
    override func updateWithDelta(_ dt: TimeInterval) {
     //   self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }
    
}

class Cube3 : Model {
    let vertexList : [Vertex] = [
        /// Left
        Vertex(-1, -1,  1, 1, 0, 0, 1,  1, 0), // 8
        Vertex(-1,  1,  1, 0, 1, 0, 1,  1, 1), // 9
        Vertex(-1,  1, -1, 0, 0, 1, 1,  0, 1), // 10
        Vertex(-1, -1, -1, 0, 0, 0, 1,  0, 0), // 11
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
    
    override func updateWithDelta(_ dt: TimeInterval) {
      //  self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }
    
}

class Cube4 : Model {
    let vertexList : [Vertex] = [
        /// Right
        Vertex( 1, -1, -1, 1, 0, 0, 1,  1, 0), // 12
        Vertex( 1,  1, -1, 0, 1, 0, 1,  1, 1), // 13
        Vertex( 1,  1,  1, 0, 0, 1, 1,  0, 1), // 14
        Vertex( 1, -1,  1, 0, 0, 0, 1,  0, 0), // 15
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
    
    override func updateWithDelta(_ dt: TimeInterval) {
     //   self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }
    
}

class Cube5 : Model {
    let vertexList : [Vertex] = [
        // Top
        Vertex( 1,  1,  1, 1, 0, 0, 1,  1, 0), // 16
        Vertex( 1,  1, -1, 0, 1, 0, 1,  1, 1), // 17
        Vertex(-1,  1, -1, 0, 0, 1, 1,  0, 1), // 18
        Vertex(-1,  1,  1, 0, 0, 0, 1,  0, 0), // 19
    ]
    
    let indexList : [GLubyte] = [
        // Top
        0, 1, 2,
        2, 3, 0
    ]
    init(shader: BaseEffect, image_url: String) {
        super.init(name: "cube", shader: shader, vertices: vertexList, indices: indexList)
        //self.loadTexture("razewarelogo_128.png")
        self.loadTexture(image_url)
    }
    
    override func updateWithDelta(_ dt: TimeInterval) {
      //  self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }
    
}

class Cube6 : Model {
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
    
    override func updateWithDelta(_ dt: TimeInterval) {
     //   self.rotationZ = self.rotationZ + Float(Double.pi*dt)
        self.rotationY = self.rotationY + Float(Double.pi*dt)
    }
    
}




