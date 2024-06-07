// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter; // Declaring a state variable -- counter
    mapping(uint256 => string) private s_tokenIdToURI; // mapping for newly created tokens

    // Constructor per ERC721 standard from openzeppelin
    constructor() ERC721("Dogie", "DoG") {
        s_tokenCounter = 0;
    }

    // Function to mint a new NFT (string memory tokenURI) lets people customize the nft before minting
    function mintNft(string memory tokenURI) public {
        s_tokenIdToURI[s_tokenCounter] = tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToURI[_tokenId];
    }
}
