//
//  QRCodeViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 11/2/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import AVFoundation

protocol GetQRCodeDelegate {
    func getQRCodeSuccess(qrCodeValue: String)
}

class QRCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    let cameraView = UIView()
    var constraintsNeeded = true
    
    var isWaitingConfirm = true
    var qrCodeValue: String!
    
    var delegate: GetQRCodeDelegate!
    
    //camera
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    // Added to support different barcodes
    let supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(cameraView)
        
        view.setNeedsUpdateConstraints()
        initCam()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            
            cameraView.autoCenterInSuperview()
            cameraView.autoSetDimensions(to: CGSize(width: 300, height: 300))
        }
    }
    
    
    func initCam() {
        var captureDevice: AVCaptureDevice!
        
        captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            // Detect all the supported bar code
            captureMetadataOutput.metadataObjectTypes = supportedBarCodes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.connection.videoOrientation = .landscapeLeft
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture
            captureSession?.startRunning()
            
            // Initialize QR Code Frame to highlight the QR code
            cameraView.layer.borderColor = UIColor.green.cgColor
            cameraView.layer.borderWidth = 2
            view.addSubview(cameraView)
            view.bringSubview(toFront: cameraView)
            
        } catch {
            print(error)
            return
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects == nil || metadataObjects.count == 0 {
            cameraView.frame = .zero
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if supportedBarCodes.contains(metadataObj.type) {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            cameraView.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                qrCodeValue = metadataObj.stringValue
                if isWaitingConfirm {
                    isWaitingConfirm = false
                    Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goBack), userInfo: nil, repeats: false)
                }
                
            }
        }
    }
    
    @objc func goBack() {
        dismiss(animated: false, completion: nil)
        if delegate != nil {
            delegate.getQRCodeSuccess(qrCodeValue: qrCodeValue)
        }
        MusicManager.playSound(filename: "camera.wav")
    }
}
