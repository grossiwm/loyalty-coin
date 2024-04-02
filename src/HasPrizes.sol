// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract HasPrizes {

    struct Prize {
        string name;
        uint256 quantity;
        bool isAvailable;
        uint256 price;
    }

    uint256 private nextPrizeId;

    mapping(uint256 id => Prize prize) private prizes;

    function addPrize(string memory name, uint256 quantity, uint256 price) public {
        prizes[++nextPrizeId] = Prize(name, quantity, true, price);
    }

    function updatePrizeAvailability(uint256 prizeId, bool isAvailable) public {
        require(bytes(prizes[prizeId].name).length != 0, "Prize does not exist");
        prizes[prizeId].isAvailable = isAvailable;
    }

    function getPrize(uint256 prizeId) public view returns (Prize memory) {
        return prizes[prizeId];
    }

}