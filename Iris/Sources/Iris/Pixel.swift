//
//  Pixel.swift
//  Iris-iOS
//
//  Created by Mateusz on 29.11.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

import CoreGraphics

public struct Pixel: Equatable {
    private var rgba: UInt32
    
    public var red: UInt8 {
        return UInt8((rgba >> 24) & 255)
    }
    
    public var green: UInt8 {
        return UInt8((rgba >> 16) & 255)
    }
    
    public var blue: UInt8 {
        return UInt8((rgba >> 8) & 255)
    }
    
    public var alpha: UInt8 {
        return UInt8((rgba >> 0) & 255)
    }
    
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        let r = (UInt32(red) << 24)
        let g = (UInt32(green) << 16)
        let b = (UInt32(blue) << 8)
        let a = (UInt32(alpha) << 0)
        rgba = r|g|b|a
    }
    
    public init(rgb: RGB) {
        self.init(red: UInt8(rgb.red * 255), green: UInt8(rgb.green * 255), blue: UInt8(rgb.blue * 255), alpha: UInt8(rgb.alpha * 255))
    }
    
    static public let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue
    
    static public func ==(lhs: Pixel, rhs: Pixel) -> Bool {
        return lhs.rgba == rhs.rgba
    }
}
