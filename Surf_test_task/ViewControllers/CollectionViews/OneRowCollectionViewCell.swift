//
//  OneStringCollectionViewCell.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit
import SnapKit

final class OneRowCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "OneStringCollectionViewCell"
    
    private let courseLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Fonts.sFProDisplayMedium(size: 14)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.edgeInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(data: Courses) {
        self.layer.cornerRadius = 12
        addSubview(courseLabel)
        courseLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
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





