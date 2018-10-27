pragma solidity 0.5.0.0

contract BooComment {
    struct Comment{
        address client;
        uint256 time;
        string title;
        string contians;
        enum category{milktea,fastfood,clothes,sevenEleven,supermarket};
        struct location{
            enum province{SH,BJ,NYC};
            enum ditrict{YP,CY,MHT};
            enum street{SP,CSK,TS};
        };
    }

    

}