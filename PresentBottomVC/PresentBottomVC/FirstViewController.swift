//
//  FirstViewController.swift
//  PresentBottomVC
//
//  Created by HongXiangWen on 2018/3/9.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, PresentBottomType {

    var contentHeight: CGFloat {
        return 200
    }
    
    var canPanDown: Bool {
        return true
    }
    
    private lazy var closeBtn: UIButton = {
       let closeBtn = UIButton()
        closeBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        closeBtn.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: contentHeight / 2)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(.red, for: .normal)
        closeBtn.addTarget(self, action: #selector(dismissBtnClicked(_:)), for: .touchUpInside)
        return closeBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(closeBtn)
    }
    
    @objc func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
