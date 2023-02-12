//
//  OneStringCollectionView.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit

final class TwoRowsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var cells = [CoursesTwoRows(name: "IOS", isButtonPressed: false, width: 70.33333333333333, height: 44),
                         CoursesTwoRows(name: "Android", isButtonPressed: false, width: 95.66666666666667, height: 44),
                         CoursesTwoRows(name: "Design", isButtonPressed: false, width: 90.33333333333333, height: 44),
                         CoursesTwoRows(name: "QA", isButtonPressed: false, width: 67.33333333333333, height: 44),
                         CoursesTwoRows(name: "Flutter", isButtonPressed: false, width: 87.0, height: 44),
                         CoursesTwoRows(name: "PM", isButtonPressed: false, width: 68.33333333333333, height: 44),
                         CoursesTwoRows(name: "C++", isButtonPressed: false, width: 75.0, height: 44),
                         CoursesTwoRows(name: "Java", isButtonPressed: false, width: 76.66666666666667, height: 44),
                         CoursesTwoRows(name: "Javascript", isButtonPressed: false, width: 110.66666666666667, height: 44),
                         CoursesTwoRows(name: "GO", isButtonPressed: false, width: 68.66666666666667, height: 44)
    ]

    private let defaultScrollIndexPath = IndexPath(row: 0, section: 0)
    private var isApplicationJustLaunched = false
    
    init() {
        let rowLayout = RowLayout()
        super.init(frame: .zero, collectionViewLayout: rowLayout)
        delegate = self
        dataSource = self
        register(TwoRowsCollectionViewCell.self, forCellWithReuseIdentifier: TwoRowsCollectionViewCell.reuseId)
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        showsHorizontalScrollIndicator = false
        if let rowLayout = collectionViewLayout as? RowLayout {
            rowLayout.delegate = self
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setDefaultCollectionViewPosition()
    }
    
    private func setDefaultCollectionViewPosition() {
        if isApplicationJustLaunched == false {
            self.scrollToItem(at: defaultScrollIndexPath, at: .left, animated: false)
            isApplicationJustLaunched = true
        } else {
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       1
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: TwoRowsCollectionViewCell.reuseId, for: indexPath) as! TwoRowsCollectionViewCell
        cell.setupView(data: cells[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TwoRowsCollectionViewCell {
            cells[indexPath.item].isButtonPressed.toggle()
            cell.changeColor(isButtonPressed: cells[indexPath.item].isButtonPressed)
        }
    }
}

extension TwoRowsCollectionView: RowLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, cellAtIndexPath indexPath: IndexPath) -> CGSize {
        let width = cells[indexPath.row].width
        let height = cells[indexPath.row].height
        return CGSize(width: width, height: height)
    }
}


