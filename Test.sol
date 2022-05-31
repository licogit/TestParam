// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test  {
    
    /**
    *
    *@param _address  
    *@param _params,param 1,2,3,5,6;for example param1 is 0.12,_params value is 11200
    */
    function M(address _address,bytes memory _params) public{
       
        // default params;
        mapping(unit8 => uint256) memory _paramMap; 
        _paramMap[1] =  0.1*10**18;
        _paramMap[2] = 0.2*10**18;
        _paramMap[3] = 1.3*10**18;
        _paramMap[5] = 0.4*10**18;
        _paramMap[6] = 1.5*10**18;
        
        uint8 byteLength = _params.length;
        uint8 index = 0;
        while(index < byteLength){

            uint8  paramIndex = uint8(_params[index]);
            index++;
            uint8 needLength = (paramIndex == 3 || paramIndex == 6) ? 5:4;
            uint8 scale = (needLength == 4) ? 17:18;

            require((index + needLength) <= byteLength, "invalid param");
            _paramMap[paramIndex] = bytesToUint(_address,index,needLength,scale);
            index = index + needLength;
        }

    }

   function bytesToUint(bytes memory b,uint8 index,uint8 _length,uint8 scale) internal returns (uint256){
        uint256 number;
        for(uint8 i = 0; i < _length; i++){
            number = number + uint256(b[i+index])*(10**(scale-i));
        }

        return number;
    }

   

    

}