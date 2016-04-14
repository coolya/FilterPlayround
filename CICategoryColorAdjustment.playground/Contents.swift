//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

// Helpers

extension NSColor{
    var asCIColor : CIColor {
        get {
            guard let c =  CIColor(color: self) else {
                fatalError("can't create color");
            }
            return c;
        }
    }
}

func getResImg(name: String, ext: String = "jpg") -> CIImage {
    guard let fileName = NSBundle.mainBundle().URLForResource(name, withExtension: ext) else {
        fatalError("can't find image");
    }
    guard let img = CIImage(contentsOfURL: fileName) else {
        fatalError("can't load image")
    }
    return img;
}

// The sample image is licensed under the Creative Commons Attribution 2.0 licensed
// It was originally created by Ana_Cotta <https://www.flickr.com/photos/ana_cotta/>
// The original work can be found at https://www.flickr.com/photos/ana_cotta/3077623496/
let img = getResImg("sample")


// ###############################################################################################
// CICategoryColorAdjustment
// ###############################################################################################

// CIColorClamp
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorClamp

let colorClampParams : [String : AnyObject] = [kCIInputImageKey: img,
                                               "inputMinComponents": CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0),
                                               "inputMaxComponents" : CIVector(x: 1.0, y: 1.0, z: 1.0, w: 1.0)]

let colorClamp = CIFilter(name: "CIColorClamp", withInputParameters: colorClampParams);
let colorClampOutput = colorClamp?.outputImage


// CIColorControls
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls

let colorControlsParams : [String : AnyObject] = [kCIInputImageKey: img,
                                               "inputSaturation" : 1.0,
                                               "inputBrightness" : 0.1,
                                               "inputContrast" : 1.0]

let colorControls = CIFilter(name: "CIColorControls", withInputParameters: colorControlsParams);
let colorControlsOutput = colorControls?.outputImage


// CIColorMatrix
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix

let colorMatrixParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                  "inputRVector" : CIVector(x: 1.0, y: 0.0, z: 0.0, w: 0.0),
                                                  "inputGVector" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                  "inputBVector" : CIVector(x: 0.0, y: 0.0, z: 1.0, w: 0.0),
                                                  "inputAVector" : CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0),
                                                  "inputBiasVector" : CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)]

let colorMatrix = CIFilter(name: "CIColorMatrix", withInputParameters: colorMatrixParams);
let colorMatrixOutput = colorMatrix?.outputImage


// CIColorPolynomial
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial

let colorPolynomialParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                "inputRedCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                "inputGreenCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                "inputBlueCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                "inputAlphaCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0)]

let colorPolynomial = CIFilter(name: "CIColorPolynomial", withInputParameters: colorPolynomialParams);
let colorPolynomialOutput = colorPolynomial?.outputImage



let transform = NSAffineTransform()
    transform.scaleXBy(-1.0, yBy: 1.0);

let affineTransformInput = img;
let affineTransformParams : [String : AnyObject] = [kCIInputImageKey: affineTransformInput,
                             "inputTransform": transform]
let affineTransform = CIFilter(name: "CIAffineTransform", withInputParameters: affineTransformParams);
let affineTransformOutput = affineTransform?.outputImage


