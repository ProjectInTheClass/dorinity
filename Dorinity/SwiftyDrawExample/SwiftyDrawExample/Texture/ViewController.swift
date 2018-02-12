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
    
    weak var glkViewController : ViewController!
    
    init(glkViewController : ViewController) {
        self.glkViewController = glkViewController
    }
    
    
    func glkViewControllerUpdate(_ controller: GLKViewController) {
        //self.glkViewController.cube.updateWithDelta(self.glkViewController.timeSinceLastUpdate)
        self.glkViewController.cube1.updateWithDelta(self.glkViewController.timeSinceLastDraw)
        self.glkViewController.cube2.updateWithDelta(self.glkViewController.timeSinceLastDraw)
        self.glkViewController.cube3.updateWithDelta(self.glkViewController.timeSinceLastDraw)
        self.glkViewController.cube4.updateWithDelta(self.glkViewController.timeSinceLastDraw)
        self.glkViewController.cube5.updateWithDelta(self.glkViewController.timeSinceLastDraw)
        self.glkViewController.cube6.updateWithDelta(self.glkViewController.timeSinceLastDraw)
    }
}


class ViewController: GLKViewController {
    @IBAction func buttonClick(_ sender: UIButton) {
        imageView = takeScreenshot(view: self.view)
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
        glClearColor(0, 0, 0, 1.0);
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
        
        glEnable(GLenum(GL_DEPTH_TEST))
        glEnable(GLenum(GL_CULL_FACE))
        glEnable(GLenum(GL_BLEND))
        glBlendFunc(GLenum(GL_SRC_ALPHA), GLenum(GL_ONE_MINUS_SRC_ALPHA))
        
        let viewMatrix : GLKMatrix4 = GLKMatrix4MakeTranslation(0, 0, -10)
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

extension ViewController {
    
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
        self.cube1 = Cube1(shader: self.shader, image_url: "dice1.png")
        self.cube2 = Cube2(shader: self.shader, image_url: "dice2.png")
        self.cube3 = Cube3(shader: self.shader, image_url: "dice3.png")
        self.cube4 = Cube4(shader: self.shader, image_url: "dice4.png")
        self.cube5 = Cube5(shader: self.shader, image_url: "dice5.png")
        self.cube6 = Cube6(shader: self.shader, image_url: "dice6.png")
        
    }

    func takeScreenshot(view: UIView) -> UIImageView {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        return UIImageView(image: image)
    }
}
