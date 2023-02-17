# README
This code implements a smart contract in Solidity that renders an SVG image for a given tokenId. The code is released under the MIT license (SPDX-License-Identifier: MIT).

## Prerequisites
This code requires Solidity version 0.8.17 or higher to compile.

## Dependencies
This code imports two utility libraries, Base64.sol and LibString.sol, which are used to encode and manipulate strings.

## Usage
To use this contract, first deploy it to the Ethereum network. After deployment, the initializeContract function should be called to set the initial colors and SVG string for rendering.

Once the contract has been initialized, the buildGrid function can be called to generate an SVG grid for the specified tokenId. The buildGrid function returns a string that contains the SVG grid.

## Functions
### initializeContract
The initializeContract function is used to set the initial colors and SVG string for rendering. It takes two arguments: an array of strings that represent the available colors for the image, and a string that represents the SVG template for rendering the image.

### buildGrid
The buildGrid function generates an SVG grid for the specified tokenId. It returns a string that contains the SVG grid.

### column
The column function is used by buildGrid to generate a single column of the SVG grid. It takes three arguments: the row number of the column, the x-coordinate of the column, and the tokenId for generating the seed.

### g
The g function is used by column to generate a single cell of the SVG grid. It takes five arguments: the row and column numbers of the cell, the x and y coordinates of the cell, and the tokenId for generating the seed. It generates an SVG image for the cell by calling the imageSVG function.

### imageSVG
The imageSVG function generates an SVG image for the given colorInt. It takes one argument: an integer that represents the index of the color to use for the image. It returns a string that contains the SVG image.

## Variables
### seedPack
The seedPack mapping is used to store a random seed for each tokenId. The seed is generated using the keccak256 hash function with the row and column numbers and the tokenId.

### colors
The colors array contains the available colors for the image.

### svg
The svg string contains the SVG template for rendering the image.

### License
This code is released under the MIT license (SPDX-License-Identifier: MIT).