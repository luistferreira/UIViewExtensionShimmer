//
//  UIView+Shimmer.swift
//  UIViewExtensionShimmer
//
//  Created by Rafael Costa on 05/12/19.
//

import UIKit

// MARK: - UIView Extension

var kAssociatedObjectValue: Int = 0
let kUIViewShimmerKey = "_uiviewextension_shimmerAnimation"
let kShimmerColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.8431372549, alpha: 1).withAlphaComponent(0.3)

class CAShimmerLayer: CAShapeLayer {
    deinit {
        self.superlayer?.removeObserver(self.superlayer!, forKeyPath: "bounds")
    }
}

public extension UIView {
    fileprivate var shimmerLayer: CAShimmerLayer? {
        get {
            return (objc_getAssociatedObject(self, &kAssociatedObjectValue) as? CAShimmerLayer)
        }
        set {
            return objc_setAssociatedObject(self, &kAssociatedObjectValue, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    public func startShimmer() {
        if self.shimmerLayer != nil {
            self.stopShimmer()
        }

        self.shimmerLayer = CAShimmerLayer()
        self.shimmerLayer?.frame = self.layer.bounds
        self.shimmerLayer?.backgroundColor = kShimmerColor.cgColor
        self.shimmerLayer?.masksToBounds = true

        self.addObserver(self, forKeyPath: "bounds", options: .new, context: nil)

        self.layer.addSublayer(self.shimmerLayer!)

        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.white.withAlphaComponent(0.8).cgColor,
            UIColor.clear.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0.7, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.8)
        gradientLayer.frame = self.bounds

        self.shimmerLayer?.mask = gradientLayer

        self.addShimmerAnimation()
    }

    fileprivate func addShimmerAnimation() {
        self.shimmerLayer?.mask?.removeAnimation(forKey: kUIViewShimmerKey)

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 1.75
        animation.fromValue = -(self.frame.size.width + (self.frame.size.width * 0.3))
        animation.toValue = self.frame.size.width + (self.frame.size.width * 0.3)
        animation.repeatCount = .infinity

        self.shimmerLayer?.mask?.add(animation, forKey: kUIViewShimmerKey)
    }

    public func stopShimmer() {
        self.removeObserver(self, forKeyPath: "bounds")
        self.shimmerLayer?.removeFromSuperlayer()
        self.shimmerLayer = nil
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "bounds" else {
            return super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }

        self.shimmerLayer?.frame = self.bounds
        self.shimmerLayer?.mask?.frame = self.bounds
        self.addShimmerAnimation()
    }
}
