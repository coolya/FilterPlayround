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

extension CIImage {
    func render(rect : CGRect) -> CIImage {
        let ctx = CIContext(options: nil);
        let res = ctx.createCGImage(self, fromRect: rect);
        return  CIImage(CGImage:res);
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


// CIBumpDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortion
let bumpDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputCenter" : CIVector(string: "[320 229]"),
                                                   "inputRadius": 300.00,
                                                   "inputScale" : 0.5]

let bumpDistortion = CIFilter(name: "CIBumpDistortion", withInputParameters: bumpDistortionParams);
bumpDistortion?.outputImage


// CIBumpDistortionLinear
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortionLinear
let bumpDistortionLinearParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputCenter" : CIVector(string: "[320 229]"),
                                                   "inputRadius": 300.00,
                                                   "inputAngle" : 90.0,
                                                   "inputScale" : 0.5]

let bumpDistortionLinear = CIFilter(name: "CIBumpDistortionLinear", withInputParameters: bumpDistortionLinearParams);
bumpDistortionLinear?.outputImage


// CICircleSplashDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircleSplashDistortion
let circleSplashDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                         "inputCenter" : CIVector(string: "[320 229]"),
                                                         "inputRadius": 150.0]

let circleSplashDistortion = CIFilter(name: "CICircleSplashDistortion", withInputParameters: circleSplashDistortionParams);
circleSplashDistortion?.outputImage?.render(img.extent)


// CICircularWrap
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularWrap
let circularWrapParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                         "inputCenter" : CIVector(string: "[320 229]"),
                                                         "inputRadius": 300.00,
                                                         "inputAngle" : 90.0]

let circularWrap = CIFilter(name: "CICircularWrap", withInputParameters: circularWrapParams);
circularWrap?.outputImage


// CIDroste
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDroste
let drosteParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                 "inputInsetPoint0" : CIVector(string: "[200 200]"),
                                                 "inputInsetPoint1": CIVector(string: "[400 400]"),
                                                 "inputStrands" : 1.0,
                                                 "inputPeriodicity" : 1.0,
                                                 "inputRotation" : 0.0,
                                                 "inputZoom" : 1.0]

let droste = CIFilter(name: "CIDroste", withInputParameters: drosteParams);
droste?.outputImage?.render(img.extent)


let inputMask = CIFilter(name: "CICheckerboardGenerator", withInputParameters: ["inputColor0" : NSColor.whiteColor().asCIColor,
    "inputColor1" : NSColor.blackColor().asCIColor, "inputWidth" : 25.0, "inputCenter" : CIVector(string: "[640 458]")])!.outputImage!

// CIDisplacementDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion
let displacementDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                           "inputDisplacementImage" : inputMask,
                                           "inputScale": 100.0]

let displacementDistortion = CIFilter(name: "CIDisplacementDistortion", withInputParameters: displacementDistortionParams);

displacementDistortion?.outputImage


// CIGlassDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassDistortion
let glassDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                           "inputTexture" : inputMask,
                                                           "inputScale": 100.0,
                                                           "inputCenter" : CIVector(string: "[320 229]") ]

let glassDistortion = CIFilter(name: "CIGlassDistortion", withInputParameters: glassDistortionParams);
glassDistortion?.outputImage



// CIGlassLozenge
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge
let glassLozengeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputPoint0" : CIVector(string: "[150 150]"),
                                                    "inputPoint1": CIVector(string: "[350 350]"),
                                                    "inputRadius" : 100.0,
                                                    "inputRefraction" : 1.70]

let glassLozenge = CIFilter(name: "CIGlassLozenge", withInputParameters: glassLozengeParams);
glassLozenge?.outputImage


// CIHoleDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHoleDistortion
let holeDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                 "inputCenter" : CIVector(string: "[150 150]"),
                                                 "inputRadius" : 100.0]

let holeDistortion = CIFilter(name: "CIHoleDistortion", withInputParameters: holeDistortionParams);
holeDistortion?.outputImage


// CILightTunnel
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightTunnel
let lightTunnelParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputCenter" : CIVector(string: "[320 229]"),
                                                   "inputRadius" : 100.0,
                                                   "inputRotation" : 1.0]

let lightTunnel = CIFilter(name: "CILightTunnel", withInputParameters: lightTunnelParams);
lightTunnel?.outputImage?.render(img.extent)


// CIPinchDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinchDistortion
let pinchDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                "inputCenter" : CIVector(string: "[320 229]"),
                                                "inputRadius" : 300.0,
                                                "inputScale" : 0.50]

let pinchDistortion = CIFilter(name: "CIPinchDistortion", withInputParameters: pinchDistortionParams);
pinchDistortion?.outputImage


// CIStretchCrop
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop
let stretchCropParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputSize" : CIVector(string: "[520 520]"),
                                                    "inputCropAmount" : 1.0,
                                                    "inputCenterStretchAmount" : 1.0]

let stretchCrop = CIFilter(name: "CIStretchCrop", withInputParameters: stretchCropParams);
stretchCrop?.outputImage


// CITorusLensDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITorusLensDistortion
let torusLensDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                "inputCenter" : CIVector(string: "[320 229]"),
                                                "inputRadius" : 160.0,
                                                "inputWidth" : 80.0,
                                                "inputRefraction" : 1.70]

let torusLensDistortion = CIFilter(name: "CITorusLensDistortion", withInputParameters: torusLensDistortionParams);
torusLensDistortion?.outputImage


// CITwirlDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwirlDistortion
let twirlDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                        "inputCenter" : CIVector(string: "[320 229]"),
                                                        "inputRadius" : 160.0,
                                                        "inputAngle" : 3.14]

let twirlDistortion = CIFilter(name: "CITwirlDistortion", withInputParameters: twirlDistortionParams);
twirlDistortion?.outputImage


// CIVortexDistortion
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVortexDistortion
let vortexDistortionParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputCenter" : CIVector(string: "[320 229]"),
                                                    "inputRadius" : 160.0,
                                                    "inputAngle" : 50.0]

let vortexDistortion = CIFilter(name: "CIVortexDistortion", withInputParameters: vortexDistortionParams);
vortexDistortion?.outputImage

