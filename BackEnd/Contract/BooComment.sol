pragma solidity 0.5.0.0

contract BooComment {
    struct Comment{
        //address client;
        //uint256 time;
        string title;
        string contians;
        enum Category {milktea,fastfood,clothes,sevenEleven,supermarket}
        Category public category;
        enum Province {SH,BJ,NYC}
        Province public province;
        enum Ditrict {YP,CY,MHT}
        Ditrict public ditrict;
        enum Street {SP,CSK,TS}
        Street public street;
    }

    mapping (address => mapping (uint256 => struct Comment)) private records;
    mapping (address => uint256[]) private categories;

    event Recorded(address _sender, 
        string indexed _title,string indexed _contains,int32 indexed _category,
        int32 indexed _province,int32 indexed _ditrict,int32 indexed _street,
        uint256 indexed _time);

    function _addToList(address from, uint256 time) private {
        categories[from].push(time);
    }

    function getList()
    public
    view
    returns (uint256[])
    {
        return categories[msg.sender];
    }

     function add(struct Comment texts, uint256 time) public {
        records[msg.sender][time]=texts;
        _addToList(msg.sender, time);
        emit Recorded(msg.sender, texts, time);
    }
    function get(uint256 time) public view returns(struct Comment) {
        
        return records[msg.sender][time];
    }

}