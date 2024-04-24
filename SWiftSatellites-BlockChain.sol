// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0<0.9.0;
import "@openzeppelin/contracts/utils/Counters.sol";
import "./AdminManager.sol";
contract SWiftSatellites is AdminManager{
      using Counters for Counters.Counter;
     Counters.Counter private itemId;

    struct SatelliteData {
        string ipfsHash;
        string location;
        uint dateTimeSTamp;
        address sender ;
    }

    mapping (uint=>SatelliteData) public  dataList;

    function addSatelliteData ( string memory _ipfsHash,string  memory _location ) public  onlyApproveSatalite returns (SatelliteData memory)  {
        require(bytes(_ipfsHash).length > 10, "Your ipfsHash Is invalid");
        require(bytes(_location).length > 10, "Your location Is invalid");

        itemId.increment();
        uint256 id = itemId.current();

    
    SatelliteData memory data = SatelliteData(_ipfsHash,_location,block.timestamp , msg.sender);

   dataList[id] = data;

return data;
        }

            function getAllSatelliteData() public view  onlyApproveSatalite returns (SatelliteData[] memory) {
        SatelliteData[] memory allData = new SatelliteData[](itemId.current());
        for (uint256 i = 1; i <= itemId.current(); i++) {
            allData[i - 1] = dataList[i];
        }
        return allData;
    }


}