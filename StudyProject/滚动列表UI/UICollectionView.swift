//
//  UICollectionView.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit
import SnapKit

class MyCollectionView: UIView {
    
    private var myCollectionView: UICollectionView!
    private var dataSource: [[String: String]] = [
        [
            "name": "乔布斯",
            "avatar": "qiaobusi",
            "introl": "史蒂夫·乔布斯（Steve Jobs，1955年2月24日—2011年10月5日），出生于美国加利福尼亚州旧金山，美国发明家、企业家、苹果公司联合创始人。"
        ],
        [
            "name": "库克",
            "avatar": "kuke",
            "introl": "蒂姆·库克，1960年11月1日出生于美国阿拉巴马州，现任苹果公司首席执行官，清华大学经济管理学院顾问委员会主席。"
        ],
        [
            "name": "任正非",
            "avatar": "renzhengfei",
            "introl": "任正非，男，汉族，1944年10月25日出生于贵州省安顺市镇宁县，祖籍浙江省金华市浦江县，毕业于重庆大学，中国共产党党员，华为技术有限公司主要创始人兼总裁。现任华为技术有限公司董事、CEO。"
        ],
        [
            "name": "马斯克",
            "avatar": "masike",
            "introl": "埃隆·马斯克（Elon Musk），1971年6月28日出生于南非的行政首都比勒陀利亚（现名：茨瓦内），企业家、工程师、慈善家。他同时具有南非、加拿大和美国三重国籍。任太空探索技术公司（SpaceX）CEO兼CTO、特斯拉（TESLA）公司CEO、太阳城公司（SolarCity）董事会主席。"
        ],
        [
            "name": "马云",
            "avatar": "mayun",
            "introl": "马云，男，汉族，中共党员，1964年9月10日生于浙江省杭州市，祖籍浙江省嵊州市谷来镇，阿里巴巴集团主要创始人，现担任日本软银董事、大自然保护协会中国理事会主席兼全球董事会成员、华谊兄弟董事、生命科学突破奖基金会董事、联合国数字合作高级别小组联合主席。"
        ],
        [
            "name": "马化腾",
            "avatar": "mahuateng",
            "introl": "马化腾，汉族，1971年10月29日生于广东省东方县八所港（今属海南省东方市），祖籍广东省汕头市潮南区。1993年获深圳大学理学学士学位。腾讯公司主要创办人之一。现任腾讯公司董事会主席兼首席执行官；全国青联副主席；全国人大代表。"
        ],
        [
            "name": "李彦宏",
            "avatar": "liyanhong",
            "introl": "李彦宏（Robin Li），男，汉族，无党派人士，1968年11月出生，山西阳泉人。百度创始人、董事长兼首席执行官（CEO）。"
        ],
        [
            "name": "雷军",
            "avatar": "leijun",
            "introl": "雷军，男，汉族，1969年12月16日出生于湖北省仙桃市，无党派，大学学历，理学学士学位，高级工程师。中国大陆著名天使投资人。"
        ],
        [
            "name": "张朝阳",
            "avatar": "zhangchaoyang",
            "introl": "张朝阳，男，汉族，1964年10月31日生，陕西省西安市人，籍贯西安，祖籍河南孟津，搜狐公司董事局主席兼首席执行官。1986年毕业于清华大学物理系，并于同年考取李政道奖学金赴美留学。1993年在麻省理工学院获得博士学位后，在麻省理工学院继续博士后研究。1994年，任MIT亚太地区(中国)联络负责人。1995年底，回国任美国ISI公司驻中国首席代表。"
        ],
        [
            "name": "丁磊",
            "avatar": "dinglei",
            "introl": "丁磊，男，1971年10月1日生于浙江省宁波市。网易公司创始人，现担任网易公司董事局主席兼首席执行官。"
        ],
        [
            "name": "周鸿祎",
            "avatar": "zhouhongyi",
            "introl": "周鸿祎（zhōu hóng yī），1970年10月4日生于河南，祖籍湖北。360公司创始人、董事长兼CEO，第十三届全国政协委员，九三学社中央委员，全国工商联大数据运维（网络安全）委员会轮值主席，大数据协同安全技术国家工程实验室理事长、中国网络空间安全协会副理事长，ISC互联网安全大会主席。"
        ]
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.frame.size.height = kScreenHeight - 88
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 34, right: 16)
        collectionView.register(MyCollectionCell.self, forCellWithReuseIdentifier: "MyCollectionCell")
        self.addSubview(collectionView)
        myCollectionView = collectionView
    }
}

extension MyCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as? MyCollectionCell
        cell?.dataDict = dataSource[indexPath.item]
        return cell ?? MyCollectionCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (kScreenWidth - 16 * 3) / 2
        let height = width + 8 + 20 + 12 + 40 + 16
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


class MyCollectionCell: UICollectionViewCell {
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var introlLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 12
        contentView.layer.shadowOpacity = 1
        
        let width = (kScreenWidth - 16 * 3) / 2
        self.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(width)
        }
        
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(avatarImageView.snp.bottom).offset(8)
            make.height.equalTo(20)
        }
        
        bgView.addSubview(introlLabel)
        introlLabel.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.bottom.equalTo(-16)
        }
    }
    
    var dataDict: [String: String]? {
        didSet {
            if let dataDict = dataDict {
                avatarImageView.image = UIImage(named: dataDict["avatar"] ?? "")
                nameLabel.text = dataDict["name"] ?? ""
                let introl = dataDict["introl"] ?? ""
                let paraStyle = NSMutableParagraphStyle()
                paraStyle.lineSpacing = 4
                introlLabel.attributedText = NSAttributedString(string: introl, attributes: [.paragraphStyle: paraStyle])
                introlLabel.lineBreakMode = .byTruncatingTail
            }
        }
    }
}

