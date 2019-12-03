//
//  Router.swift
//  iAgreeDemo
//
//  Created by Dmitry Kocherovets on 28.11.2019.
//  Copyright © 2019 Dmitry Kocherovets. All rights reserved.
//

import UIKit
import iAgreeLib

class Router {

    static let shared = Router()

    private var topmostViewController: UIViewController {
        return UIApplication.shared.keyWindow!.topmostViewController!
    }

    private var navigationController: UINavigationController? {
        return UIApplication.shared.keyWindow!.topmostViewController!.navigationController
    }

    private func createVC<T: UIViewController>(_ type: T.Type) -> T {
        UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }

    func showDefaulVC() {
        
        navigationController?.pushViewController(IAgreeVC.createVC(), animated: true)
    }

    func showModallyDefaulVC() {
        
        let vc = IAgreeVC.createVC()
        vc.modalPresentationStyle = .fullScreen
        topmostViewController.present(vc, animated: true)
    }
    
    func showCustomVC() {
        
        navigationController?.pushViewController(createVC(CustomVC.self), animated: true)
    }

}

extension UIViewController {

    static var topmostViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.topmostViewController
    }

    @objc var topmostViewController: UIViewController? {
        return presentedViewController?.topmostViewController ?? self
    }
}

extension UINavigationController {

    @objc override var topmostViewController: UIViewController? {
        return visibleViewController?.topmostViewController
    }
}

extension UITabBarController {

    @objc override var topmostViewController: UIViewController? {
        return selectedViewController?.topmostViewController
    }
}

extension UIWindow {

    var topmostViewController: UIViewController? {
        return rootViewController?.topmostViewController
    }
}
