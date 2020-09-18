import UIKit

@IBDesignable

class View: UIView {

    //*************************************************
    // MARK: - Style | Appearance
    //*************************************************

    struct Appearance {
        let borderWidth: CGFloat
        let borderColor: UIColor
        let hasShadow: Bool

        init(
            borderWidth: CGFloat = 0,
            borderColor: UIColor = UIColor.clear,
            hasShadow: Bool = true) {
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.hasShadow = hasShadow
        }
    }

    enum Style {
        case card
        case custom(appearance: Appearance)
    }

    var style: Style = .card {
        didSet {
            self.applyStyle()
        }
    }

    private func applyStyle() {

        func applyShadow() {
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowOpacity = 0.3
        }

        var appearance: Appearance

        switch style {
        case .card:
            appearance = Appearance()
        case .custom(let customAppearance):
            appearance = customAppearance
        }

        // Border
        self.layer.borderWidth = appearance.borderWidth
        self.layer.borderColor = appearance.borderColor.cgColor

        // Border Corner
        self.layer.cornerRadius = 11

        // shadow
        if appearance.hasShadow {
            applyShadow()
        }
    }

	//*************************************************
	// MARK: - @IBInspectables
	//*************************************************

	@IBInspectable
	var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}

	@IBInspectable
	var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable
	var borderColor: UIColor? {
		get {
			guard let color = layer.borderColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
			layer.borderColor = newValue?.cgColor
		}
	}
}
