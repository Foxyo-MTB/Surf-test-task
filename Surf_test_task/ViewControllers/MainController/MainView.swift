//
//  mainView.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = Pictures.backgroundImage
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let bottomSendRequestView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let sendRequestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.titleLabel?.font = Fonts.sFProDisplayMedium(size: 16)
        button.backgroundColor = Colors.darkGray
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let wantToJoinLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = Fonts.sFProDisplayRegular(size: 14)
        label.textColor = Colors.lightGray
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let transparentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let surfTraineeLabel: UILabel = {
        let label = UILabel()
        label.text = "Стажировка в Surf"
        label.font = Fonts.sFProDisplayBold(size: 24)
        label.textColor = Colors.darkGray
        return label
    }()
    
    private let surfInfoLabel: UILabel = {
        let label = UILabel()
        label.text = SurfInfotext.workUnderSupervise
        label.font = Fonts.sFProDisplayRegular(size: 14)
        label.textColor = Colors.lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let oneStringCollectionView: OneRowCollectionView = {
        let collectionView = OneRowCollectionView()
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let surfSecondInfoLabel: UILabel = {
        let label = UILabel()
        label.text = SurfInfotext.workConditions
        label.font = Fonts.sFProDisplayRegular(size: 14)
        label.textColor = Colors.lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let twoStringCollectionView: TwoRowsCollectionView = {
        let collectionView = TwoRowsCollectionView()
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        infoView.roundCorners(with: [
            .layerMaxXMinYCorner,
            .layerMinXMinYCorner,
        ],
            radius: 30)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sendRequestButtonPassesToVC() -> UIButton {
        sendRequestButton
    }
}

extension MainView {
    
    private func setupView() {
        
        addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        addSubview(bottomSendRequestView)
        bottomSendRequestView.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        bottomSendRequestView.addSubview(sendRequestButton)
        sendRequestButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-58)
            make.height.equalTo(60)
            make.width.equalTo(219)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bottomSendRequestView.addSubview(wantToJoinLabel)
        wantToJoinLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-78)
        }
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomSendRequestView.snp.top)
        }
        
        scrollView.addSubview(transparentView)
        transparentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalToSuperview().offset(-190)
        }
        
        scrollView.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(transparentView.snp.bottom)
            make.height.equalTo(scrollView.snp.height)
            make.bottom.equalToSuperview()
        }
        
        infoView.addSubview(surfTraineeLabel)
        surfTraineeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(24)
        }
        
        infoView.addSubview(surfInfoLabel)
        surfInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(surfTraineeLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(surfTraineeLabel.snp.bottom).offset(12)
        }
        
        infoView.addSubview(oneStringCollectionView)
        oneStringCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(surfInfoLabel.snp.bottom).offset(12)
            make.height.equalTo(50)
        }
        
        infoView.addSubview(surfSecondInfoLabel)
        surfSecondInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(surfTraineeLabel.snp.leading)
            make.trailing.equalToSuperview()
            make.top.equalTo(oneStringCollectionView.snp.bottom).offset(18)
        }
        
        infoView.addSubview(twoStringCollectionView)
        twoStringCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(surfSecondInfoLabel.snp.bottom)
            make.height.equalTo(150)
        }
    }
}

//MARK: - Extension to round corners

extension UIView {
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [CACornerMask]
    }
}

