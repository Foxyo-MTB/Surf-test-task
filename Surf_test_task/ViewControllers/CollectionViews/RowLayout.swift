//
//  RowLayout.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//





// Ни разу не делал до этого подобные карусели, времени было мало, решил подогнать по размерам.

import  UIKit

protocol RowLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, cellAtIndexPath indexPath: IndexPath) -> CGSize
}


class RowLayout: UICollectionViewLayout {
    
    weak var delegate: RowLayoutDelegate!
    
    static var numbersOfRows = 2
    fileprivate var cellPadding: CGFloat = 12
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat = 0
    
    // константа
    fileprivate var contentHeight: CGFloat {
        
        guard let collectionView = collectionView else { return 0 }
        
        let insets =  collectionView.contentInset
        return collectionView.bounds.height - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        contentWidth = 0
        cache = []
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        
        var cells = [CGSize]()
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let cellSize = delegate.collectionView(collectionView, cellAtIndexPath: indexPath)
            cells.append(cellSize)
        }
        
        let rowHeight = 44.0+24.0 //подгонка тут
        
        var yOffset = [CGFloat]()
        for row in 0 ..< RowLayout.numbersOfRows {
            yOffset.append(CGFloat(row) * rowHeight)
        }
        
        var xOffset = [CGFloat](repeating: 0, count: RowLayout.numbersOfRows)
        
        var row = 0
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let width = cells[indexPath.row].width+24 //подгонка тут
            let frame = CGRect(x: xOffset[row], y: yOffset[row], width: width, height: rowHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attribute.frame = insetFrame
            cache.append(attribute)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[row] = xOffset[row] + width
            row = row < (RowLayout.numbersOfRows - 1) ? (row + 1) : 0
        }
    }
        
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attatibute in cache {
            if attatibute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attatibute)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.row]
    }
}
