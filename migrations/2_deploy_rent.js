// migrations/2_deploy_rent.js

// Import the Rent contract...
const rent = artifacts.require('Rent');

module.exports = (deployer) => {
  deployer.deploy(rent);
};
