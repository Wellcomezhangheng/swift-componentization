//
//  Mediator.swift
//  Runtime_Componentized
//
//  Created by 张衡 on 2018/5/3.
//  Copyright © 2018年 老张. All rights reserved.
//

import UIKit

class Mediator: NSObject {

   class func currentTopViewController() -> UIViewController? {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController{
            return currentTopViewController(rootViewController: rootViewController)
        }else{
            return nil
        }
    }

   class func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        if (rootViewController.isKind(of: UITabBarController.self)) {
            let tabBarController = rootViewController as! UITabBarController
            return currentTopViewController(rootViewController: tabBarController.selectedViewController!)
        }
        if (rootViewController.isKind(of: UINavigationController.self)) {
            let navigationController = rootViewController as! UINavigationController
            return currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        if ((rootViewController.presentedViewController) != nil) {
            return currentTopViewController(rootViewController: rootViewController.presentedViewController!)
        }
        return rootViewController
    }

    static func pushDetail() -> Void {
        let detailVC = detailViewController()
        let topViewController = self.currentTopViewController()
        topViewController?.navigationController?.pushViewController(detailVC, animated: true)

    }

    static func pushInformation() -> Void {
        let informationVC = informationViewController()
        let topViewController = self.currentTopViewController()
        topViewController?.navigationController?.pushViewController(informationVC, animated: true)
    }

    static func pushPrice() -> Void {
        let priceVC = priceViewController()
        let topViewController = self.currentTopViewController()
        topViewController?.navigationController?.pushViewController(priceVC, animated: true)
    }

}
