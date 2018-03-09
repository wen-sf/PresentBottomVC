//
//  PresentBottomController.swift
//  PresentBottomVC
//
//  Created by HongXiangWen on 2018/3/9.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

// MARK: - UIPresentationController子类，重写present相关属性和方法
class PresentBottomController: UIPresentationController {

    /// 动画的主要参数
    private var animateHeight: CGFloat = 0.0
    private var animateTime: CGFloat = 0.25

    /// 半透明背景按钮
    private lazy var backgroundBtn: UIButton = {
        let backgroundBtn = UIButton()
        if let frame = self.containerView?.bounds {
            backgroundBtn.frame = frame
        }
        backgroundBtn.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        backgroundBtn.alpha = 0
        backgroundBtn.addTarget(self, action: #selector(backgroundBtnClicked), for: .touchUpInside)
        return backgroundBtn
    }()
    
    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if let viewController = presentedViewController as? PresentBottomType {
            animateHeight = viewController.contentHeight
        } else {
            animateHeight = UIScreen.main.bounds.width
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    /// 将要弹出时添加背景按钮
    public override func presentationTransitionWillBegin() {
        containerView?.addSubview(backgroundBtn)
        UIView.animate(withDuration: TimeInterval(animateTime)) {
            self.backgroundBtn.alpha = 1
        }
    }
    
    public override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: TimeInterval(animateTime)) {
            self.backgroundBtn.alpha = 0
        }
    }
    
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            backgroundBtn.removeFromSuperview()
        }
    }
    
    /// 内容视图的frame
    public override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height - animateHeight, width: UIScreen.main.bounds.width, height: animateHeight)
    }
    
    ///  点击背景按钮收起
    @objc private func backgroundBtnClicked() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - 从底部弹出的viewController都要遵守此协议
protocol PresentBottomType {
    /// 容器view的高度
    var contentHeight: CGFloat { get }
}

// MARK: - UIViewController & PresentBottomType
typealias PresentBottomViewController = UIViewController & PresentBottomType

// MARK: - 提供自定义present方法
extension UIViewController: UIViewControllerTransitioningDelegate {
    
    /// 自定义present方法
    func presentBottomViewController(_ viewController: PresentBottomViewController ) {
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        present(viewController, animated: true, completion: nil)
    }

    /// UIViewControllerTransitioningDelegate
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentBottomController(presentedViewController: presented, presenting: presenting)
    }
    
}

// MARK: - 自定义segue，在storyboard中设置custom，且destination必须遵守PresentBottomType
class PresentBottomSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let destination = destination as? PresentBottomViewController else {
            fatalError("destination must be UIViewController & PresentBottomType")
        }
        source.presentBottomViewController(destination)
    }
    
}
















