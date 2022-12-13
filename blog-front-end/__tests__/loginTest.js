//const assert = require('chai').assert;
//const expect = require('chai').expect;

import {assert, expect} from 'chai';

import {login} from '../src/api/login.js';

describe('login', () => {
    it('should return true if user enters correct username and password', () => {
    const username = 'john123';
    const password = 'abc123';
    const result = login(username, password);
    
    expect(result).to.be.true;
});

it('should return false if user enters incorrect username or password', () => {
    const username = 'john123';
    const password = 'incorrect';
    
    const result = login(username, password);
    
    expect(result).to.be.false;
});

});