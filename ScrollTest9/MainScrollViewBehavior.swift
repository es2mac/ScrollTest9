//
//  MainScrollViewBehavior.swift
//  ScrollTest9
//
//  Created by Paul on 12/1/15.
//  Copyright © 2015 Mathemusician.net. All rights reserved.
//

import UIKit

class MainScrollViewBehavior: NSObject, UIScrollViewDelegate {

    @IBOutlet weak var darkMaskView: UIView!

    let maxAlphaHeight: CGFloat = 75
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        let y = scrollView.contentOffset.y

        if y < -100 {
            scrollView.setContentOffset(CGPoint(x: 0, y: -100), animated: false)
        }

        // y     = 0 ~ 75, alpha = 0 ~ 1
        darkMaskView.alpha = min(1, max(0, y / maxAlphaHeight))
    }


    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let y = scrollView.contentOffset.y
        

        if y <= -(100 - 0.1) {
            targetContentOffset.memory = CGPoint(x: 0, y: -100)
            scrollView.userInteractionEnabled = false
            scrollView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

            performSelector(#selector(MainScrollViewBehavior.resetScrollView(_:)), withObject: scrollView, afterDelay: 0.7)
        }
    }

    func resetScrollView(scrollView: UIScrollView) {
        scrollView.userInteractionEnabled = true

//        scrollView.contentInset = UIEdgeInsetsZero
//        scrollView.setContentOffset(CGPoint(x: 0, y: -100), animated: false)
//        scrollView.setContentOffset(CGPointZero, animated: true)

//        UIView.animateWithDuration(1.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .CurveEaseOut,
        UIView.animateWithDuration(0.8,
            animations: {
                scrollView.contentOffset = CGPointZero
            },
            completion: { _ in
                scrollView.contentInset = UIEdgeInsetsZero
        })
    }
}







