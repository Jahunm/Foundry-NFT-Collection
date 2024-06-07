// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user"); // dummy user address
    string public constant SHIB =
        "https://gold-cheap-llama-989.mypinata.cloud/ipfs/QmYx6GsYAKnNzZ9A6NvEKV9nf1VaDzJrqDR23Y8YSkebLU";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHavebalance() public {
        vm.prank(USER);
        basicNft.mintNft(SHIB);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(SHIB)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
