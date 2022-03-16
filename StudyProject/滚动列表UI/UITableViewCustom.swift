//
//  UITableViewCustom.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/5.
//

import Foundation
import UIKit
import SnapKit

class MyCustomTableView: UIView {
        
    private var myTableView: UITableView!
    
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
    
    private var deleteDataSource: [([String: String], CGFloat)] = []
    
    private var rowHeightArray: [CGFloat] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setRowHeightArray()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.showsVerticalScrollIndicator = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 164
        tableView.sectionHeaderTopPadding = 0
        tableView.contentInset.bottom = 34
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(kScreenHeight - 88)
        }
        self.myTableView = tableView
    }
    
    private func setRowHeightArray() {
        rowHeightArray.removeAll()
        for dict in dataSource {
            if let introl = dict["introl"], introl.count > 0 {
                let paraStyle = NSMutableParagraphStyle()
                paraStyle.lineSpacing = 4
                var height = NSString(string: introl).boundingRect(with: CGSize(width: kScreenWidth - 64, height: CGFloat(MAXFLOAT)), options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [.paragraphStyle: paraStyle, .font: UIFont.systemFont(ofSize: 14)], context: nil).size.height
                height = CGFloat(ceil(Double(height)))
                height += (16 + 44 + 24 + 16 + 16)
                rowHeightArray.append(height)
            }
        }
        self.myTableView.reloadData()
    }
    
    public func edit(result: Bool) {
        myTableView.setEditing(result, animated: true)
    }
}

extension MyCustomTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as? MyCustomCell
        cell?.dataDict = dataSource[indexPath.row]
        return cell ?? MyCustomCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeightArray[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let text = dataSource[indexPath.row]["name"] ?? ""
        print("点击了: \(text)")
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataSource.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        rowHeightArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableView.reloadData()
        edit(result: false)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "删除") { [weak self] action, cell, completion in
            let deleteSource = (self!.dataSource[indexPath.row], self!.rowHeightArray[indexPath.row])
            self?.deleteDataSource.append(deleteSource)
            self?.dataSource.remove(at: indexPath.row)
            self?.rowHeightArray.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
        }
        let insertAction = UIContextualAction(style: .normal, title: "插入") { [weak self] action, cell, completion in
            if self?.deleteDataSource.count == 0 {
                return
            }
            let source = self!.deleteDataSource.first!
            self?.dataSource.insert(source.0, at: indexPath.row)
            self?.rowHeightArray.insert(source.1, at: indexPath.row)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            tableView.setEditing(false, animated: true)
            self?.deleteDataSource.removeFirst()
        }
        let configuraton = UISwipeActionsConfiguration.init(actions: [deleteAction, insertAction])
        return configuraton
    }
}


class MyCustomCell: UITableViewCell {
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 1
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var introlLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalToSuperview()
            make.bottom.equalTo(-16)
        }
        
        bgView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(16)
            make.width.height.equalTo(44)
        }
        
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(12)
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(0)
        }
        
        bgView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(12)
            make.height.equalTo(1)
        }
        
        bgView.addSubview(introlLabel)
        introlLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(lineView.snp.bottom).offset(12)
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
