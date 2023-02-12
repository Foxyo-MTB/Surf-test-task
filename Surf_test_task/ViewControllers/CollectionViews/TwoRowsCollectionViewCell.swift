//
//  TwoRowsCollectionViewCell.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit
import SnapKit

final class TwoRowsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "OneStringCollectionViewCell"
    
    private let courseLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Fonts.sFProDisplayMedium(size: 14)
        label.layer.cornerRadius = 12
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(data: CoursesTwoRows) {
        self.layer.cornerRadius = 12
        addSubview(courseLabel)
        courseLabel.fillSuperview()
        courseLabel.text = data.name
        changeColor(isButtonPressed: data.isButtonPressed)
        
    }
    
    func changeColor(isButtonPressed: Bool) {
        if isButtonPressed == true {
            courseLabel.backgroundColor = Colors.buttonDarkGray
            courseLabel.textColor = .white
        } else {
            courseLabel.backgroundColor = Colors.buttonLightGray
            courseLabel.textColor = Colors.darkGray
        }
    }
    
    
}



