// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";

contract NFTMint is ERC721 {

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
    }

    function mint(address minter, uint256 tokenId) external returns (uint) {
        _mint(minter, tokenId);
        return tokenId;
    }
}
