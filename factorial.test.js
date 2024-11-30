const factorial = require('./factorial');

test('5! is 120', () => {
  expect(factorial(5)).toBe(120);
});