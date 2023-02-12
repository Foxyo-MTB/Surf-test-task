//
//  OneStringCollectionView.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit

final class OneRowCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    private var cells = [Courses(name: "IOS", isButtonPressed: false),
                         Courses(name: "Android", isButtonPressed: false),
                         Courses(name: "Design", isButtonPressed: false),
                         Courses(name: "QA", isButtonPressed: false),
                         Courses(name: "Flutter", isButtonPressed: false),
                         Courses(name: "PM", isButtonPressed: false),
                         Courses(name: "C++", isButtonPressed: false),
                         Courses(name: "Java", isButtonPressed: false),
                         Courses(name: "Javascript", isButtonPressed: false),
                         Courses(name: "GO", isButtonPressed: false)
    ]
    private let numberOfItems = 500
    private let defaultScrollIndexPath = IndexPath(row: 250, section: 0)
    private var isApplicationJustLaunched = false
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // Здесь сделал спейсинг 20, так как из-за края экрана торчала часть другой ячейки.
        layout.minimumLineSpacing = 20
        super.init(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout = layout
        delegate = self
        dataSource = self
        register(OneRowCollectionViewCell.self, forCellWithReuseIdentifier: OneRowCollectionViewCell.reuseId)
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        showsHorizontalScrollIndicator = false
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
        numberOfItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: OneRowCollectionViewCell.reuseId, for: indexPath) as! OneRowCollectionViewCell
        cell.setupView(data: cells[indexPath.item % cells.count])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? OneRowCollectionViewCell {
            cells[indexPath.item % cells.count].isButtonPressed.toggle()
            cell.changeColor(isButtonPressed: cells[indexPath.item % cells.count].isButtonPressed)
            if cells[indexPath.item % cells.count].isButtonPressed == true {
                collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                print(cell.frame.width)
            } else {
                print("We don't need to move unselected course to left side")
            }
        }
    }
}
