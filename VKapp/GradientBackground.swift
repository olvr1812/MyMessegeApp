//
//  GradientBackground.swift
//  VKapp
//
//  Created by Оливер Салихов on 29.01.2022.
//

import UIKit

class GradientBackground: UIView {
    
    
    //Изменяем класс слоя
    override static var layerClass: AnyClass {
        
        return CAGradientLayer.self
        
    }
    
    //Вычисляемая переменная для удобной работы со слоем
    var gradientLayer: CAGradientLayer {
        
        return self.layer as! CAGradientLayer
        
    }
    
    
    // Методы которые будут обновлять параметр слоя с градиентом
    func updateLocations() {
        
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
        
    }

    func updateColors() {
        
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
        
    }

    func updateStartPoint() {
        
        self.gradientLayer.startPoint = startPoint
        
    }

    func updateEndPoint() {
        
        self.gradientLayer.endPoint = endPoint
        
        
    }
    
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            self.updateColors()
            
        }
        
    }
    
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            self.updateColors()
            
        }
        
    }

    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocations()
            
        }
        
    }
    
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
            
        }
        
    }

    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
            
        }
        
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPoint()
            
        }
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
