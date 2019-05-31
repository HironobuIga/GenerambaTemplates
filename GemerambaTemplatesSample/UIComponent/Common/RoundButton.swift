//
//  RoundButton.swift
//  UIComponent
//
//  Created by HironobuIga on 2019/05/31.
//  Copyright © 2019 iganin. All rights reserved.
//

import Foundation

@IBDesignable
public final class RoundButton: UIButton {
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable
    public var borderColor: UIColor {
        set { layer.borderColor = newValue.cgColor }
        get { return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
    }
}
