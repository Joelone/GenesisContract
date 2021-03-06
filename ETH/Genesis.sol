pragma solidity ^0.4.19;
/*
Name: Genesis
Dev: White Matrix co,. Ltd
*/

library SafeMath {

/**
* @dev Multiplies two numbers, throws on overflow.
*/
function mul(uint256 a, uint256 b) internal pure returns (uint256) {
if (a == 0) {
return 0;
}
uint256 c = a * b;
assert(c / a == b);
return c;
}

/**
* @dev Integer division of two numbers, truncating the quotient.
*/
function div(uint256 a, uint256 b) internal pure returns (uint256) {
// assert(b > 0); // Solidity automatically throws when dividing by 0
uint256 c = a / b;
// assert(a == b * c + a % b); // There is no case in which this doesn't hold
return c;
}

/**
* @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
*/
function sub(uint256 a, uint256 b) internal pure returns (uint256) {
assert(b <= a);
return a - b;
}

/**
* @dev Adds two numbers, throws on overflow.
*/
function add(uint256 a, uint256 b) internal pure returns (uint256) {
uint256 c = a + b;
assert(c >= a);
return c;
}
}


contract Genesis {
using SafeMath for uint256;
//mutabilityType


//Genesis parameter
uint public characterNo=3;
uint public version=1;


struct Character{
string name;
uint hp;
uint mp;
uint str;
uint inteli;
uint san;
uint luck;
uint charm;
uint mt;


}
Character[] characters;

function Genesis() public{


characters.push(Character("Adam0",100,100,50,50,50,50,50,0));
characters.push(Character("Adam1",100,100,50,50,50,50,50,1));
characters.push(Character("Adam2",100,100,50,50,50,50,50,2));


}

function getCharacterNo() view returns(uint _characterNo){
return characterNo;
}

function setCharacterAttributes(uint _id, uint _hp, uint _mp, uint _str, uint _inteli, uint _san, uint _luck, uint _charm){
//require check
require(characters[_id].mt == 2);
//read directly from mem
Character affectedCharacter=characters[_id];


affectedCharacter.hp=_hp;
affectedCharacter.mp=_mp;
affectedCharacter.str=_str;
affectedCharacter.inteli=_inteli;
affectedCharacter.san=_san;
affectedCharacter.luck=_luck;
affectedCharacter.charm=_charm;

//need rewrite as a function
if(affectedCharacter.hp <0){
affectedCharacter.hp = 0;
}else if(affectedCharacter.hp>100){
affectedCharacter.hp = 100;

}else if(affectedCharacter.mp<0){
affectedCharacter.mp = 0;

}else if(affectedCharacter.mp>100){
affectedCharacter.mp = 100;

}else if(affectedCharacter.str<0){
affectedCharacter.str = 0;

}else if(affectedCharacter.str>100){
affectedCharacter.str = 100;

}else if(affectedCharacter.inteli<0){
affectedCharacter.inteli = 0;

}else if(affectedCharacter.inteli>100){
affectedCharacter.inteli = 100;

}else if(affectedCharacter.san<0){
affectedCharacter.san = 0;

}else if(affectedCharacter.san>100){
affectedCharacter.san = 100;

}else if(affectedCharacter.luck<0){
affectedCharacter.luck = 0;

}else if(affectedCharacter.luck>100){
affectedCharacter.luck = 100;

}else if(affectedCharacter.charm<0){
affectedCharacter.charm = 0;

}else if(affectedCharacter.charm>100){
affectedCharacter.charm = 100;

}


characters[_id]=affectedCharacter;

}

function affectCharacter(uint _id, uint isPositiveEffect){
require(characters[_id].mt != 0);
Character affectedCharacter=characters[_id];
if(isPositiveEffect==0){

affectedCharacter.hp=affectedCharacter.hp-getRand();
affectedCharacter.mp=affectedCharacter.mp-getRand();
affectedCharacter.str=affectedCharacter.str-getRand();
affectedCharacter.inteli=affectedCharacter.inteli-getRand();
affectedCharacter.san=affectedCharacter.san-getRand();
affectedCharacter.luck=affectedCharacter.luck-getRand();
affectedCharacter.charm=affectedCharacter.charm-getRand();


}else if(isPositiveEffect==1){

affectedCharacter.hp=affectedCharacter.hp+getRand();
affectedCharacter.mp=affectedCharacter.mp+getRand();
affectedCharacter.str=affectedCharacter.str+getRand();
affectedCharacter.inteli=affectedCharacter.inteli+getRand();
affectedCharacter.san=affectedCharacter.san+getRand();
affectedCharacter.luck=affectedCharacter.luck+getRand();
affectedCharacter.charm=affectedCharacter.charm+getRand();


}
//need rewrite as a function
if(affectedCharacter.hp <0){
affectedCharacter.hp = 0;
}else if(affectedCharacter.hp>100){
affectedCharacter.hp = 100;

}else if(affectedCharacter.mp<0){
affectedCharacter.mp = 0;

}else if(affectedCharacter.mp>100){
affectedCharacter.mp = 100;

}else if(affectedCharacter.str<0){
affectedCharacter.str = 0;

}else if(affectedCharacter.str>100){
affectedCharacter.str = 100;

}else if(affectedCharacter.inteli<0){
affectedCharacter.inteli = 0;

}else if(affectedCharacter.inteli>100){
affectedCharacter.inteli = 100;

}else if(affectedCharacter.san<0){
affectedCharacter.san = 0;

}else if(affectedCharacter.san>100){
affectedCharacter.san = 100;

}else if(affectedCharacter.luck<0){
affectedCharacter.luck = 0;

}else if(affectedCharacter.luck>100){
affectedCharacter.luck = 100;

}else if(affectedCharacter.charm<0){
affectedCharacter.charm = 0;

}else if(affectedCharacter.charm>100){
affectedCharacter.charm = 100;

}


characters[_id] = affectedCharacter;
}


function getRand() public view returns (uint256 _rand){
uint256 rand = uint256(sha256(block.timestamp, block.number-rand-1)) % 10 +1;
return rand;
}
function insertCharacter(string _name, uint _hp, uint _mp, uint _str, uint _inteli, uint _san, uint _luck, uint _charm, uint _mt) returns (uint _id){
uint checkresult = checkLegal( _hp, _mp, _str, _inteli, _san, _luck, _charm, _mt);
require(checkresult == 1);
//需要check合法性
characterNo++;
characters.push(Character(_name, _hp, _mp, _str, _inteli, _san, _luck, _charm, _mt));

return characterNo;

}
function checkLegal(uint _hp, uint _mp, uint _str, uint _inteli, uint _san, uint _luck, uint _charm, uint _mt) returns (uint _checkresult){
if((_hp<0)||(_hp>100)){
return 0;
}else if((_mp<0)||(_mp>100)){
return 0;
}else if((_str<0)||(_str>100)){
return 0;
}else if((_inteli<0)||(_inteli>100)){
return 0;
}else if((_san<0)||(_san>100)){
return 0;
}else if((_luck<0)||(_luck>100)){
return 0;
}else if((_charm<0)||(_charm>100)){
return 0;
}else if((_mt<0)||(_mt>2)){
return 0;
}
return 1;

}

// This function will return all of the details of the pokemons
function getCharacterDetails(uint _characterId) public view returns (
string _name,
uint _hp,
uint _mp,
uint _str,
uint _int,
uint _san,
uint _luck,
uint _charm,
uint _mt
) {

Character storage _characterinfo = characters[_characterId];

_name = _characterinfo.name;
_hp = _characterinfo.hp;
_mp = _characterinfo.mp;
_str = _characterinfo.str;
_int = _characterinfo.inteli;
_san = _characterinfo.san;
_luck = _characterinfo.luck;
_charm = _characterinfo.charm;
_mt = _characterinfo.mt;

}

}
