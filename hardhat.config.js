/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const fs = require("fs");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-truffle5");
require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("@nomiclabs/hardhat-ethers");
require("hardhat-gas-reporter");
require("hardhat-contract-sizer");
require("solidity-coverage");

const ALCHEMY_API_KEY = fs.readFileSync("keys/alchemy", "utf-8");
const ALCHEMY_GOERLI_API_KEY = fs.readFileSync("keys/alchemy-goerli", "utf-8");
const ALCHEMY_POLYGON_API_KEY = fs.readFileSync("keys/polygon", "utf-8");
const ALCHEMY_MUMBAI_API_KEY = fs.readFileSync("keys/mumbai", "utf-8");
const INFURA_API_KEY = fs.readFileSync("keys/infura", "utf-8");
const ETHERSCAN_API_KEY = fs.readFileSync("keys/etherscan", "utf-8");
const POLYGONSCAN_API_KEY = fs.readFileSync("keys/polygonscan", "utf-8");
const mnemonic = fs.readFileSync("keys/mnemonic", "utf-8");
const mnemonic_2 = fs.readFileSync("keys/mnemonic_2", "utf-8");

module.exports = {
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1500,
      },
    },
  },
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      blockGasLimit: 90000000,
      gasPrice: 1000000000,
    },
    ganache: {
      url: `http://127.0.0.1:8545`,
    },
    goerli: {
      blockGasLimit: 90000000,
      gasPrice: 10000000000,
      url: `https://eth-goerli.g.alchemy.com/v2/${ALCHEMY_GOERLI_API_KEY}`,
      accounts: [`0x${mnemonic}`],
    },
    ropsten: {
      gasPrice: 3000000000,
      url: `https://ropsten.infura.io/v3/${INFURA_API_KEY}`,
      accounts: { mnemonic: mnemonic },
    },
    mainnet: {
      maxPriorityFeePerGas: 5000000000,
      maxFeePerGas: 60000000000,
      url: `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [`0x${mnemonic}`],
    },
    mumbai_polygon: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/${ALCHEMY_MUMBAI_API_KEY}`,
      accounts: { mnemonic: mnemonic },
    },
    mainnet_polygon: {
      url: `https://polygon-mainnet.g.alchemy.com/v2/${ALCHEMY_POLYGON_API_KEY}`,
      accounts: { mnemonic: mnemonic },
    },
  },
  etherscan: {
    apiKey: {
      mainnet: `${ETHERSCAN_API_KEY}`,
      ropsten: `${ETHERSCAN_API_KEY}`,
      goerli: `${ETHERSCAN_API_KEY}`,
      kovan: `${ETHERSCAN_API_KEY}`,
      polygon: `${POLYGONSCAN_API_KEY}`,
      polygonMumbai: `${POLYGONSCAN_API_KEY}`,
    },
    gasReporter: {
      enabled: true,
    },
    mocha: {
      timeout: 1200000,
    },
  },
};