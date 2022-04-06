const Whitelist = artifacts.require("Whitelist")

require('chai')
    .use(require('chai-as-promised'))
    .should()

contract("whitelist", (accounts) => {
    let wl
    before( async() =>{
        wl = await Whitelist.new()
    })

    describe("checkWhiteList" , async() => {
        it("Add address", async() => {
        await wl.addAddress(accounts[1])
        const status = await wl.verifyUser(accounts[1])
        assert.equal(status, "You are whitelisted")
        })
        it("Remove Address" , async() => {
            await wl.removeAddress(accounts[1])
            const status = await wl.verifyUser(accounts[1])
            assert.equal(status, "You are not whitelisted")
        })
        it("Add to Arrays", async() => {
            const addresses = await web3.eth.getAccounts() // Using web3 to import the address from ganache
            await wl.addAddressArray([addresses[5], addresses[6]])
            const status = await wl.verifyUser(accounts[6])
            assert.equal(status.toString(), "You are whitelisted" )

            
        })
    })

})