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
    
    func getScreens() -> [UIView] {
        var allScreen: [UIView] = []
        
        allScreen.append(setFirstScreen())
        allScreen.append(setSecondScreen())
        allScreen.append(setThirdScreen())
        
        return allScreen
    }
    
    fileprivate func setFirstScreen() -> UIView {
        let title = "Get inspired"
        let subTitle = "Don`t know what to eat? Take a picture, we`ll suggest things to cook with your ingredients."
        let image = UIImage(named: "inspired")!
        
        let screen = SlideScreen1()
        screen.configView(backgroudColor: UIColor(red: 0.99, green: 0.65, blue: 0.31, alpha: 1.00), title: title, subTitle: subTitle, image: image)
        return screen
    }
    
    fileprivate func setSecondScreen() -> UIView {
        let title = "Easy & healthy"
        let subTitle = "Find thousands of easy and healthy recipes so you save time and eat better."
        let image = UIImage(named: "healthy")!
        
        let screen = SlideScreen1()
        screen.configView(backgroudColor: UIColor(red: 0.99, green: 0.71, blue: 0.56, alpha: 1.00), title: title, subTitle: subTitle, image: image)
        return screen
    }
    
    fileprivate func setThirdScreen() -> UIView {
        let title = "Save your favorites"
        let subTitle = "Save your favorite recipes and get reminders to buy the ingredients to cook them."
        let image = UIImage(named: "favorites")!
        
        let screen = SlideScreen2()
        screen.configView(backgroudColor: UIColor(red: 0.13, green: 0.65, blue: 0.53, alpha: 1.00), title: title, subTitle: subTitle, image: image)
        return screen
    }
}
