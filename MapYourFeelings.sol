pragma solidity ^0.4.10;

contract MapYourFeelings {
    
    struct Feeling {
        uint bad; // time the person gets in, unix timestamp
        uint fair; 
        uint excellent; // time the person gets out, unix timestamp
    }
    
    
    mapping (bytes32 => Feeling)  geo_feeling;
    
    function setFeeling(int _lat, int _long, uint8 _feeling) returns (bool) {
        
        require (_lat <= 900000 && _lat >= -90000);
        require (_long <= 1800000 && _lat >= -180000);
        
        if (_feeling == 1) {
            
            geo_feeling[sha3([_lat,_long])].bad++;
            return true;
            
        }
        
        if (_feeling == 2) {
            
            geo_feeling[sha3([_lat,_long])].fair++;
            return true;
            
        }
        
        if (_feeling == 3) {
            
            geo_feeling[sha3([_lat,_long])].excellent++;
            return true;
        }
        
       
            
        revert();
    
    }
        
   function getFeeling(int _lat, int _long) returns (uint bad,uint fair,uint excellenct) {
       
       return (geo_feeling[sha3([_lat,_long])].bad,geo_feeling[sha3([_lat,_long])].fair,geo_feeling[sha3([_lat,_long])].excellent);
       
   }
    
}
