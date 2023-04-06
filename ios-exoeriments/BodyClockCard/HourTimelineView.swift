import UIKit

class HourTimelineView: UIView {
    
    let hourLabelHeight: CGFloat = 20
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Calculate the width of each hour label based on the view's bounds
        let hourLabelSpacing = rect.width / 11
        
        // Draw each hour label for the hours from 10pm to 9am
        for hour in 22...24 {
            let hourLabelRect = CGRect(x: hourLabelSpacing * CGFloat(hour - 22), y: rect.height - hourLabelHeight, width: hourLabelSpacing, height: hourLabelHeight)
            let hourLabel = UILabel(frame: hourLabelRect)
            hourLabel.text = "\(hour % 12)"
            hourLabel.textAlignment = .center
            self.addSubview(hourLabel)
        }
        for hour in 1...9 {
            let hourLabelRect = CGRect(x: hourLabelSpacing * CGFloat(hour + 2), y: rect.height - hourLabelHeight, width: hourLabelSpacing, height: hourLabelHeight)
            let hourLabel = UILabel(frame: hourLabelRect)
            hourLabel.text = "\(hour)"
            hourLabel.textAlignment = .center
            self.addSubview(hourLabel)
        }
    }
}
