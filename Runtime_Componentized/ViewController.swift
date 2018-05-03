//
//  ViewController.swift
//  Runtime_Componentized
//
//  Created by 张衡 on 2018/5/3.
//  Copyright © 2018年 老张. All rights reserved.
//

import UIKit

enum type_btn : Int{
    case detailBtn      = 1
    case informationBtn = 2
    case priceBtn       = 3
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"

        let detailsBtn   = self.obtainBtn(name: detailText, tag: type_btn.detailBtn.rawValue)
        detailsBtn.frame = CGRect(x: 100, y: 100, width: SCREEN_WIDTH - 200, height: 50)
        self.view.addSubview(detailsBtn)

        let informationBtn   = self.obtainBtn(name: InfoamationText, tag: type_btn.informationBtn.rawValue)
        informationBtn.frame = CGRect(x: 100, y: 200, width: SCREEN_WIDTH - 200, height: 50)
        self.view.addSubview(informationBtn)

        let priceBtn   = self.obtainBtn(name: priceText, tag: type_btn.priceBtn.rawValue)
        priceBtn.frame = CGRect(x: 100, y: 300, width: SCREEN_WIDTH - 200, height: 50)
        self.view.addSubview(priceBtn)

        // Do any additional setup after loading the view, typically from a nib.
    }
    func obtainBtn(name : String , tag : Int) -> UIButton {
        let hopeBtn = UIButton()
        hopeBtn.setTitle(name, for: .normal)
        hopeBtn.tag = tag
        hopeBtn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        hopeBtn.backgroundColor = UIColor.red

        return hopeBtn
    }

    @objc func btnClick(sender:UIButton) -> Void {
        switch sender.tag {
        case type_btn.detailBtn.rawValue :
            print("1")
            Mediator.pushDetail()
        case type_btn.informationBtn.rawValue :
            print("2")
            Mediator.pushInformation()
        case type_btn.priceBtn.rawValue :
            print("3")
            Mediator.pushPrice()
        default:
            print("")
        }

//        let loginVc = LoginViewController()
//        self.navigationController?.pushViewController(loginVc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

