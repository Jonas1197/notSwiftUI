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

public enum FontType {
    case system
    case custom(String)
}

public enum Object {
    
    //MARK: - UIKit
    /**
     Declare a UIView with a background color and no specific size. Size can be later assigned to either using constraints or frames.
     - Parameter backgroundColor: The color of the declared UIView.
     */
    case view(backgroundColor: UIColor = .black)
    
    /**
     Delare a UILabel with text and text alignment and text color. Background color can be also left unspecified and will default to a clear color.
     - Parameter text: The text to be displayed on the label.
     - Parameter textAlignment: The alignment of the displayed text.
     - Parameter textColor: The color of the text.
    */
    case label(text: String,
               textAlignment: NSTextAlignment,
               backgroundColor: UIColor = .clear,
               textColor: UIColor)
    
    /**
     Declare a UIButton with a title, background color and tint color.
     - Parameter text: The text to be displayed on the button's label.
     - Parameter backgroundColor: The background color of the button.
     - Parameter tintColor: The tint color of the button.
    */
    case button(text: String = "",
                backgroundColor: UIColor,
                tintColor: UIColor)
    
    /**
     Declare a UIButton with an image, background color and tint color. The text is by default empty as the image would cover it.
     - Parameter image: The image to be dispalyed for the button.
     - Parameter text: The text to be displayed on the button's label.
     - Parameter backgroundColor: The background color of the button.
     - Parameter tintColor: The tint color of the button.
     */
    case buttonWithImage(image: UIImage?,
                         text: String = "",
                         backgroundColor: UIColor,
                         tintColor: UIColor)
    
    /**
     Declare a button with an SFSymbol's name, a point size, weight and scale. The title of the button would by default be empty. Tint color as well as background color are by defauly white and clear respectively.
     - Parameter title: The text to be displayed on the button's label.
     - Parameter symbolName: The name of the SFSymbol to be displayed on the button.
     - Parameter pointSize: The size of the presented SFSymbol.
     - Parameter weight: The weight of the SFSymbol's font.
     - Parameter tintColor: The tint color of the displayed SFSymbol. This is set to white if not specified otherwise.
     - Parameter backgroundColor: The background color of the UIButton. This is set to clear if not specified otherwise.
     */
    case buttonWithSymbol(title: String = "",
                          symbolName: String,
                          pointSize: CGFloat,
                          weight: UIImage.SymbolWeight,
                          scale: UIImage.SymbolScale,
                          tintColor: UIColor = .white,
                          backgroundColor: UIColor = .clear)
    
    /**
     Delcare a UISwitch with a title, target and a selector.
     - Parameter title: The title to be displayed for the UISwitch.
     - Parameter target: The target of the UISwitch.
     - Parameter action: The action to be fired once the UISwitch's value has changed.
     */
    case switchElement(title: String,
                       target: Any,
                       action: Selector)
    
    /**
     Delcare a UIStackView with a horizontal axis from an array of UIViews, with spacing between each view, alignment and distribution.
     - Parameter arrangedSubviews: An array of UIViews to be stacked.
     - Parameter spacing: The spacing between the views.
     - Parameter alignment: The alignment of the stacked views.
     - Parameter distribution: Teh distribution of the stacked views.
     */
    case hstack(arrangedSubviews: [UIView],
                spacing: CGFloat,
                alignment: UIStackView.Alignment,
                distribution: UIStackView.Distribution)
    
    /**
     Delcare a UIStackView with a vertical axis from an array of UIViews, with spacing between each view, alignment and distribution.
     - Parameter arrangedSubviews: An array of UIViews to be stacked.
     - Parameter spacing: The spacing between the views.
     - Parameter alignment: The alignment of the stacked views.
     - Parameter distribution: Teh distribution of the stacked views.
     */
    case vstack(arrangedSubviews: [UIView],
                spacing: CGFloat,
                alignment: UIStackView.Alignment,
                distribution: UIStackView.Distribution)
    
    /**
     Declare a UIImageView with an image and content mode. Background color will be by default clear if not specified otherwise.
     - Parameter image: The UIImage to be displayed in the created UIImageView.
     - Parameter cotentMode: The content mode of the displayed image within the UIImageView.
     - Parameter backgroundColor: The background color of the UIImageView. If not specifically specified this will be set to clear.
     */
    case imageViewWithImage(image: UIImage?,
                            contentMode: UIImageView.ContentMode,
                            backgroundColor: UIColor = .clear)
    
    
    /**
     Declare a UIImageView with an SFSymbol's name, its pointSize, content mode, symbol weight, symbol scale and tint color.
     - Parameter symbolName: The name associated with an SFSymbol to be displayed.
     - Parameter pointSize: The size of the displayed SFSymbol.
     - Parameter contentMode: The content mode of the declared UIImageView.
     - Parameter weight: The symbol weight of the displayed SFSymbol.
     - Parameter scale: The symbol scale of the displayed SFSymbol.
     - Parameter tintColor: The tint color of the displayed SFSymbol.
     */
    case imageViewWithSFSymbol(symbolName: String,
                               pointSize: CGFloat,
                               contentMode: UIImageView.ContentMode,
                               weight: UIImage.SymbolWeight,
                               scale: UIImage.SymbolScale,
                               tintColor: UIColor)
    
    //MARK: - Shape
    
    /**
     Declare a UIView with a specific width and height to create a colored rectangle.
     - Parameter color: The color of the declared rectangle.
     - Parameter width: The width of the declared rectangle.
     - Parameter height: The height of the declared rectangle.
     */
    case rectangle(color: UIColor = .black,
                width: Double,
                height: Double)
    
    /**
     Declare a UIView with a specific color and diameter, which will be rendered as a circle.
     - Parameter color: The color the declared circle.
     - Parameter size: The diameter of the declared circle.
     */
    case circle(color: UIColor = .black,
                size: Double)
    
    /**
     The create method required to be invoked after choosing an object to declare. This method will create the elemnt of the specified object and will return it as a UIView.
     */
    public func create() -> UIView {
        switch self {
            
            
        //MARK: - UIKit
        case .view(let backgroundColor):
            let view = UIView()
            view.backgroundColor = backgroundColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
            
            
        //MARK: - UILabel
        case .label(let text, let textAlignment, let backgroundColor, let textColor):
            let label             = UILabel()
            label.text            = text
            label.backgroundColor = backgroundColor
            label.textColor       = textColor
            label.textAlignment   = textAlignment
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
            
        //MARK: - UIButton
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
            
        case .switchElement(let title, let target, let action):
            let switchElement = UISwitch()
            switchElement.addTarget(target, action: action, for: .valueChanged)
            switchElement.translatesAutoresizingMaskIntoConstraints = false
            switchElement.title = title
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
        case .rectangle(let color, let width, let height):
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
