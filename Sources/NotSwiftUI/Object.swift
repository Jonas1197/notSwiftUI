//
//  Object.swift
//  
//
//  Created by Jonas Gamburg on 19/12/2021.
//

import UIKit

public enum FixState {
    case filled
    case centered
    case notFixed
}

public enum Object {
    
    //MARK: - UIKit
    case view(backgroundColor: UIColor = .black)
    case label(text: String, backgroundColor: UIColor, textColor: UIColor)
    case button(text: String = "", backgroundColor: UIColor, tintColor: UIColor)
    case buttonWithImage(image: UIImage?, text: String = "", backgroundColor: UIColor, tintColor: UIColor)
    case buttonWithSymbol(title: String = "", symbolName: String, pointSize: CGFloat, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale, tintColor: UIColor = .white, backgroundColor: UIColor = .clear)
    case switchElement(target: Any, action: Selector)
    case hstack(arrangedSubviews: [UIView], spacing: CGFloat, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution)
    case vstack(arrangedSubviews: [UIView], spacing: CGFloat, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution)
    case imageViewWithImage(image: UIImage, contentMode: UIImageView.ContentMode, backgroundColor: UIColor = .clear)
    case imageViewWithSFSymbol(symbolName: String, pointSize: CGFloat, contentMode: UIImageView.ContentMode, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale, tintColor: UIColor)
    
    //MARK: - Shape
    case square(color: UIColor = .black, width: Double, height: Double)
    case circle(color: UIColor = .black, size: Double)
    
    public func create() -> UIView {
        switch self {
            
            
        //MARK: - UIKit
        case .view(let backgroundColor):
            let view = UIView()
            view.backgroundColor = backgroundColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
            
        case .label(let text, let backgroundColor, let textColor):
            let label             = UILabel()
            label.text            = text
            label.backgroundColor = backgroundColor
            label.textColor       = textColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
            
        case .button(let text, let backgroundColor, let tintColor):
            let button             = UIButton()
            button.backgroundColor = backgroundColor
            button.tintColor       = tintColor
            button.setTitle(text, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
        case .buttonWithImage(let image, let text, let backgroundColor, let tintColor):
            let button             = UIButton()
            button.backgroundColor = backgroundColor
            button.tintColor       = tintColor
            button.setTitle(text, for: .normal)
            button.setImage(image, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
        case .buttonWithSymbol(let title, let symbolName, let pointSize, let weight, let scale, let tintColor, let backgroundColor):
            let button             = UIButton()
            let configuration      = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image              = UIImage(systemName: symbolName, withConfiguration: configuration)
            button.tintColor       = tintColor
            button.backgroundColor = backgroundColor
            button.setImage(image, for: .normal)
            button.setTitle(title, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
        case .switchElement(let target, let action):
            let switchElement = UISwitch()
            switchElement.addTarget(target, action: action, for: .valueChanged)
            switchElement.translatesAutoresizingMaskIntoConstraints = false
            return switchElement
            
        case .hstack(let arrangedSubviews, let spacing, let alignment, let distribution):
            let stackView = UIStackView()
            for subview in arrangedSubviews {
                stackView.addArrangedSubview(subview)
            }
            
            stackView.distribution = distribution
            stackView.alignment    = alignment
            stackView.axis         = .horizontal
            stackView.spacing      = spacing
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
            
        case .vstack(let arrangedSubviews, let spacing, let alignment, let distribution):
            let stackView = UIStackView()
            for subview in arrangedSubviews {
                stackView.addArrangedSubview(subview)
            }
            
            stackView.distribution = distribution
            stackView.alignment    = alignment
            stackView.axis         = .vertical
            stackView.spacing      = spacing
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
            
        //MARK: - Shape
        case .square(let color, let width, let height):
            let view = UIView()
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: width),
                view.heightAnchor.constraint(equalToConstant: height)
            ])
            
            view.backgroundColor = color
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
            
        case .circle(let color, let size):
            let view = UIView()
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: size),
                view.heightAnchor.constraint(equalToConstant: size)
            ])
            
            view.backgroundColor = color
            view.translatesAutoresizingMaskIntoConstraints = false
            return view.rounded(size / 2)
            
        case .imageViewWithImage(let image, let contentMode, let backgroundColor):
            let imageView             = UIImageView(image: image)
            imageView.contentMode     = contentMode
            imageView.backgroundColor = backgroundColor
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
            
        case .imageViewWithSFSymbol(let symbolName, let pointSize, let contentMode, let weight, let scale, let tintColor):
            let imageView         = UIImageView()
            let configuration     = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
            let image             = UIImage(systemName: symbolName, withConfiguration: configuration)
            imageView.image       = image
            imageView.tintColor   = tintColor
            imageView.contentMode = contentMode
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
    }
}
