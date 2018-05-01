const assert = require('assert');

const Rent = artifacts.require('Rent');


contract('Rent', async ([landlord, renter]) => {
  let instance;

  beforeEach('setup contract for each test', async () => {
    instance = await Rent.deployed();
  });

  it('should not forRent when contract created', async () => {
    const forRent = await instance.getForRent.call();
    assert.equal(forRent, false, 'forRent not be false when contract just created');
  });

  it('should forRent with expect rent when landlord release', async () => {
    await instance.release.sendTransaction(1500, { from: landlord, value: 50 });
    const forRent = await instance.getForRent.call();
    assert.equal(forRent, true, 'forRent not be true when contract released');
    const rent = await instance.getRental.call();
    assert.equal(rent, 1500, 'rent not same as landlord release the house');
  });

  it('should rent to renter who pay the rent', async () => {
    await instance.release.sendTransaction(1500, { from: landlord, value: 50 });
    await instance.rent.sendTransaction({ from: renter, value: 1500 });

    const forRent = await instance.getForRent.call();
    assert.equal(forRent, false, 'forRent not be false when contract rented');

    const houseRenter = await instance.getRenter.call();
    assert.equal(houseRenter, renter, 'house renter not same as the renter account');
  });
});
