//
//  Constants.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit

enum Pictures {
    
    static let backgroundImage = UIImage(named: "Background")
}

enum Fonts {
    
    static func sFProDisplayBold(size: CGFloat) -> UIFont {
        UIFont(name: "SFProDisplay-Bold", size: size) ?? UIFont()
    }
    
    static func sFProDisplayMedium(size: CGFloat) -> UIFont {
        UIFont(name: "SFProDisplay-Medium", size: size) ?? UIFont()
    }
    
    static func sFProDisplayRegular(size: CGFloat) -> UIFont {
        UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont()
    }
}

enum SurfInfotext {
    
    static let workUnderSupervise = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
    
    static let workConditions = "Получай стипендию, выстраивай удобный график, работай на современном железе."
}

enum Colors {
    
    static let darkGray = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
    
    static let lightGray = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
    
    static let buttonLightGray = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
    
    static let buttonDarkGray = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)

}


struct Courses {
    
    var name: String
    
    var isButtonPressed: Bool
    
    //var width: CGSize
}

struct CoursesTwoRows {
    
    var name: String
    
    var isButtonPressed: Bool
    
    var width: Double
    
    var height: Double
}
