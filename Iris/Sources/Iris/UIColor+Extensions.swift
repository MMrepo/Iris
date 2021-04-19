//
//  UIColor+Extensions.swift
//  Vindur
//
//  Created by Mateusz on 28.11.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

import UIKit

public typealias RGB = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
public typealias HSV = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)

extension UIColor {
    
    public convenience init(rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: rgb.alpha)
    }
    
    public convenience init(hsv: HSV) {
        self.init(hue: hsv.hue, saturation: hsv.saturation, brightness: hsv.brightness, alpha: hsv.alpha)
    }
    
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var hex:UInt32 = 0
        let scanner = Scanner(string: hexString)
        scanner.scanLocation = 1
        scanner.scanHexInt32(&hex)
        self.init(hex: Int(hex), alpha: alpha)
    }
    
    public convenience init?(hex: Int, alpha: CGFloat = 1.0) {
        guard 0x000000 ... 0xFFFFFF ~= hex else {
            return nil
        }
        
        self.init(rgb: UIColor.HEXtoRGB(hex, alpha: alpha))
    }
    
    public var hsv:HSV {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return (hue: h, saturation: s, brightness: b, alpha: a)
    }
    
    public var rgb:RGB {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (red: r, green: g, blue: b, alpha: a)
    }
    
    static public func RGBtoHSV(_ rgb: RGB) -> HSV {
        return UIColor(rgb: rgb).hsv
    }
    
    /**
     Returns a tuple with hex value int and alpha value
     */
    static public func RGBtoHEXA(_ rgb: RGB) -> (Int, CGFloat) {
        return (UIColor(rgb: rgb).hex, rgb.alpha)
    }
    
    static public func HEXtoRGB(_ hex: Int, alpha:CGFloat = 1.0) -> RGB {
        return (red: CGFloat((hex & 0xFF0000) >> 16)/255.0,
                        green: CGFloat((hex & 0x00FF00) >> 8)/255.0,
                        blue: CGFloat((hex & 0x0000FF) >> 0)/255.0,
                        alpha)
    }
    
    static public func HSVtoRGB(_ hsv: HSV) -> RGB {
        return UIColor(hsv: hsv).rgb
    }
    
    public var hexString:String {
        return String(format:"#%06x", self.hex)
    }
    
    public var hex:Int {
        return (Int)(self.rgb.red*255)<<16 | (Int)(self.rgb.green*255)<<8 | (Int)(self.rgb.blue*255)<<0
    }
    
    
    public var complementary: UIColor {
        
        let rgb = self.rgb
        
        let compRed: CGFloat = 1.0 - rgb.red
        let compGreen: CGFloat = 1.0 - rgb.green
        let compBlue: CGFloat = 1.0 - rgb.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: rgb.alpha)
    }
}
