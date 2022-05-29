import Foundation
import UIKit

extension UICollectionView {

    final func registerCell<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: NSStringFromClass(cell))
    }

    final func registerSectionHeader<T: UICollectionReusableView>(_ header: T.Type) {
        register(
            header,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NSStringFromClass(header)
        )
    }

    final func registerSectionFooter<T: UICollectionReusableView>(_ footer: T.Type) {
        register(
            footer,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: NSStringFromClass(footer)
        )
    }

    final func registerSupplementaryView<T: UICollectionReusableView>(
        _ view: T.Type,
        kind: NSCollectionLayoutBoundarySupplementaryItem.ElementKind
    ) {
        register(
            view,
            forSupplementaryViewOfKind: kind.value,
            withReuseIdentifier: NSStringFromClass(view)
        )
    }

    final func dequeueCell<T: UICollectionViewCell>(_ cell: T.Type, forIndexPath indexPath: IndexPath!) -> T {
        dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cell), for: indexPath) as! T
    }

    final func dequeueSectionHeader<T: UICollectionReusableView>(
        _ header: T.Type,
        forIndexPath indexPath: IndexPath!
    ) -> T {
        dequeueSupplementaryView(
            type: header,
            elementKind: UICollectionView.elementKindSectionHeader,
            indexPath: indexPath
        )
    }

    final func dequeueSectionFooter<T: UICollectionReusableView>(
        _ footer: T.Type,
        forIndexPath indexPath: IndexPath!
    ) -> T {
        dequeueSupplementaryView(
            type: footer,
            elementKind: UICollectionView.elementKindSectionFooter,
            indexPath: indexPath
        )
    }

    final func dequeueSupplementaryView<T: UICollectionReusableView>(
        _ view: T.Type,
        kind: NSCollectionLayoutBoundarySupplementaryItem.ElementKind,
        indexPath: IndexPath
    ) -> T {
        dequeueSupplementaryView(
            type: view,
            elementKind: kind.value,
            indexPath: indexPath
        )
    }

    internal func dequeueSupplementaryView<T: UICollectionReusableView>(
        type: T.Type,
        elementKind: String,
        indexPath: IndexPath
    ) -> T {
        dequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: NSStringFromClass(type),
            for: indexPath
        ) as! T
    }
}

extension NSCollectionLayoutBoundarySupplementaryItem {

    enum ElementKind {
        case badge
        case background
        case sectionHeader
        case sectionFooter
        case layoutHeader
        case layoutFooter
        case custom(String)

        var value: String {
            switch self {
            case .custom(let value):
                return value
            default:
                return "\(self)"
            }
        }
    }

    static func create(
        layoutSize: NSCollectionLayoutSize,
        elementKind: ElementKind,
        alignment: NSRectAlignment
    ) -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSize,
            elementKind: elementKind.value,
            alignment: alignment
        )
    }

    static func create(
        layoutSize: NSCollectionLayoutSize,
        elementKind: ElementKind,
        alignment: NSRectAlignment,
        absoluteOffset: CGPoint
    ) -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSize,
            elementKind: elementKind.value,
            alignment: alignment,
            absoluteOffset: absoluteOffset
        )
    }
}
