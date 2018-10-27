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

    function getUserCommentWithAddrAndTime(address user, uint256 time) private view
    returns (string title, string contents, string category, string province, string district, string street){
        Comment storage com = records[user][time];
        title = com.title;
        contents = com.contents;
        category = com.category;
        province = com.shop.province;
        district = com.shop.district;
        street = com.shop.street;
    }

    function addACommentFromMe(string title, string contents, string category, string province, string district, string street, uint256 time) public {
        records[msg.sender][time] = Comment({
            client: msg.sender,
            time: time,
            title: title,
            contents: contents,
            category: category,
            shop: Shop({
                province: province,
                district: district,
                street: street
            })
        });
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
    
    struct Follow {
        address follower;
        Comment comment;
        uint256 time;
        string contents;
    }
    
    mapping ( address => mapping ( uint256 => Follow ) ) private followRecord;
    mapping ( address => uint256[] ) private followListOfAUser;
    mapping ( address => mapping ( uint256 => Follow[] )) private followList;

    function getFollowsFromThisUser() public view returns(uint256[]) {
        return followListOfAUser[msg.sender];
    }

    function addAFollowFromMe(address userAddressOfTheComment, uint256 timeOfTheComment, uint256 time, string contents) public {
        followRecord[msg.sender][time] = Follow({
            follower: msg.sender,
            comment: records[userAddressOfTheComment][timeOfTheComment],
            time: time,
            contents: contents
        });
        followListOfAUser[msg.sender].push(time);
        followList[userAddressOfTheComment][timeOfTheComment].push(followRecord[msg.sender][time]);
    }

    function getAFollowOfMine() public view returns(uint256[]) {
        return followListOfAUser[msg.sender];
    }

    function getFollowListForAComment(address userAddressOfAComment, uint256 timeOfAComment) public returns (address[], uint256[]) {
        Follow[] storage flwList = followList[userAddressOfAComment][timeOfAComment];
        address[] storage adrList;
        uint256[] storage timeList;
        for (uint256 i = 0; i < flwList.length; ++i){
           adrList.push(flwList[i].follower);
           timeList.push(flwList[i].time);
        }
        return (adrList, timeList);
    }

    function getAFollowWithAddressAndTime(address addr, uint256 time) public view returns(string) {
        return followRecord[addr][time].contents;
    }
}