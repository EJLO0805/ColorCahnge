//
//  ViewController.swift
//  ColorCahnge
//
//  Created by 羅以捷 on 2022/7/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        doraemonBackground.backgroundColor = UIColor(red: 248/255, green: 181/255, blue: 171/255, alpha: 1)
        redColorValue.text = "R 248"
        greenColorValue.text = "G 181"
        blueColorValue.text = "B 171"
        alphaValue.text = "Alpha 255"
        redSlider.value = 248/255
        greenSlider.value = 181/255
        blueSlider.value = 171/255
        alphaSlider.value = 255/255
        // Do any additional setup after loading the view.
    }
    var formatter = NumberFormatter()
    @IBOutlet weak var doraemon: UIImageView!
    @IBOutlet weak var doraemonBackground: UIView!
    @IBOutlet weak var redColorValue: UILabel!
    @IBOutlet weak var greenColorValue: UILabel!
    @IBOutlet weak var blueColorValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redColorEnter: UITextField!
    @IBOutlet weak var greenColorEnter: UITextField!
    @IBOutlet weak var blueColorEnter: UITextField!
    @IBOutlet weak var alphaEnter: UITextField!
    func colorChange(){
        formatter.maximumFractionDigits = 0
        doraemonBackground.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        redColorValue.text = "R \(formatter.string(for: redSlider.value*255)!)"
        greenColorValue.text = "G \(formatter.string(for: greenSlider.value*255)!)"
        blueColorValue.text = "B \(formatter.string(for: blueSlider.value*255)!)"
        alphaValue.text = "Alpha \(formatter.string(for: alphaSlider.value*255)!)"

    }
    @IBAction func changeColor(_ sender: UISlider) {
        colorChange()
    }
    @IBAction func randonColor(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0.8...1)
        colorChange()
    }
    @IBAction func enterTheClor(_ sender: Any) {
        let redColor = Double(redColorEnter.text!)
        let greenColor = Double(greenColorEnter.text!)
        let blueColor = Double(blueColorEnter.text!)
        let alpha = Double(alphaEnter.text!)
        if redColor != nil {
            if redColor! > 255 {
                redSlider.value = 1
            } else if redColor! < 0 {
                redSlider.value = 0
            } else {
                redSlider.value = Float(redColor!/255)
            }
        } else {
            redSlider.value = redSlider.value
        }
        if greenColor != nil {
            if greenColor! > 255 {
                greenSlider.value = 1
            } else if greenColor! < 0 {
                greenSlider.value = 0
            } else {
                greenSlider.value = Float(greenColor!/255)
            }
        } else {
            greenSlider.value = greenSlider.value
        }
        if blueColor != nil {
            if blueColor! > 255 {
                blueSlider.value = 1
            } else if blueColor! < 0 {
                blueSlider.value = 0
            } else {
                blueSlider.value = Float(blueColor!/255)
            }
        } else {
            blueSlider.value = blueSlider.value
        }
        if alpha != nil {
            if alpha! > 255 {
                alphaSlider.value = 1
            } else if alpha! < 0 {
                alphaSlider.value = 0
            } else {
                alphaSlider.value = Float(alpha!/255)
            }
        } else {
            alphaSlider.value = alphaSlider.value
        }
        colorChange()
        redColorEnter.text = ""
        blueColorEnter.text = ""
        greenColorEnter.text = ""
        alphaEnter.text = ""
    }
    @IBAction func closeKeyBoard(_ sender: Any) {
        view.endEditing(true)
    }
}

