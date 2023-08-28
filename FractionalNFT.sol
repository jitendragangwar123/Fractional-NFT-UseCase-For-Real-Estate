// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract FractionalNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping (uint=>uint) public prices;
    constructor(
        string memory name,
        string memory symbol
        ) ERC721(name,symbol) {}
    

    //seller can create the NFT
    function createNFT(string memory tokenURI, uint _price) public returns(uint256){
        _tokenIds.increment();
        uint256 newNFTId = _tokenIds.current();
        _mint(msg.sender, newNFTId);
        _setTokenURI(newNFTId, tokenURI);
        prices[newNFTId]=_price;
        return newNFTId;
    }
}
