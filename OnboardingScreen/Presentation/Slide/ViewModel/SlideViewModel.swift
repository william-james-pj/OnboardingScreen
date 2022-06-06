//
//  SlideViewModel.swift
//  OnboardingScreen
//
//  Created by Pinto Junior, William James on 03/06/22.
//

import UIKit

class SlideViewModel {
    
    init() {
    }
    
    func getScreens() -> [ScreenModel] {
        let screen1 = ScreenModel(backgroudColor: UIColor(red: 0.99, green: 0.65, blue: 0.31, alpha: 1.00))
        let screen2 = ScreenModel(backgroudColor: UIColor(red: 0.99, green: 0.71, blue: 0.56, alpha: 1.00))
        let screen3 = ScreenModel(backgroudColor: UIColor(red: 0.13, green: 0.65, blue: 0.53, alpha: 1.00))
        
        let allScreen = [screen1, screen2, screen3]
        
        return allScreen
    }
}
