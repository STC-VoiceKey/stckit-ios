//
//  AlertManager.swift
//  AgentPhone
//
//  Created by Soloshcheva Aleksandra on 26.01.2019.
//  Copyright © 2019 Speech Tehnology Center. All rights reserved.
//

import Foundation

import UIKit

@objc protocol AlertManager {
    func showError(_ error:Error)
   // func showNetworkUnavailableWarning()
    func hideAlertWarning()
}

class AlertManagerImplemetation: NSObject,AlertManager {
    var message:String?
    
    func showError(_ error: Error) {
        DispatchQueue.main.async {
            self.alertWindow.windowLevel = UIWindow.Level.alert + 1
            self.message = error.localizedDescription
            let errorView = self.errorImageView
            self.alertWindow.addSubview(errorView)
            errorView.center = self.alertWindow.center
        
            self.alertWindow.makeKeyAndVisible()
        }
    }
    
    var alertWindow:UIWindow = UIWindow.init(frame: UIScreen.main.bounds)
    
    func hideAlertWarning() {
        self.alertWindow.isHidden = true
    }

    var errorImageView:UIView {
        get {
            let rootView:UIView = Bundle.main.loadNibNamed("WarningView", owner: self, options: nil)?.first as! UIView
            let warningView:WarningView = rootView.subviews.first as! WarningView
            warningView.alertManageer = self
            warningView.image = #imageLiteral(resourceName: "error")
            warningView.warning = message
            return rootView
        }
    }
    
}
