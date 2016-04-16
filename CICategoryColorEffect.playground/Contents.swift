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

// CIColorCrossPolynomial
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial

let colorCrossPolynomialParams : [String : AnyObject] = [kCIInputImageKey: img,
                                               "inputRedCoefficients": CIVector(string: "[1 0 0 0 0 0 0 0 0 0]"),
                                               "inputGreenCoefficients" : CIVector(string: "[0 1 0 0 0 0 0 0 0 0]"),
                                               "inputBlueCoefficients" : CIVector(string: "[0 0 1 0 0 0 0 0 0 0]")]

let colorCrossPolynomial = CIFilter(name: "CIColorCrossPolynomial", withInputParameters: colorCrossPolynomialParams);
colorCrossPolynomial?.outputImage

/*
// CIColorCube
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCube

let count = 64
let cube = Helper.getCube(count)


let colorCubeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                         "inputCubeDimension": count,
                                                         "inputCubeData" : NSData(bytes: cube, length: count)]

let colorCube = CIFilter(name: "CIColorCube", withInputParameters: colorCubeParams);
colorCube?.outputImage */

// CIColorMap
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap

let colorMapParams : [String : AnyObject] = [kCIInputImageKey: img,
                                             "inputGradientImage" : img]

let colorMap = CIFilter(name: "CIColorMap", withInputParameters: colorMapParams);
colorMap?.outputImage


// CIColorMonochrome
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome

let colorMonochromeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                             "inputColor" : NSColor.blueColor().asCIColor,
                                             "inputIntensity" : 1.0]

let colorMonochrome = CIFilter(name: "CIColorMonochrome", withInputParameters: colorMonochromeParams);
colorMonochrome?.outputImage


// CIColorPosterize
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPosterize

let colorPosterizeParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                    "inputLevels" : 6.0]

let colorPosterize = CIFilter(name: "CIColorPosterize", withInputParameters: colorPosterizeParams);
colorPosterize?.outputImage


// CIFalseColor
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor

let falseColorParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputColor0" : NSColor.blueColor().asCIColor,
                                                   "inputColor1" : NSColor.yellowColor().asCIColor]

let falseColor = CIFilter(name: "CIFalseColor", withInputParameters: falseColorParams);
falseColor?.outputImage


// CIMaskToAlpha
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskToAlpha

let maskToAlphaParams : [String : AnyObject] = [kCIInputImageKey: img]

let maskToAlpha = CIFilter(name: "CIMaskToAlpha", withInputParameters: maskToAlphaParams);
maskToAlpha?.outputImage


// CIMaximumComponent
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumComponent

let maximumComponentParams : [String : AnyObject] = [kCIInputImageKey: img]

let maximumComponent = CIFilter(name: "CIMaximumComponent", withInputParameters: maximumComponentParams);
maximumComponent?.outputImage


// CIMinimumComponent
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumComponent

let minimumComponentParams : [String : AnyObject] = [kCIInputImageKey: img]

let minimumComponent = CIFilter(name: "CIMinimumComponent", withInputParameters: minimumComponentParams);
minimumComponent?.outputImage


// CIPhotoEffectChrome
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectChrome

let photoEffectChromeParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectChrome = CIFilter(name: "CIPhotoEffectChrome", withInputParameters: photoEffectChromeParams);
photoEffectChrome?.outputImage


// CIPhotoEffectFade
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectFade

let photoEffectFadeParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectFade = CIFilter(name: "CIPhotoEffectFade", withInputParameters: photoEffectFadeParams);
photoEffectFade?.outputImage


// CIPhotoEffectInstant
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectInstant

let photoEffectInstantParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectInstant = CIFilter(name: "CIPhotoEffectInstant", withInputParameters: photoEffectInstantParams);
photoEffectInstant?.outputImage


// CIPhotoEffectMono
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectMono

let photoEffectMonoParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectMono = CIFilter(name: "CIPhotoEffectMono", withInputParameters: photoEffectMonoParams);
photoEffectMono?.outputImage


// CIPhotoEffectNoir
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectNoir

let photoEffectNoirParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectNoir = CIFilter(name: "CIPhotoEffectNoir", withInputParameters: photoEffectNoirParams);
photoEffectNoir?.outputImage


// CIPhotoEffectProcess
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectProcess

let photoEffectProcessParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectProcess = CIFilter(name: "CIPhotoEffectProcess", withInputParameters: photoEffectProcessParams);
photoEffectProcess?.outputImage


// CIPhotoEffectTonal
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTonal

let photoEffectTonalParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectTonal = CIFilter(name: "CIPhotoEffectTonal", withInputParameters: photoEffectTonalParams);
photoEffectTonal?.outputImage


// CIPhotoEffectTransfer
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTransfer

let photoEffectTransferParams : [String : AnyObject] = [kCIInputImageKey: img]

let photoEffectTransfer = CIFilter(name: "CIPhotoEffectTransfer", withInputParameters: photoEffectTransferParams);
photoEffectTransfer?.outputImage


// CISepiaTone
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISepiaTone

let sepiaToneParams : [String : AnyObject] = [kCIInputImageKey: img,
                                              "inputIntensity" : 1.0]

let sepiaTone = CIFilter(name: "CISepiaTone", withInputParameters: sepiaToneParams);
sepiaTone?.outputImage


// CIVignette
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette

let vignetteParams : [String : AnyObject] = [kCIInputImageKey: img,
                                              "inputIntensity" : 0.0,
                                              "inputRadius" : 1.0]

let vignette = CIFilter(name: "CIVignette", withInputParameters: vignetteParams);
vignette?.outputImage


// CIVignetteEffect
// https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect

let vignetteEffectParams : [String : AnyObject] = [kCIInputImageKey: img,
                                                   "inputCenter" : CIVector(string: "[150 150]"),
                                                   "inputIntensity" : 0.5,
                                                   "inputRadius" : 1.0]

let vignetteEffect = CIFilter(name: "CIVignetteEffect", withInputParameters: vignetteEffectParams);
vignetteEffect?.outputImage

