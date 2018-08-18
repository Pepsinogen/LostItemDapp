pragma solidity ^0.4.23;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract LostItemToken is ERC721Token, Ownable {
    constructor() ERC721Token("LostItem", "LST") public {
    }

    struct LostItem {
        string name;
        string comment;
        address finder;
        uint256 timestamp;
    }

    LostItem[] public lostItems;

    function mint(string _name, string _comment, uint256 _timestamp) public payable {
        require(owner != address(0));
        LostItem memory _lostItem = LostItem({name:_name, comment: _comment, finder: msg.sender, timestamp: _timestamp});
        uint256 newTokenId = lostItems.push(_lostItem) - 1;
        _mint(msg.sender, newTokenId);
    }

    function getBack(uint256 _tokenId) public payable {
        lostItems[_tokenId].finder.transfer(msg.value);
        _burn(lostItems[_tokenId].finder, _tokenId);
    }

    function burn(uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        _burn(msg.sender, _tokenId);
    }

    modifier onlyOwnerOf(uint256 _tokenId) {
        require(ownerOf(_tokenId) == msg.sender);
        _;
    }

    function getLostItem(uint256 _tokenId) public view returns (string, string, address, uint256) {
        return  (lostItems[_tokenId].name, lostItems[_tokenId].comment, lostItems[_tokenId].finder, lostItems[_tokenId].timestamp);
    }

    function tokensOf(address _owner) external view returns (uint256[]) {
        return ownedTokens[_owner];
    }

    function getAllTokens() external view returns (uint256[]) {
        return allTokens;
    }
}