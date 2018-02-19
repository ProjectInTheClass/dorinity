/*Copyright (c) 2016, Andrew Walz.
 
 Redistribution and use in source and binary forms, with or without modification,are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
 BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */

import UIKit
import GLKit


class ViewController: UIViewController, SwiftyDrawViewDelegate {
    @IBOutlet var entireView: UIView!
    
    @IBOutlet weak var testView2: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var drawView2: UIView! //이걸 도면 구역만큼 만들어야하지않나?
    @IBOutlet weak var testView: UIImageView!
    var selectedIdx : Int?
    var drawView : SwiftyDrawView! //class 이것도 도면 구역만큼 있어야함. 아니면 좌표로 그리기제한
    var redButton : ColorButton!
    var greenButton : ColorButton!
    var blueButton : ColorButton!
    var orangeButton : ColorButton!
    var purpleButton : ColorButton!
    var yellowButton : ColorButton!
    var blackButton : ColorButton!
    var brownButton : ColorButton!
    var whiteButton : ColorButton!
    var transparentButton : ColorButton!
    var lineButton : ColorButton!
    var undoButton : UIButton!
    var deleteButton : UIButton!
    var lineWidthSlider : UISlider!
    var opacitySlider : UISlider!
    let openGlViewController = ViewControllerGL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 3
        
        //drawView = SwiftyDrawView(frame: self.view.frame)
        
