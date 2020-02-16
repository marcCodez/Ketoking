//
//  ViewController.swift
//  SmartCameraLBTA
//
//  Created by Brian Voong on 7/12/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit
import AVKit
import Vision
import AVFoundation

class FoodScannerViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var player: AVAudioPlayer?
    var status = true
    func playMusic() {
        //condition
        if (status == true){
        let soundURL = Bundle.main.url(forResource: "avocado", withExtension: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        player?.play()
        status = false
        //
        }
        
    }
    
    func playStrawberry() {
        //condition
        if (status == true){
            let soundURL = Bundle.main.url(forResource: "strawberry", withExtension: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: soundURL!)
            } catch {
                print(error)
            }
            player?.play()
            status = false
            //
        }
        
    }
    
    func play() {
        //condition
        if (status == true){
            let soundURL = Bundle.main.url(forResource: "strawberry", withExtension: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: soundURL!)
            } catch {
                print(error)
            }
            player?.play()
            status = false
            //
        }
        
    }
    
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here is where we start up the camera
        // for more details visit: https://www.letsbuildthatapp.com/course_video?id=1252
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        
        //        VNImageRequestHandler(cgImage: <#T##CGImage#>, options: [:]).perform(<#T##requests: [VNRequest]##[VNRequest]#>)
        
        setupIdentifierConfidenceLabel()
    }
    
    
    @IBOutlet var strawberry: UIStackView!
    @IBOutlet weak var egg: UIStackView!
    @IBOutlet weak var almond: UIStackView!
    @IBOutlet weak var avocado: UIStackView!
    
    //override func viewWillAppear(_ animated: Bool) {
        // Hide the strawberry button
        //strawberry.isHidden = true
   // }
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //        print("Camera was able to capture a frame:", Date())
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // !!!Important
        // make sure to go download the models at https://developer.apple.com/machine-learning/ scroll to the bottom
        guard let model = try? VNCoreMLModel(for: ImageClassifier().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            //perhaps check the err
            
            //            print(finishedReq.results)
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            DispatchQueue.main.async {
                self.identifierLabel.text = "\(firstObservation.identifier) \(Int(firstObservation.confidence * 100))% Confidence"
                if firstObservation.confidence >= 0.9 {
    
                
                switch firstObservation.identifier{
                case "Eggs":
                    self.identifierLabel.text = "Keto Friendly!"
                    self.identifierLabel.backgroundColor = .green
                    self.egg.isHidden = false
                    self.egg.layer.zPosition = 1
                    
                case "Strawberries":
                    self.identifierLabel.text = "Keto Friendly!"
                    self.identifierLabel.backgroundColor = .green
                    self.strawberry.isHidden = false
                    self.strawberry.layer.zPosition = 1
                    self.playStrawberry()
                    
                case "Avocado":
                    self.identifierLabel.text = "Keto Friendly!"
                    self.identifierLabel.backgroundColor = .green
                    self.avocado.isHidden = false
                    self.avocado.layer.zPosition = 1
                    self.playMusic()
                
                    
                case "Almonds":
                    self.identifierLabel.text = "Keto Friendly!"
                    self.identifierLabel.backgroundColor = .green
                    self.almond.isHidden = false
                    self.almond.layer.zPosition = 1
                   
                    
                case "Bread":
                        self.identifierLabel.text = "Not Keto Friendly!"
                        self.identifierLabel.backgroundColor = .red
                    
                    
                case "Potato":
                        self.identifierLabel.text = "Not Keto Friendly!"
                        self.identifierLabel.backgroundColor = .red
                    
                 
                    default:
                        self.identifierLabel.backgroundColor = .white
                        self.strawberry.isHidden = true
                        self.egg.isHidden = true
                        self.avocado.isHidden = true
                        self.almond.isHidden = true

                    
                }
                }
                
                
                
                
                
              
                
                
            }
            
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
}

