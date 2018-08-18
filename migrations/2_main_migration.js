var LostItemToken = artifacts.require("./LostItemToken.sol");

module.exports = function(deployer) {
  deployer.deploy(LostItemToken);
};
