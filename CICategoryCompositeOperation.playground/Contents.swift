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

// The sample image is licensed under the Creative Commons Attribution 2.0 licensed
// It was originally created by Salva Barbera <https://www.flickr.com/photos/decar66/>
// The original work can be found at https://www.flickr.com/photos/decar66/8577247633/
let secondImg = getResImg("sample2")


// ###############################################################################################
// CICategoryCompositeOperation
// ###############################################################################################

// CIAdditionCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAdditionCompositing

let additionCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let additionCompositing = CIFilter(name: "CIAdditionCompositing", withInputParameters: additionCompositingParams);
additionCompositing?.outputImage


// CIColorBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBlendMode

let colorBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputBackgroundImage": secondImg]
let colorBlendMode = CIFilter(name: "CIColorBlendMode", withInputParameters: colorBlendModeParams);
colorBlendMode?.outputImage


// CIColorBurnBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBurnBlendMode

let colorBurnBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let colorBurnBlendMode = CIFilter(name: "CIColorBurnBlendMode", withInputParameters: colorBlendModeParams);
colorBurnBlendMode?.outputImage


// CIColorDodgeBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorDodgeBlendMode


let colorDodgeBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let colorDodgeBlendMode = CIFilter(name: "CIColorDodgeBlendMode", withInputParameters: colorDodgeBlendModeParams);
colorDodgeBlendMode?.outputImage


// CIDarkenBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDarkenBlendMode

let darkenBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let darkenBlendMode = CIFilter(name: "CIDarkenBlendMode", withInputParameters: darkenBlendModeParams);
darkenBlendMode?.outputImage


// CIDifferenceBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDifferenceBlendMode

let differenceBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputBackgroundImage": secondImg]
let differenceBlendMode = CIFilter(name: "CIDifferenceBlendMode", withInputParameters: differenceBlendModeParams);
differenceBlendMode?.outputImage


// CIDivideBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDivideBlendMode

let divideBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let divideBlendMode = CIFilter(name: "CIDivideBlendMode", withInputParameters: divideBlendModeParams);
divideBlendMode?.outputImage

// CIExclusionBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExclusionBlendMode

let exclusionBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputBackgroundImage": secondImg]
let exclusionBlendMode = CIFilter(name: "CIExclusionBlendMode", withInputParameters: exclusionBlendModeParams);
exclusionBlendMode?.outputImage


// CIHardLightBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHardLightBlendMode

let hardLightBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let hardLightBlendMode = CIFilter(name: "CIHardLightBlendMode", withInputParameters: hardLightBlendModeParams);
hardLightBlendMode?.outputImage


// CIHueBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueBlendMode

let hueBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let hueBlendMode = CIFilter(name: "CIHueBlendMode", withInputParameters: hueBlendModeParams);
hueBlendMode?.outputImage


// CILightenBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightenBlendMode

let lightenBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                 "inputBackgroundImage": secondImg]
let lightenBlendMode = CIFilter(name: "CILightenBlendMode", withInputParameters: lightenBlendModeParams);
lightenBlendMode?.outputImage


// CILinearBurnBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearBurnBlendMode

let linearBurnBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                     "inputBackgroundImage": secondImg]
let linearBurnBlendMode = CIFilter(name: "CILinearBurnBlendMode", withInputParameters: linearBurnBlendModeParams);
linearBurnBlendMode?.outputImage


// CILinearDodgeBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearDodgeBlendMode

let linearDodgeBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let linearDodgeBlendMode = CIFilter(name: "CILinearDodgeBlendMode", withInputParameters: linearDodgeBlendModeParams);
linearDodgeBlendMode?.outputImage


// CILuminosityBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILuminosityBlendMode

let luminosityBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                         "inputBackgroundImage": secondImg]
let luminosityBlendMode = CIFilter(name: "CILuminosityBlendMode", withInputParameters: luminosityBlendModeParams);
luminosityBlendMode?.outputImage


// CIMaximumCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumCompositing

let maximumCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let maximumCompositing = CIFilter(name: "CIMaximumCompositing", withInputParameters: maximumCompositingParams);
maximumCompositing?.outputImage


// CIMinimumCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumCompositing

let minimumCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let minimumCompositing = CIFilter(name: "CIMinimumCompositing", withInputParameters: minimumCompositingParams);
minimumCompositing?.outputImage


// CIMultiplyBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyBlendMode

let multiplyBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let multiplyBlendMode = CIFilter(name: "CIMultiplyBlendMode", withInputParameters: multiplyBlendModeParams);
multiplyBlendMode?.outputImage


// CIMultiplyCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyCompositing

let multiplyCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                      "inputBackgroundImage": secondImg]
let multiplyCompositing = CIFilter(name: "CIMultiplyCompositing", withInputParameters: multiplyCompositingParams);
multiplyCompositing?.outputImage


// CIOverlayBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOverlayBlendMode

let overlayBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let overlayBlendMode = CIFilter(name: "CIOverlayBlendMode", withInputParameters: overlayBlendModeParams);
overlayBlendMode?.outputImage

// CIPinLightBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinLightBlendMode

let pinLightBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                     "inputBackgroundImage": secondImg]
let pinLightBlendMode = CIFilter(name: "CIPinLightBlendMode", withInputParameters: pinLightBlendModeParams);
pinLightBlendMode?.outputImage


// CISaturationBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISaturationBlendMode

let saturationBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                      "inputBackgroundImage": secondImg]
let saturationBlendMode = CIFilter(name: "CISaturationBlendMode", withInputParameters: saturationBlendModeParams);
saturationBlendMode?.outputImage


// CIScreenBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIScreenBlendMode

let screenBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let screenBlendMode = CIFilter(name: "CIScreenBlendMode", withInputParameters: screenBlendModeParams);
screenBlendMode?.outputImage


// CISoftLightBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISoftLightBlendMode

let softLightBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputBackgroundImage": secondImg]
let softLightBlendMode = CIFilter(name: "CISoftLightBlendMode", withInputParameters: softLightBlendModeParams);
softLightBlendMode?.outputImage


// CISourceAtopCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceAtopCompositing

let sourceAtopCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                       "inputBackgroundImage": secondImg]
let sourceAtopCompositing = CIFilter(name: "CISoftLightBlendMode", withInputParameters: sourceAtopCompositingParams);
sourceAtopCompositing?.outputImage


// CISourceInCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceInCompositing

let sourceInCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                          "inputBackgroundImage": secondImg]
let sourceInCompositing = CIFilter(name: "CISourceInCompositing", withInputParameters: sourceInCompositingParams);
sourceInCompositing?.outputImage


// CISourceOutCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOutCompositing

let sourceOutCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputBackgroundImage": secondImg]
let sourceOutCompositing = CIFilter(name: "CISourceOutCompositing", withInputParameters: sourceOutCompositingParams);
sourceOutCompositing?.outputImage


// CISourceOverCompositing
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOverCompositing

let sourceOverCompositingParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                         "inputBackgroundImage": secondImg]
let sourceOverCompositing = CIFilter(name: "CISourceOverCompositing", withInputParameters: sourceOverCompositingParams);
sourceOverCompositing?.outputImage


// CISubtractBlendMode
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISubtractBlendMode

let subtractBlendModeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                          "inputBackgroundImage": secondImg]
let subtractBlendMode = CIFilter(name: "CISubtractBlendMode", withInputParameters: subtractBlendModeParams);
subtractBlendMode?.outputImage
