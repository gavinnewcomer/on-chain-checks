# Example Implementation README
This code defines a Solidity smart contract that extends the ERC721 standard, which is used to implement non-fungible tokens. The contract is named ChecksPrimeERC721.

# Prerequisites
This code requires Solidity version 0.8.17 or higher to compile.

# Dependencies
This code imports the ERC721 contract and ChecksPrime contract, which are defined in the tokens/ERC721.sol and ChecksPrime.sol files, respectively.

# ChecksPrimeERC721 Contract
## Constructor
The constructor function is called when the contract is deployed. It sets the owner to the account that deployed the contract.

## lockSVG Function
The lockSVG function is used to lock the SVG, so it can no longer be changed. Only the contract owner can call this function.

## SVGIsLocked Error
The SVGIsLocked error is used to indicate that the SVG has been locked and can no longer be changed.

## svgIsNotLocked Modifier
The svgIsNotLocked modifier checks if the SVG is not locked. If the SVG is locked, it reverts with the SVGIsLocked error.

## setColors Function
The setColors function is used to set the available colors for the SVG. Only the contract owner can call this function, and it can only be called if the SVG is not locked.

## setSVG Function
The setSVG function is used to set the SVG template. Only the contract owner can call this function, and it can only be called if the SVG is not locked.

## initalizeTokenContract Function
The initalizeTokenContract function is used to initialize the token contract with the specified name, symbol, colors, and SVG. Only the contract owner can call this function.

## tokenURI Function
The tokenURI function is used to generate the URI for a given token ID. It returns a string that represents the JSON metadata for the token.

## safeMint Function
The safeMint function is used to mint a new token with the specified ID. If a token with the same ID has already been minted, it reverts with the ImageAlreadyMinted error. The function then mints a new image with the specified ID and transfers ownership of the token to the function caller.

# Variables
## svgIsLocked
The svgIsLocked variable is a boolean that indicates whether the SVG is locked and can no longer be changed.

# Error Messages
## SVGIsLocked
The SVGIsLocked error is used to indicate that the SVG has been locked and can no longer be changed.

## ImageAlreadyMinted
The ImageAlreadyMinted error is used to indicate that a token with the specified ID has already been minted.