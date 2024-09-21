// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "solmate/tokens/ERC20.sol";
import "./libraries/Math.sol";
import "./libraries/UQ112x112.sol";
import "./interfaces/IZuniswapV2Callee.sol";

contract ZuniswapV2Pair is ERC20, Math {
    uint256 private reserve0;
    uint256 private reserve1;


    //底层函数：添加流动性，铸造LP token
    function mint() public {
        
    }
}
