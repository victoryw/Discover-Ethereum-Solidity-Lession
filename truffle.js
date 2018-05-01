// See <http://truffleframework.com/docs/advanced/configuration>
// to customize your Truffle configuration!

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1', // localhost
      port: 8545,
      network_id: '*',
      from: '0x58ad9aa3985eaa65a05db440b03af7cff195300f',
    },
  },
};
