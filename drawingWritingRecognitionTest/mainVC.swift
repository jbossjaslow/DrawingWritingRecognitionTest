//
//  ViewController.swift
//  drawingWritingRecognitionTest
//
//  Created by Josh Jaslow on 4/8/18.
//  Copyright © 2018 Jaslow Enterprises. All rights reserved.
//

import UIKit
import ChromaColorPicker

class mainVC: UIViewController {
    
    @IBOutlet weak var canvas: CanvasView!
    
    var colorPicker: ChromaColorPicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorPicker = ChromaColorPicker(frame: CGRect(x: 0, y: view.bounds.width * 0.25, width: view.bounds.width, height: view.bounds.width))
        //colorPicker = ChromaColorPicker(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: colorPicker.sizeThatFits(CGSize(width: view.bounds.width, height: view.bounds.height))))
        colorPicker.delegate = self as? ChromaColorPickerDelegate //ChromaColorPickerDelegate
        colorPicker.padding = 5
        colorPicker.stroke = 3
        colorPicker.hexLabel.textColor = .white
        //colorPicker.sizeThatFits(CGSize(width: view.bounds.width, height: view.bounds.height))
    }

    @IBAction func clearScreen(_ sender: UIButton) {
        canvas.clearCanvas()
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        view.addSubview(colorPicker)
    }
}

