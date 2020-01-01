//
//  UIColor + Extension.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/01.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor.init(displayP3Red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
}