        if let selectedIdx = selectedIdx {
            switch selectedIdx {
            case 0 :
                print("0")
                drawView = SwiftyDrawView(frame: drawView2.frame)
                drawView.setId(0)
                drawView.delegate = self
                print("0000")
                let _ = openGlViewController.view
                print("0000")
                openGlViewController.glkView.frame = containerView.bounds
                print("0000")
                containerView.addSubview(openGlViewController.glkView)
                print("0000")
                self.view.addSubview(drawView)
                print("0000")
                addButtons()
                print("0000")
                addSliders()
                print("0000")
                openGlViewController.setupGLcontext()
                print("0000")
                openGlViewController.setupGLupdater()
                print("0000")
                loadCube()
                print("0000")
                resetCube()
                print("0000")
            case 1 :
                print("1")
                drawView = SwiftyDrawView(frame: drawView2.frame)
                drawView.setId(1)
                drawView.delegate = self
                
                let _ = openGlViewController.view
                openGlViewController.glkView.frame = containerView.bounds
                containerView.addSubview(openGlViewController.glkView)
                self.view.addSubview(drawView)
                addButtons()
                addSliders()
                openGlViewController.setupGLcontext()
                openGlViewController.setupGLupdater()
                loadCube2()
                resetCube2()
            case 2:
                print("2")
                drawView = SwiftyDrawView(frame: drawView2.frame)
                drawView.setId(2)
                drawView.delegate = self
                
                let _ = openGlViewController.view
                openGlViewController.glkView.frame = containerView.bounds
                containerView.addSubview(openGlViewController.glkView)
                self.view.addSubview(drawView)
                addButtons()
                addSliders()
                openGlViewController.setupGLcontext()
                openGlViewController.setupGLupdater()
                loadCube3()
                resetCube3()
            case 3:
                print("3")
            default:
                print("default")
            }
        }
        
        
        //openGlViewController.setupScene() // cubeLoad안에 넣었음
        
    }
    
    func addButtons() {
        blackButton = ColorButton(frame: CGRect(x: 50, y: self.view.frame.height-200, width: 40, height: 40), color: UIColor.black)
        blackButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(blackButton)
        
        whiteButton = ColorButton(frame: CGRect(x: 110, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.white)
        whiteButton.layer.borderWidth = 3
        whiteButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(whiteButton)
        
        redButton = ColorButton(frame: CGRect(x: 170, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.red)
        redButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(redButton)
        
        orangeButton = ColorButton(frame: CGRect(x: 230, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.orange)
        orangeButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(orangeButton)
        
        yellowButton = ColorButton(frame: CGRect(x: 290, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.yellow)
        yellowButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(yellowButton)
        
        greenButton = ColorButton(frame: CGRect(x: 350, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.green)
        greenButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(greenButton)
        
        blueButton = ColorButton(frame: CGRect(x: 410, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.blue)
        blueButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(blueButton)
        
        brownButton = ColorButton(frame: CGRect(x: 470, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.brown)
        brownButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(brownButton)
        
        purpleButton = ColorButton(frame: CGRect(x: 530, y: self.view.frame.height - 200, width: 40, height: 40), color: UIColor.purple)
        purpleButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        self.view.addSubview(purpleButton)
        
        transparentButton = ColorButton(frame: CGRect(x: 270, y: self.view.frame.height - 125, width: 30, height: 30), color: UIColor.black)
        //transparentButton.addTarget(self, action: #selector(colorButtonPressed(button:)), for: .touchUpInside)
        transparentButton.layer.borderWidth = 1
        self.view.addSubview(transparentButton)
        
        lineButton = ColorButton(frame: CGRect(x: 270 + (30-15)/2, y: self.view.frame.height - 80 + (30-15)/2, width: 15, height: 15), color: UIColor.black)
        lineButton.layer.borderWidth = 1
        self.view.addSubview(lineButton)
        
        undoButton = UIButton(frame: CGRect(x: 80, y: 30, width: 60, height: 30))
        undoButton.setTitleColor(UIColor.black, for: UIControlState())
        undoButton.setTitle("", for: UIControlState())
        undoButton.addTarget(self, action: #selector(undo), for: .touchUpInside)
        undoButton.setImage(UIImage(named : "undo"), for: .normal)
        self.view.addSubview(undoButton)
        
        deleteButton = UIButton(frame: CGRect(x: 10, y: 30, width: 60, height: 30))
        deleteButton.setTitleColor(UIColor.black, for: UIControlState())
        deleteButton.setTitle("", for: UIControlState())
        deleteButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        deleteButton.setImage(UIImage(named : "back"), for: .normal)
        self.view.addSubview(deleteButton)
    }
    
    func addSliders() {
        lineWidthSlider = UISlider(frame: CGRect(x: 50, y: self.view.frame.height - 80, width: 200, height: 40))
        lineWidthSlider.minimumValue = 1.0
        lineWidthSlider.maximumValue = 30.0
        lineWidthSlider.setValue(10.0, animated: false)
        lineWidthSlider.isContinuous = true
        lineWidthSlider.addTarget(self, action: #selector(lineWidthSliderValueDidChange(sender:)), for: .valueChanged)
        self.view.addSubview(lineWidthSlider)
        
        opacitySlider = UISlider(frame: CGRect(x: 50, y: self.view.frame.height - 130, width: 200, height: 40))
        opacitySlider.minimumValue = 0.001
        opacitySlider.maximumValue = 1.0
        opacitySlider.setValue(1.0, animated: false)
        opacitySlider.isContinuous = true
        opacitySlider.addTarget(self, action: #selector(lineOpacitySliderValueDidChange(sender:)), for: .valueChanged)
        self.view.addSubview(opacitySlider)
    }
    
    func colorButtonPressed(button: ColorButton) {
        drawView.lineColor = button.color
    }
    
    func undo() { //addTarget으로 추가됨.
        drawView.removeLastLine()
        if(selectedIdx==0){
            resetCube()}
        else if(selectedIdx==1){
            resetCube2()}
        else if(selectedIdx==2){
            resetCube3()}
    }
    
    func back() { // 실제로 back이라고 적힌 곳. 수정 전 deleteDrawing임. selector부분도 바꿨음.
        //drawView.clearCanvas()
        saveCube()
        self.dismiss(animated: true, completion: nil)
    }
    
    func lineWidthSliderValueDidChange(sender:UISlider!) {
        
        let val = CGFloat(sender.value)
        print(val)
        lineButton.contentMode = .center
        lineButton.layer.cornerRadius = CGFloat(0.5) * val
        lineButton.layer.masksToBounds = true
        lineButton.frame = CGRect(x: 270 + (30-val)/2, y: self.view.frame.height - 80 + (30-val)/2, width: val, height: val)
        drawView.lineWidth = CGFloat(sender.value)
        lineButton.setNeedsLayout()
        lineButton.setNeedsDisplay()
    }
    
    func lineOpacitySliderValueDidChange(sender:UISlider!) {
        let val = CGFloat(sender.value)
        print(val)
        transparentButton.backgroundColor = UIColor(white: 0, alpha: val)
        drawView.lineOpacity = CGFloat(sender.value)
    }
    
    
    
    func SwiftyDrawDidBeginDrawing(view: SwiftyDrawView) {
        //print("Did begin drawing")
        
        /*
         UIView.animate(withDuration: 0.5, animations: {
         self.redButton.alpha = 0.0
         self.blueButton.alpha = 0.0
         self.greenButton.alpha = 0.0
         self.orangeButton.alpha = 0.0
         self.purpleButton.alpha = 0.0
         self.yellowButton.alpha = 0.0
         self.undoButton.alpha = 0.0
         self.deleteButton.alpha = 0.0
         self.lineWidthSlider.alpha = 0.0
         self.opacitySlider.alpha = 0.0
         })*/
    }
    
    func SwiftyDrawIsDrawing(view: SwiftyDrawView) {
        //print("Is Drawing")
    }
    
    func SwiftyDrawDidFinishDrawing(view: SwiftyDrawView) {
        if(selectedIdx==0){
            resetCube()}
        else if(selectedIdx==1){
            print("2222222222222222")
            resetCube2()}
        else if(selectedIdx==2){
            resetCube3()}
        /*
         UIView.animate(withDuration: 0.5, animations: {
         self.redButton.alpha = 1.0
         self.blueButton.alpha = 1.0
         self.greenButton.alpha = 1.0
         self.orangeButton.alpha = 1.0
         self.purpleButton.alpha = 1.0
         self.yellowButton.alpha = 1.0
         self.undoButton.alpha = 1.0
         self.deleteButton.alpha = 1.0
         self.lineWidthSlider.alpha = 1.0
         self.opacitySlider.alpha = 1.0
         })*/
    }
    
    func SwiftyDrawDidCancelDrawing(view: SwiftyDrawView) {
        //print("Did cancel")
    }
    func takeScreenshot(view: UIView) -> UIImageView {
        UIGraphicsBeginImageContext(view.frame.size)
        //print(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        return UIImageView(image: image)
    }
    
    func crop(image:UIImage, cropRect:CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(cropRect.size, false, image.scale)
        let origin = CGPoint(x: cropRect.origin.x * CGFloat(-1), y: cropRect.origin.y * CGFloat(-1))
        image.draw(at: origin)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return result
    }
    
    func loadCube()
    {
        var filename:String
        print("load")
        filename = "saveTest.png"
        if selectedIdx == 0{
            filename = "saveTest1.png"
        }
        else if selectedIdx == 1{
            filename = "saveTest2.png"
        }
        else if selectedIdx == 2{
            filename = "saveTest3.png"
        }
        let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = URL(fileURLWithPath: path).appendingPathComponent(filename)
        
        if let urlImage = UIImage(contentsOfFile: url.path) {
            drawView2.backgroundColor = UIColor.init(patternImage: urlImage)
        }
        openGlViewController.setupScene()
    }
    func loadCube2()
    {
        var filename:String
        print("load2")
        filename = "saveTest.png"
        if selectedIdx == 0{
            filename = "saveTest1.png"
        }
        else if selectedIdx == 1{
            filename = "saveTest2.png"
        }
        else if selectedIdx == 2{
            filename = "saveTest3.png"
        }
        let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = URL(fileURLWithPath: path).appendingPathComponent(filename)
        
        if let urlImage = UIImage(contentsOfFile: url.path) {
            drawView2.backgroundColor = UIColor.init(patternImage: urlImage)
        }
        openGlViewController.setupScene2()
    }
    func loadCube3()
    {
        var filename:String
        print("load3")
        filename = "saveTest.png"
        if selectedIdx == 0{
            filename = "saveTest1.png"
        }
        else if selectedIdx == 1{
            filename = "saveTest2.png"
        }
        else if selectedIdx == 2{
            filename = "saveTest3.png"
        }
        let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = URL(fileURLWithPath: path).appendingPathComponent(filename)
        
        if let urlImage = UIImage(contentsOfFile: url.path) {
            drawView2.backgroundColor = UIColor.init(patternImage: urlImage)
        }
        openGlViewController.setupScene3()
    }
    
    func resetCube()
    {
        print("reset")
        var testImage:UIImageView
        testImage = takeScreenshot(view: drawView)
        var image_r:UIImage // 3
        var image_u:UIImage // 5
        var image_l:UIImage // 1
        var image_d:UIImage // 6
        var image_c:UIImage // 2
        var image_b:UIImage // 4
        image_r = testImage.image!
        image_u = testImage.image!
        image_l = testImage.image!
        image_d = testImage.image!
        image_c = testImage.image!
        image_b = testImage.image!
        if let paramImage = testImage.image { // crop한 이미지
            image_r = crop(image: paramImage, cropRect: CGRect(x: 322.0, y: 250.0, width: 120, height: 120))!
            image_u = crop(image: paramImage, cropRect: CGRect(x: 206.0, y: 134.0, width: 120, height: 120))!
            image_l = crop(image: paramImage, cropRect: CGRect(x: 89.0, y: 250.0, width: 120, height: 120))!
            image_d = crop(image: paramImage, cropRect: CGRect(x: 206.0, y: 367.0, width: 120, height: 120))!
            image_c = crop(image: paramImage, cropRect: CGRect(x: 206.0, y: 250.0, width: 120, height: 120))!
            image_b = crop(image: paramImage, cropRect: CGRect(x: 438.0, y: 250.0, width: 120, height: 120))!
        }
        //   let image_r = crop(image: testImage.image?, cropRect: )
        if let data = UIImagePNGRepresentation(image_r){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("test3.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_u){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("test5.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_c){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("test2.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_l){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("test1.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_b){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("test4.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_d){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("test6.png")
            try? data.write(to: url)
        }
        openGlViewController.updateScene()
    }
    
    func resetCube2()
    {
        print("reset2")
        var testImage:UIImageView
        testImage = takeScreenshot(view: drawView)
        var image_r:UIImage // 3
        var image_u:UIImage // 5
        var image_l:UIImage // 1
        var image_d:UIImage // 6
        var image_c:UIImage // 2
        image_r = testImage.image!
        image_u = testImage.image!
        image_l = testImage.image!
        image_d = testImage.image!
        image_c = testImage.image!
        
        if let paramImage = testImage.image { // crop한 이미지
            image_r = crop(image: paramImage, cropRect: CGRect(x: 399, y: 258, width: 504.5-399, height: 367.5-259.5))!
            image_u = crop(image: paramImage, cropRect: CGRect(x: 213, y: 106, width: 399-213, height: 259.5-107.5))!
            image_l = crop(image: paramImage, cropRect: CGRect(x: 213-(504.5-399), y: 258, width: 504.5-399, height: 367.5-259.5))!
            image_d = crop(image: paramImage, cropRect: CGRect(x: 213, y: 365, width: 399-213, height: 475.0-367.5))!
            image_c = crop(image: paramImage, cropRect: CGRect(x: 213, y: 258, width: 399-213, height: 367.5-259.5))!
        }
        //   let image_r = crop(image: testImage.image?, cropRect: )
        if let data = UIImagePNGRepresentation(image_r){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("triangle4.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_u){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("triangle1.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_c){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("triangle2.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_l){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("triangle5.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image_d){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("triangle3.png")
            try? data.write(to: url)
        }
        openGlViewController.updateScene2()
    }
    
    func resetCube3()
    {
        print("reset")
        var testImage:UIImageView
        testImage = takeScreenshot(view: drawView)
        var image1:UIImage // 위
        var image2:UIImage // 오른쪽
        var image3:UIImage // 아래
        var image4:UIImage // 왼쪽
        var image5:UIImage // 중앙
        image1 = testImage.image!
        image2 = testImage.image!
        image3 = testImage.image!
        image4 = testImage.image!
        image5 = testImage.image!
        
        if let paramImage = testImage.image { // crop한 이미지
            image1 = crop(image: paramImage, cropRect: CGRect(x: 216.5, y: 83.5, width: 336-216.5, height: 201.5-83.5))!
            image2 = crop(image: paramImage, cropRect: CGRect(x: 334, y: 200.5, width: 455-334, height: 319-200.5))!
            image3 = crop(image: paramImage, cropRect: CGRect(x: 216.5, y: 319, width: 335-216.5, height: 436-319))!
            image4 = crop(image: paramImage, cropRect: CGRect(x: 97.5, y: 200.5, width: 217.5-97.5, height: 319-200.5))!
            image5 = crop(image: paramImage, cropRect: CGRect(x: 216.5, y: 200.5, width: 335-216.5, height: 319-200.5))!
        }
        //   let image_r = crop(image: testImage.image?, cropRect: )
        if let data = UIImagePNGRepresentation(image1){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("pyramid1.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image2){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("pyramid2.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image3){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("pyramid3.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image4){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("pyramid4.png")
            try? data.write(to: url)
        }
        if let data = UIImagePNGRepresentation(image5){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("pyramid5.png")
            try? data.write(to: url)
        }
        openGlViewController.updateScene3()
    }
    
    func saveCube()
    {
        print("save")
        var testImage:UIImageView
        var filename:String
        testImage = takeScreenshot(view: drawView)
        
        //   let image_r = crop(image: testImage.image?, cropRect: )
        if let data = UIImagePNGRepresentation(testImage.image!){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            filename = "saveTest.png"
            if selectedIdx == 0{
                filename = "saveTest1.png"
            }
            else if selectedIdx == 1{
                filename = "saveTest2.png"
            }
            else if selectedIdx == 2{
                filename = "saveTest3.png"
            }
            let url = URL(fileURLWithPath: path).appendingPathComponent(filename)
            try? data.write(to: url)
        }
        
        
        /*
         if let paramImage = takeScreenshot(view: containerView).image{
         //let saveImg = crop(image: paramImage, cropRect: CGRect(x: containerView.frame.width/2 - 100, y: containerView.frame.height/2-100, width: containerView.frame.width/2, height: containerView.frame.height/2))!
         if let data = UIImagePNGRepresentation(paramImage){
         //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
         let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
         let url = URL(fileURLWithPath: path).appendingPathComponent("saveCube3D.png")
         try? data.write(to: url)
         print(url.path + " in func")
         }
         }
         */
        var filename2:String
        print("load")
        filename2 = "saveCube3D.png"
        if selectedIdx == 0{
            filename2 = "saveCube3D1.png"
        }
        else if selectedIdx == 1{
            filename2 = "saveCube3D2.png"
        }
        else if selectedIdx == 2{
            filename2 = "saveCube3D3.png"
        }
        let paramImage = openGlViewController.glkView.snapshot
        let saveImage = crop(image: paramImage, cropRect: CGRect(x: 73, y: 258, width: 326-73, height: 516-258))
        if let data = UIImagePNGRepresentation(saveImage!){
            //     var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent(filename2)
            try? data.write(to: url)
            print(url.path + " in func")
        }
        
    }
}

