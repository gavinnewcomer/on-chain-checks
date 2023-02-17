// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Renderer } from "../utils/Renderer.sol";
import { Base64 } from "../utils/Base64.sol";
import { LibString } from "../utils/LibString.sol";
import { Ownable } from "../utils/Ownable.sol";
import { ERC721 } from "./ERC721.sol";

contract ChecksPrime is ERC721, Renderer, Ownable {

    error ImageAlreadyMinted();
    error AlreadyInitialized();
    error NotInitialized();

    bool internal initialized = false;

    constructor() {
        owner = msg.sender;
    }

    function tokenURI(uint256 tokenId) public override view returns (string memory) {
        return
            string.concat(
                "data:application/json;base64,",
                Base64.encode(
                    abi.encodePacked(
                        '<?xml version="1.0" encoding="UTF-8"?><svg version="1.1" viewBox="0,0,325,325" xmlns="http://www.w3.org/2000/svg">',
                        buildGrid(tokenId),
                        '</svg>'
                    )
                )
            );
    }
    
    function mintImage(uint256 tokenId) public {
        if (colors.length == 0) {
            revert NotInitialized();
        }
        if (bytes(svg).length == 0) {
            revert NotInitialized();
        }
        if (seedPack[tokenId] != 0) {
            revert ImageAlreadyMinted();
        }
        seedPack[tokenId] = uint256(keccak256(abi.encodePacked(tokenId ^ block.number ^ block.gaslimit ^ block.timestamp)));
        super._safeMint(msg.sender, tokenId);
    }

    function initalizeContract( 
        string memory name_,
        string memory symbol_,
        string[] memory _colors,
        string memory _svg
    ) public onlyOwner {
        if (initialized) {
            revert AlreadyInitialized();
        }
        initializeContract(_colors, _svg);
        initalizeTokenContract(name_, symbol_);
        initialized = true;
    }
}