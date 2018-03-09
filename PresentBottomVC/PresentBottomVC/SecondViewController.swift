//
//  SecondViewController.swift
//  PresentBottomVC
//
//  Created by HongXiangWen on 2018/3/9.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, PresentBottomType {
    var contentHeight: CGFloat {
        return 350
    }

    @IBAction func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
