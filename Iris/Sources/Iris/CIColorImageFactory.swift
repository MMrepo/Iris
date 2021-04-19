//
//  CIColorImageFactory.swift
//  Iris-iOS
//
//  Created by Mateusz on 22.12.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

//import CoreImage
//import CoreGraphics
//import PocketTool

//public struct CIColorImageFactory {
//    
//    private let context = CIContext(options: [ "kCIContextUseSoftwareRenderer" : true])
//    private var kernel: CIColorKernel
//    
//    public init(source: String) throws {
//        guard let kernel = CIColorKernel(source: source) else {
//            throw "CIColorImageFactory cannot initialize kernel, please check source!"
//        }
//        self.kernel = kernel
//    }
//    
//    public init(filePath: String) throws {
//        let source = try String(contentsOfFile: filePath)
//        try self.init(source: source)
//    }
//    
//    public init(shaderName: String, fromBundle bundle:Bundle = Bundle.main) throws {
//        guard let filePath = bundle.path(forResource: shaderName, ofType: "shader") else {
//            throw "CIColorImageFactory cannot find \(shaderName))!"
//        }
//        try self.init(filePath: filePath)
//    }
//    
//    public func ciImage(withFrame frame:CGRect, andArguments arguments: [Any]) -> CIImage? {
//        return kernel.apply(extent: frame, arguments: arguments)
//    }
//    
//    public func cgImage(withFrame frame:CGRect, andArguments arguments: [Any]) -> CGImage? {
//        guard let image = ciImage(withFrame: frame, andArguments: arguments) else {
//            return nil
//        }
//        return context.createCGImage(image, from: frame)
//    }
//}
