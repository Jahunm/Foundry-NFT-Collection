// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaWdodD0iNDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgZmlsbD0iaW5kaWdvIiByPSI3OCIgc3Ryb2tlPSJ5ZWxsb3ciIHN0cm9rZS13aWR0aD0iMyIvPgogIDxnIGNsYXNzPSJleWVzIj4KICAgIDxjaXJjbGUgY3g9IjYxIiBjeT0iODIiIHI9IjExIi8+CiAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTciLz4KICA8L2c+CiAgPHBhdGggZD0ibTEzNi44MSAxMTYuNTNjLjY5IDI2LjE3LTY0LjExIDQyLTgxLjUyLS43MyIgc3R5bGU9ImZpbGw6eWVsbG93OyBzdHJva2U6IHllbGxvdzsgc3Ryb2tlLXdpZHRoOiAzOyIvPgo8L3N2Zz4=";
        string
            memory svg = '<svg viewBox="0 0 200 200" width="400"  height="400" xmlns="http://www.w3.org/2000/svg"><circle cx="100" cy="100" fill="indigo" r="78" stroke="yellow" stroke-width="3"/><g class="eyes"><circle cx="61" cy="82" r="11"/><circle cx="127" cy="82" r="17"/></g><path d="m136.81 116.53c.69 26.17-64.11 42-81.52-.73" style="fill:yellow; stroke: yellow; stroke-width: 3;"/></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
