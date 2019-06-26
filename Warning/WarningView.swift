//
//  WarningView.swift
//  Herald
//
//  Created by Soloshcheva Aleksandra on 01.02.2018.
//  Copyright © 2018 Speech Tehnology Center. All rights reserved.
//

import UIKit

class WarningView: UIView {
    public var image:UIImage?{
        didSet {
            self.imageView?.image = image
            self.shimmer(self.imageView!)
        }
    }
    
    public var warning:String?{
        didSet {
        //    let stringsPath = Bundle.main.path(forResource: "Warning", ofType: "strings")

            self.labelView?.text = NSLocalizedString(warning!,comment:"")//, tableName: "Warnings", bundle: Bundle.main, comment: "")
        }
    }
    var alertManageer:AlertManager?
    
    @IBOutlet var imageView:UIImageView?
    @IBOutlet var labelView:UILabel?
    
    @IBAction func didCloseTouchUpInside() {
        self.alertManageer?.hideAlertWarning()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let blurEffectView = self.blurEffectView()
        self.addSubview(blurEffectView)
        self.sendSubviewToBack(blurEffectView)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    private func blurEffectView() -> UIVisualEffectView {
        let blurEffect = UIBlurEffect.init(style: UIBlurEffect.Style.dark)
        
        let blurEffectView = UIVisualEffectView.init(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        return blurEffectView
    }
    
    func shimmer(_ view: UIView) {
        let gradient  = self.gardientLayer()
        
        gradient.add(self.animation(), forKey: "animateLayer")
        
        view.layer.mask = gradient
    }
    
    private func gardientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: -0.02)
        gradient.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width*3, height: self.bounds.size.height)
        
        let lowerAlpha: CGFloat = 0.6
        let solid = UIColor(white: 1, alpha: 1).cgColor
        let clear = UIColor(white: 1, alpha: lowerAlpha).cgColor
        gradient.colors     = [ solid, solid, clear, clear, solid, solid ]
        gradient.locations  = [     0,   0.3,  0.45,  0.55,   0.7,     1 ]
        return gradient
    }
    
    private func animation() -> CABasicAnimation {
        let theAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        theAnimation.duration = 2
        theAnimation.repeatCount = Float.infinity
        theAnimation.autoreverses = false
        theAnimation.isRemovedOnCompletion = false
        theAnimation.fillMode = CAMediaTimingFillMode.forwards
        theAnimation.fromValue = -self.frame.size.width * 2
        theAnimation.toValue =  0
        return theAnimation
    }
}
