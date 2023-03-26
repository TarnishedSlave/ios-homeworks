import UIKit

class ProfileHeaderView: UIView {


    private let rect = CGRect(x: 16, y: 80, width: 150, height: 150)
    private var statusText: String = ""
    

    override init(frame: CGRect) {
        super.init(frame: frame)

        let imageView = UIImageView(frame: rect)
        imageView.image = UIImage(named: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor

        let label1 = UILabel(frame: CGRect(x: rect.maxX + 30, y: rect.midY - 65, width: 100, height: 20))
        label1.text = "Максим"
        label1.font = UIFont.boldSystemFont(ofSize: 25)

        let label2 = UILabel(frame: CGRect(x: rect.maxX + 30, y: rect.midY + 34, width: 200, height: 20))
        label2.text = "Изучаю Swift"
        label2.textColor = .systemGray

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 16, y: rect.maxY + 16, width: rect.maxY + 110, height: 50)
        button.setTitle("Покажи статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        addSubview(imageView)
        addSubview(label1)
        addSubview(label2)
        addSubview(button)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonPressed() {
        print("Button pressed")

        if let label2 = subviews.compactMap({ $0 as? UILabel }).first(where: { $0.text == "Изучаю Swift" }) {
            label2.text = statusText
        }
    }

    func setStatusText(_ text: String) {
        statusText = text
    }
}
