// SPDX-License-Identifier: NONE

pragma solidity ^0.8.10;

import "./OpenzeppelinERC721.sol";

contract MetaRamen is ERC721Enumerable {
    address public owner;
    string ipfsURI = "ipfs://QmUFmzqAisPJPtE3YNYmCZR9ccEhESMQaNt6Y3ZcFbqBhg";

    mapping(address => uint) public addressMintedMap;

    address myWallet = 0xD4B45FD5B4Ee16364A4f2DcA3837c5F1FCcacfaa;
    
    constructor() ERC721("MetaRamen" , "MR" ) {
        owner = msg.sender; 
        _safeMint(msg.sender , 0);
    }

     function _baseURI()internal view override returns(string memory){
        return ipfsURI;
    }

    function setBaseURI(string memory _ipfsURI) public {
        require(_msgSender() == owner);
        ipfsURI = _ipfsURI;
    }

    function withdraw() public {
        require(_msgSender() == owner);
        uint balance = address(this).balance;
        payable(myWallet).transfer(balance);
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        return ipfsURI;
    }
}