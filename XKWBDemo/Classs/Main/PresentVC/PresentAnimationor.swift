//
//  PresentAnimationor.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/2.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit
class PresentAnimationor: NSObject {
    private var isPresented = false
    var presentVCFrame = CGRect.zero
}

    // MArk: - UIViewControllerTransitioningDelegate代理方法
    extension PresentAnimationor :UIViewControllerTransitioningDelegate{
        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
           let  customPresentVC =   CustomPresentController(presentedViewController: presented, presenting: presenting)
            customPresentVC.presentVFrame = presentVCFrame
            return customPresentVC
        }
        
        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            isPresented = true
            return self
        }
        
        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            isPresented = false
            return self
        }
    }
    extension PresentAnimationor :UIViewControllerAnimatedTransitioning{
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            isPresented ? animationForPresent(using: transitionContext) : animationForDismiss(using: transitionContext)
        }
        
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 0.25
        }
        
        private func animationForPresent(using transitionContext: UIViewControllerContextTransitioning){
            let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            transitionContext.containerView.addSubview(presentedView!)
            presentedView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
            presentedView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                presentedView?.transform = CGAffineTransform.identity
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
        private func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning){
            let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                presentedView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0001)
            }) { (_) in
                transitionContext.completeTransition(true)
            }
    }
}
