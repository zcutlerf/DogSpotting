////
////  Camera.swift
////  DogSpotting
////
////  Created by Cory Tripathy on 4/6/23.
////
//
//import Foundation
//import AVFoundation
//
//class Camera {
//    let captureSession = AVCaptureSession()
//    
//    func startCaptureSession() {
//        self.captureSession.beginConfiguration()
//        
//        let photoOutput = AVCapturePhotoOutput()
////        photoOutput.isHighResolutionCaptureEnabled = true
//        photoOutput.isLivePhotoCaptureEnabled = photoOutput.isLivePhotoCaptureSupported
//        
//        guard self.captureSession.canAddOutput(photoOutput) else { return }
//        self.captureSession.sessionPreset = .photo
//        self.captureSession.addOutput(photoOutput)
//        
//        self.previewView.session = captureSession
//        
//        self.captureSession.commitConfiguration()
//        self.captureSession.startRunning()
//    }
//}
