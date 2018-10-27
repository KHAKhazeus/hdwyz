pragma solidity ^0.4.25.0;
//pragma experimental ABIEncoderV2;

contract BooComment {
    struct Comment {
        address client;
        uint256 time;
        string title;
        string contents;
        string category;
        Shop shop;
    }
    
    struct Shop {
        string province;
        string district;
        string street;
    }

    mapping (address => mapping (uint256 => Comment)) private records;
    mapping (address => uint256[]) private usercontents;

    event Recorded(address indexed _sender, string _title, string _contents, string indexed _category, 
        string _province, string district, string _street, uint256 indexed _time);

    function _addAUserContentRecord(address from, uint256 time) private {
        usercontents[from].push(time);
    }

    function _unpackAComment(Comment com) private pure
    returns(string title, string contents, string category, string province, string district, string street, uint256 time) {
        title = com.title;
        contents = com.contents;
        category = com.category;
        province = com.shop.province;
        district = com.shop.district;
        street = com.shop.street;
        time = com.time;
    }

    function getUserContentsForThisUser() public view returns (uint256[]) {
        return usercontents[msg.sender];
    }

    function addACommentFromMe(string title, string contents, string category, string province, string district, string street, uint256 time) public {
        Comment storage com = records[msg.sender][time];
        // Comment memory tmp = Comment({
        //     client: msg.sender,
        //     time: time,
        //     title: title,
        //     contents: contents,
        //     category: category,
        //     shop: Shop({
        //         province: province,
        //         district: district,
        //         street: street
        //     })
        // });
        com.client = msg.sender;
        com.time = time;
        com.title = title;
        com.contents = contents;
        com.category = category;
        com.shop.province = province;
        com.shop.district = district;
        com.shop.street = street;
        
        //com = tmp;
        _addAUserContentRecord(msg.sender, time);
        emit Recorded(msg.sender, title, contents, category, province, district, street, time);
    }
    
    function getACommentOfMine(uint256 time) public view returns(string title, string contents, string category, string province, string district, string street) {
        Comment storage com = records[msg.sender][time];
        title = com.title;
        contents = com.contents;
        category = com.category;
        province = com.shop.province;
        district = com.shop.district;
        street = com.shop.street;
    }

}