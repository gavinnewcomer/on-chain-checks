// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Base64 } from "../utils/Base64.sol";
import { LibString } from "../utils/LibString.sol";

contract Renderer {

    mapping (uint256 => uint256) public seedPack;
    string[] colors;
    string svg;

    function initializeContract (
        string[] memory _colors,
        string memory _svg
    ) internal {
        colors = _colors;
        svg = _svg;
    }
    
    function buildGrid(uint256 tokenId) public view returns (string memory) {
        string memory grid;
        for (uint256 j = 0; j < 8; j++) {
            grid = string.concat(
                grid, 
                column(
                    j,
                    LibString.toString(25 + (j * 30)),
                    tokenId
                )
            );
        }
        return grid;
    }

    function column(uint256 row, string memory x, uint256 tokenId) internal view returns (string memory body) {
        string memory col;
        for (uint i=0; i<10; ++i) {
            col = string.concat(
                col,
                g(
                    row, 
                    i, 
                    x, 
                    LibString.toString(uint(25 + (i*30))), 
                    tokenId
                )
            );
        }
        return col;
    }

    function g(uint256 row, uint256 col, string memory x, string memory y, uint256 tokenId) internal view returns (string memory body) {
        uint256 colorIndex = uint(uint256(keccak256(abi.encodePacked(row ^ col ^ seedPack[tokenId]))) % colors.length);
        return string.concat(
            '<g transform="translate(',
            x,
            " , ",
            y,
            ')">',
            imageSVG(colorIndex),
            "</g>"
        );
    }

    function imageSVG(uint256 colorInt) internal view returns (string memory) {
        return
            string(
                abi.encodePacked(
                    svg,
                    colors[colorInt],
                    '" />'
                )
            );

    }
}