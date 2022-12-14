// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NFTMint.sol";

contract MintTest is Test {
    NFTMint erc721;
    address bob = address(0x1);
    address mary = address(0x2);

    function testMintToken() public {
        erc721 = new NFTMint("KILLER", "KILLER");
        erc721.mint(bob, 0);
        address owner_of = erc721.ownerOf(0);
        assertEq(bob, owner_of);
        assertEq(erc721.name(), "KILLER");
    }

    function testTransferToken() public {
        erc721 = new NFTMint("KILLER", "KILLER");
        erc721.mint(bob, 0);

        vm.startPrank(bob);
        erc721.safeTransferFrom(bob, mary, 0);

        address owner_of = erc721.ownerOf(0);
        assertEq(mary, owner_of);
    }

    function testGetBalance() public {
        erc721 = new NFTMint("KILLER", "KILLER");
        erc721.mint(bob, 0);
        erc721.mint(bob, 1);
        erc721.mint(bob, 2);
        erc721.mint(bob, 3);

        uint balance = erc721.balanceOf(bob);
        assertEq(balance, 4);
    }
}
