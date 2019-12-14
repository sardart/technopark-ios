
import UIKit

class ViewController: UIViewController {
    @IBOutlet private var box: UIView!
    
    override func viewDidLoad() {
        //Creating rounder corners
        box.layer.cornerRadius = 150

        // Adding shadow effects
        box.layer.shadowOffset = CGSize(width: 5, height: 5)
        box.layer.shadowOpacity = 0.5
        box.layer.shadowRadius = 5
        box.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor

        // Applying borders
        box.layer.borderColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        box.layer.borderWidth = 30
//
////        // Display images
//        box.layer.contents = UIImage(named: "tree.jpg")?.cgImage
//        box.layer.contentsGravity = CALayerContentsGravity.resize
//        box.layer.masksToBounds = false //true
        foo()
    }

    func foo() {
        let width: CGFloat = 640
        let height: CGFloat = 640

        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 160, y: 160,
                                  width: width, height: height)

        let path = CGMutablePath()

        stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 6).forEach {
            angle in
            var transform  = CGAffineTransform(rotationAngle: angle)

            let petal = CGPath(ellipseIn: CGRect(x: -20, y: 0, width: 40, height: 100),
                               transform: &transform)

            path.addPath(petal)
        }

        shapeLayer.path = path
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.fillRule = .evenOdd
        box.layer.addSublayer(shapeLayer)
    }

}
