const Whitelist = artifacts.require("Whitelist");

module.exports = async (deployer) => {
  await deployer.deploy(Whitelist);
};
