// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { ERC721 } from "../tokens/ERC721.sol";
import { ChecksPrime } from "../ChecksPrime.sol";

contract ChecksPrimeERC721 is ERC721, ChecksPrime {

    bool public svgIsLocked;

    error SVGIsLocked();

    constructor() {
        owner = msg.sender;
    }

    function lockSVG() public onlyOwner {
        svgIsLocked = true;
    }

    modifier svgIsNotLocked() {
        if (svgIsLocked) {
            revert SVGIsLocked();
        }
        _;
    }

    function setColors(string[] memory _colors) public onlyOwner svgIsNotLocked {
        colors = _colors;
    }

    function setSVG(string memory _svg) public onlyOwner svgIsNotLocked {
        svg = _svg;
    }

    function initalizeTokenContract(
        string memory name_,
        string memory symbol_,
        string[] memory _colors,
        string memory _svg
    ) public onlyOwner {
        _name = name_;
        _symbol = symbol_;
        initializeSVG(_colors, _svg);
    }

    function tokenURI(uint256 tokenId) public override view returns (string memory) {
        _requireMinted(tokenId);
        return readAsset(tokenId);
    }

    function safeMint(uint256 tokenId) public {
        if(_exists(tokenId)) {
            revert ImageAlreadyMinted();
        }
        mintImage(tokenId);
        _safeMint(msg.sender, tokenId);
    }
}
