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
colorClamp?.outputImage


// CIColorControls
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls

let colorControlsParams : [String : AnyObject] = [kCIInputImageKey: img,
                                               "inputSaturation" : 1.0,
                                               "inputBrightness" : 0.1,
                                               "inputContrast" : 1.0]

let colorControls = CIFilter(name: "CIColorControls", withInputParameters: colorControlsParams);
colorControls?.outputImage


// CIColorMatrix
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix

let colorMatrixParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                  "inputRVector" : CIVector(x: 1.0, y: 0.0, z: 0.0, w: 0.0),
                                                  "inputGVector" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                  "inputBVector" : CIVector(x: 0.0, y: 0.0, z: 1.0, w: 0.0),
                                                  "inputAVector" : CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0),
                                                  "inputBiasVector" : CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)]

let colorMatrix = CIFilter(name: "CIColorMatrix", withInputParameters: colorMatrixParams);
colorMatrix?.outputImage


// CIColorPolynomial
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial

let colorPolynomialParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                "inputRedCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                "inputGreenCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                "inputBlueCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                                                "inputAlphaCoefficients" : CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0)]

let colorPolynomial = CIFilter(name: "CIColorPolynomial", withInputParameters: colorPolynomialParams);
colorPolynomial?.outputImage


// CIExposureAdjust
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust

let exposureAdjustParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputEV" : 0.5]

let exposureAdjust = CIFilter(name: "CIExposureAdjust", withInputParameters: exposureAdjustParams);
exposureAdjust?.outputImage


// CIGammaAdjust
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGammaAdjust

let gammaAdjustParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputPower" : 0.75]

let gammaAdjust = CIFilter(name: "CIGammaAdjust", withInputParameters: gammaAdjustParams);
gammaAdjust?.outputImage


// CIHueAdjust
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueAdjust

let hueAdjustParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                "inputAngle" : 0.5]

let hueAdjust = CIFilter(name: "CIHueAdjust", withInputParameters: hueAdjustParams);
hueAdjust?.outputImage


// CILinearToSRGBToneCurve
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearToSRGBToneCurve

let linearToSRGBToneCurveParams : [String : AnyObject] = [kCIInputImageKey: img]

let linearToSRGBToneCurve = CIFilter(name: "CILinearToSRGBToneCurve", withInputParameters: linearToSRGBToneCurveParams);
linearToSRGBToneCurve?.outputImage


// CISRGBToneCurveToLinear
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISRGBToneCurveToLinear

let sRGBToneCurveToLinearParams : [String : AnyObject] = [kCIInputImageKey: img]

let sRGBToneCurveToLinear = CIFilter(name: "CISRGBToneCurveToLinear", withInputParameters: sRGBToneCurveToLinearParams);
linearToSRGBToneCurve?.outputImage


// CITemperatureAndTint
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint

let temperatureAndTintParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputNeutral" : CIVector(x: 6500.0, y: 0.0),
                                                    "inputTargetNeutral" : CIVector(x: 6500.0, y: 0.0)]

let temperatureAndTint = CIFilter(name: "CITemperatureAndTint", withInputParameters: temperatureAndTintParams);
temperatureAndTint?.outputImage


// CIToneCurve
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve

let toneCurveParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputPoint0" : CIVector(x: 0.0, y: 0.0),
                                                       "inputPoint1" : CIVector(x: 0.25, y: 0.25),
                                                       "inputPoint2" : CIVector(x: 0.5, y: 0.5),
                                                       "inputPoint3" : CIVector(x: 0.75, y: 0.75),
                                                       "inputPoint4" : CIVector(x: 1.0, y: 1.0)]

let toneCurve = CIFilter(name: "CIToneCurve", withInputParameters: toneCurveParams);
toneCurve?.outputImage

// CIVibrance
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVibrance

let vibranceParams : [String : AnyObject] = [kCIInputImageKey: img,
                                              "inputAmount" : 9.0]

let vibrance = CIFilter(name: "CIVibrance", withInputParameters: vibranceParams);
vibrance?.outputImage


// CIWhitePointAdjust
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIWhitePointAdjust

let whitePointAdjustParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                     "inputColor" : NSColor.blueColor().asCIColor]

let whitePointAdjust = CIFilter(name: "CIWhitePointAdjust", withInputParameters: whitePointAdjustParams);
whitePointAdjust?.outputImage

let transform = NSAffineTransform()
    transform.scaleXBy(-1.0, yBy: 1.0);

let affineTransformInput = img;
let affineTransformParams : [String : AnyObject] = [kCIInputImageKey: affineTransformInput,
                             "inputTransform": transform]
let affineTransform = CIFilter(name: "CIAffineTransform", withInputParameters: affineTransformParams);
let affineTransformOutput = affineTransform?.outputImage


