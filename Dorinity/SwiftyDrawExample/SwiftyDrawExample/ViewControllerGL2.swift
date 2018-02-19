//
//  ViewController.swift
//  Texture
//
//  Created by burt on 2016. 2. 29..
//  Copyright © 2016년 BurtK. All rights reserved.
//

import UIKit
import GLKit

class GLKUpdater : NSObject, GLKViewControllerDelegate {
    
    weak var glkViewController : ViewControllerGL!
    
    init(glkViewController : ViewControllerGL) {
        self.glkViewController = glkViewController
    }
    
    
    func glkViewControllerUpdate(_ controller: GLKViewController) {
        //self.glkViewController.cube.updateWithDelta(self.glkViewController.timeSinceLastUpdate)
    }
    func viewUpdate(_ dtY: CGFloat, _ dtZ: CGFloat){
        self.glkViewController.cube1.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube2.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube3.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube4.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube5.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube6.updateWithDelta(dtY, dtZ)
    }
}

class GLKUpdater2 : NSObject, GLKViewControllerDelegate {
    
    weak var glkViewController : ViewControllerGL!
    
    init(glkViewController : ViewControllerGL) {
        self.glkViewController = glkViewController
    }
    
    
    func glkViewControllerUpdate(_ controller: GLKViewController) {
        //self.glkViewController.cube.updateWithDelta(self.glkViewController.timeSinceLastUpdate)
    }
    func viewUpdate(_ dtY: CGFloat, _ dtZ: CGFloat){
        self.glkViewController.cube1.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube2.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube3.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube4.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube5.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube6.updateWithDelta(dtY, dtZ)
    }
}

class GLKUpdater3 : NSObject, GLKViewControllerDelegate {
    
    weak var glkViewController : ViewControllerGL!
    
    init(glkViewController : ViewControllerGL) {
        self.glkViewController = glkViewController
    }
    
    
    func glkViewControllerUpdate(_ controller: GLKViewController) {
        //self.glkViewController.cube.updateWithDelta(self.glkViewController.timeSinceLastUpdate)
    }
    func viewUpdate(_ dtY: CGFloat, _ dtZ: CGFloat){
        self.glkViewController.cube1.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube2.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube3.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube4.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube5.updateWithDelta(dtY, dtZ)
        self.glkViewController.cube6.updateWithDelta(dtY, dtZ)
    }
}


class ViewControllerGL: GLKViewController {
    @IBAction func buttonClick(_ sender: UIButton) {
        //imageView = takeScreenshot(view: self.view)
        // self.performSegue(withIdentifier: "segNext", sender: <#T##Any?#>)
    }
    
    var glkView: GLKView!
    var glkUpdater: GLKUpdater!
    var shader : BaseEffect!
    var square : Square!
    var cube : Cube!
    var cube1 : Cube1!
    var cube2 : Cube2!
    var cube3 : Cube3!
    var cube4 : Cube4!
    var cube5 : Cube5!
    var cube6 : Cube6!
    var tetrahedron1 : Tetrahedron1!
    var tetrahedron2 : Tetrahedron2!
    var tetrahedron3 : Tetrahedron3!
    var tetrahedron4 : Tetrahedron4!
    var tetrahedron5 : Tetrahedron5!
    var triangluarPole1 : TriangularPole1!
    var triangluarPole2 : TriangularPole2!
    var triangluarPole3 : TriangularPole3!
    var triangluarPole4 : TriangularPole4!
    var triangluarPole5 : TriangularPole5!
    
    
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGLcontext()
        setupGLupdater()
        setupScene()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        
        //Transfomr4: Viewport: Normalized -> Window
        //glViewport(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
        //이건 GLKit이 자동으로 해준다
        glClearColor(1.0, 1.0, 1.0, 1.0);
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
        
        glEnable(GLenum(GL_DEPTH_TEST))
        glEnable(GLenum(GL_CULL_FACE))
        glEnable(GLenum(GL_BLEND))
        glBlendFunc(GLenum(GL_SRC_ALPHA), GLenum(GL_ONE_MINUS_SRC_ALPHA))
        
        let viewMatrix : GLKMatrix4 = GLKMatrix4MakeTranslation(0, 0, -7)
        //self.square.renderWithParentMoelViewMatrix(viewMatrix)
        //   self.cube.renderWithParentMoelViewMatrix(viewMatrix)
        self.cube1.renderWithParentMoelViewMatrix(viewMatrix)
        self.cube2.renderWithParentMoelViewMatrix(viewMatrix)
        self.cube3.renderWithParentMoelViewMatrix(viewMatrix)
        self.cube4.renderWithParentMoelViewMatrix(viewMatrix)
        self.cube5.renderWithParentMoelViewMatrix(viewMatrix)
        self.cube6.renderWithParentMoelViewMatrix(viewMatrix)
    }
    
    
}

extension ViewControllerGL {
    
    func setupGLcontext() {
        glkView = self.view as! GLKView
        glkView.context = EAGLContext(api: .openGLES2)!
        glkView.drawableDepthFormat = .format16         // for depth testing
        EAGLContext.setCurrent(glkView.context)
    }
    
    func setupGLupdater() {
        self.glkUpdater = GLKUpdater(glkViewController: self)
        self.delegate = self.glkUpdater
    }
    
    func setupScene() {
        self.shader = BaseEffect(vertexShader: "SimpleVertexShader.glsl", fragmentShader: "SimpleFragmentShader.glsl")
        
        self.shader.projectionMatrix = GLKMatrix4MakePerspective(
            GLKMathDegreesToRadians(85.0),
            GLfloat(self.view.bounds.size.width / self.view.bounds.size.height),
            1,
            150)
        
        //  self.cube = Cube(shader: self.shader)
        
        self.cube1 = Cube1(shader: self.shader, image_url: "test2.png")
        self.cube2 = Cube2(shader: self.shader, image_url: "test4.png")
        self.cube3 = Cube3(shader: self.shader, image_url: "test1.png")
        self.cube4 = Cube4(shader: self.shader, image_url: "test3.png")
        self.cube5 = Cube5(shader: self.shader, image_url: "test5.png")
        self.cube6 = Cube6(shader: self.shader, image_url: "test6.png")
        
    }
    
    func updateScene() {
        
        self.cube1.loadTexture("test2.png")
        self.cube2.loadTexture("test4.png")
        self.cube3.loadTexture("test1.png")
        self.cube4.loadTexture("test3.png")
        self.cube5.loadTexture("test5.png")
        self.cube6.loadTexture("test6.png")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchLocation = touch.location(in: self.view)
        print("3d : \(touchLocation)")
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchLocation = touch.location(in: self.view)
        let previousLocation = touch.previousLocation(in: self.view)
        
        
        var locationX = touchLocation.x - previousLocation.x
        var locationY = touchLocation.y - previousLocation.y
        self.glkUpdater.viewUpdate(locationX*0.01, locationY*0.01)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}


