// migrations/2_deploy_hello.js

// Import the HelloWorld contract...
const HelloWorld = artifacts.require("HelloWorld");

module.exports = (deployer) => {
  // Deploy it!
  deployer.deploy(HelloWorld);
}