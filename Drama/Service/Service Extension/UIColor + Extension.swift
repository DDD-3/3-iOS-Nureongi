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
    
    static var naviColor: UIColor {
        //return UIColor.rgb(red: 230, green: 50, blue: 50, alpha: 1.0)
        return UIColor.black
    }
    
    static var cardCellBackgroundColor: UIColor {
        return UIColor.rgb(red: 32, green: 32, blue: 32, alpha: 1.0)
    }
    
    static var textGrayColor: UIColor {
        return UIColor.rgb(red: 168, green: 168, blue: 168, alpha: 1.0)
    }
}
