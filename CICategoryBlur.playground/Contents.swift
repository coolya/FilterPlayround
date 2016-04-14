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
// CICategoryBlur
// ###############################################################################################


// CIBoxBlur
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBoxBlur
let boxBlurParams : [String : AnyObject] = [kCIInputImageKey: img,
                                            "inputRadius": 20.0]

let boxBlur = CIFilter(name: "CIBoxBlur", withInputParameters: boxBlurParams);
let boxBlurOutput = boxBlur?.outputImage


// CIDiscBlur
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDiscBlur
let discBlurParams : [String : AnyObject] = [kCIInputImageKey: img,
                                            "inputRadius": 20.0]

let discBlur = CIFilter(name: "CIDiscBlur", withInputParameters: boxBlurParams);
let discBlurOutput = discBlur?.outputImage


// CIGaussianBlur
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianBlur
let gaussianBlurParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                 "inputRadius": 20.0]

let gaussianBlur = CIFilter(name: "CIGaussianBlur", withInputParameters: boxBlurParams);
let gaussianBlurOutput = gaussianBlur?.outputImage


// CIMaskedVariableBlur
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskedVariableBlur
// We will use a generated image as a second input for this.


let inputMask = CIFilter(name: "CIStripesGenerator", withInputParameters: ["inputColor0" : NSColor.whiteColor().asCIColor,
                                                                           "inputColor1" : NSColor.blackColor().asCIColor])!.outputImage!

let maskedVariableBlurParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputRadius": 20.0,
                                                       "inputMask" : inputMask]

let maskedVariableBlur = CIFilter(name: "CIMaskedVariableBlur", withInputParameters: maskedVariableBlurParams);
let maskedVariableBlurOutput = maskedVariableBlur?.outputImage


// CIMedianFilter
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMedianFilter

// To showcase this filter we will use a noisier image than for the others.
// The sample image is licensed under the Creative Commons Attribution 2.0 licensed
// It was originally created by rjp <https://www.flickr.com/photos/zimpenfish/>
// The original work can be found at https://www.flickr.com/photos/zimpenfish/8495784631/

let noisyInput = getResImg("noise")
let medianFilterParams : [String : AnyObject] = [kCIInputImageKey: noisyInput]

let medianFilter = CIFilter(name: "CIMedianFilter", withInputParameters: medianFilterParams);

// For better esier review of the result enlage both images on the right.
let medianFilterOutput = medianFilter?.outputImage


// CIMotionBlur
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMotionBlur


let motionBlurParams : [String : AnyObject] = [kCIInputImageKey: img,
                                             "inputRadius": 20.0,
                                             "inputAngle" : 0.0]

let motionBlur = CIFilter(name: "CIMotionBlur", withInputParameters: motionBlurParams);
let motionBlurOutput = motionBlur?.outputImage

// CINoiseReduction
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction

let noiseReductionParams : [String : AnyObject] = [kCIInputImageKey: noisyInput,
                                                   "inputNoiseLevel" : 0.02,
                                                   "inputSharpness" :  0.40]

let noiseReduction = CIFilter(name: "CINoiseReduction", withInputParameters: noiseReductionParams);
// For better esier review of the result enlage both images on the right.
let noiseReductionOutput = noiseReduction?.outputImage


// CIZoomBlur
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur

let zoomBlurParams : [String : AnyObject] = [kCIInputImageKey: img,
                                               "inputCenter": CIVector(x: 150.0, y: 150.0),
                                               "inputAmount" : 20.0]

let zoomBlur = CIFilter(name: "CIZoomBlur", withInputParameters: zoomBlurParams);
let zoomBlurOutput = zoomBlur?.outputImage