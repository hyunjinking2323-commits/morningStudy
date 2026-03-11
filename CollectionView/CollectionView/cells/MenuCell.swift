//
//  MenuCell.swift
//  CollectionView
//
//  Created by t2025-m0239 on 2026.02.27.
//
//MenuCell
//전체 배경: backgroundColor = .systemGray6, cornerRadius = 12
//
//menuImageView
//width = 50pt, height = 50pt
//nameLabel
//font = .systemFont(ofSize: 16, weight: .semibold)
//priceLabel
//font = .systemFont(ofSize: 14, weight: .regular)
//textColor = .systemGray
//
//UIStackView (Vertical):
//spacing = 6
//alignment = .center
//distribution = .fill
//Constraints: 셀의 centerX, centerY에 고정.
import UIKit
import SnapKit

class MenuCell: UICollectionViewCell {


    private let menuImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()


    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [menuImageView, nameLabel, priceLabel])
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 6
        sv.distribution = .fill
        return sv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func configureUI() {
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 12


        menuImageView.contentMode = .scaleAspectFit
        menuImageView.tintColor = .systemBlue

        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        priceLabel.font = .systemFont(ofSize: 14, weight: .regular)
        priceLabel.textColor = .systemGray

        contentView.addSubview(stackView)
    }

    private func setConstraints() {

        menuImageView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }


        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func configure(data: Menu) {
        menuImageView.image = UIImage(systemName: data.imageName)
        nameLabel.text = "\(data.name)"
        priceLabel.text = "\(data.price)원"
    }
}
