import Foundation
import SwiftUI

enum ShowcaseFeature: CaseIterable {
    case colorPicker, settingsList, swiftUIPlusUIKit, stickyHeader, tinderSwipe
    
    var title: String {
        switch self {
        case .colorPicker:
            return "Color picker"
        case .settingsList:
            return "Settings list"
        case .swiftUIPlusUIKit:
            return "SwiftUI UIKit Interoperability"
        case .stickyHeader:
            return "Sticky header"
        case .tinderSwipe:
            return "Tinder swipe"
        }
    }
    
    var controller: UIViewController {
        switch self {
        case .colorPicker:
            return ProfileEditViewController()
        case .settingsList:
            return UIHostingController(rootView: SmartListPrototype())
        case .swiftUIPlusUIKit:
            return TestVC()
        case .stickyHeader:
            return StickyHeaderVC()
        case .tinderSwipe:
            return TinderVC()
        }
    }
}
