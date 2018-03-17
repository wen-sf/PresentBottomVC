//
//  ViewController.swift
//  PresentBottomVC
//
//  Created by HongXiangWen on 2018/3/9.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func firstBtnClicked(_ sender: UIButton) {
        let firstVC = FirstViewController()
        presentBottomViewController(firstVC)
    }

    
}

