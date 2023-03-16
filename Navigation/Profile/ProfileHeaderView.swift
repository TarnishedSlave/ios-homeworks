
import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""
    let rect = CGRect(x: 20, y: 80, width: 150, height: 150)

    override init(frame: CGRect) {
        super.init(frame: frame)

        let imageView = UIImageView(frame: rect)
        imageView.image = UIImage(named: "boygirl")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true

        addSubview(imageView)

        let label1 = UILabel(frame: CGRect(x: rect.maxX + 30, y: rect.midY - 65, width: 100, height: 20))
        label1.text = "Максим"
        label1.font = UIFont.boldSystemFont(ofSize: 25)

        addSubview(label1)

        let label2 = UILabel(frame: CGRect(x: rect.maxX + 30, y: rect.midY + 35, width: 200, height: 20))
        label2.text = "Изучаю Swift"
        label2.textColor = .systemGray

        addSubview(label2)

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 360, y: rect.maxY + 40, width: bounds.width - 350, height: 50)
        button.setTitle("Покажи статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        addSubview(button)

        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "write"
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 230),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -410)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {
        print("Button pressed")
            let label2 = subviews.compactMap({ $0 as? UILabel }).first(where: { $0.text == "Изучаю Swift" })
            if let textField = subviews.compactMap({ $0 as? UITextField }).first(where: { $0.placeholder == "write" }) {
                label2?.text = statusText
                textField.text = ""
                textField.placeholder = "write"
        }
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
        print("Текст изменен: \(statusText)")
    }
}
