// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Counters} from "@openzeppelin/contracts/utils/Counters.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract MyNFT is ERC721, Ownable, ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    event NFTMinted(address indexed owner, uint256 indexed tokenId);

    constructor(address initialOwner)
        ERC721("MyNFT", "MNFT")
        Ownable(initialOwner)
    {} 

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);

        emit NFTMinted(to, tokenId);
    }

     function burn(uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: caller is not owner nor approved");
        _burn(tokenId);
     }

     function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
     }

     function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
     }
}