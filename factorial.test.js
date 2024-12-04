const factorial = require('./factorial');

test('5! is 120', () => {
  expect(factorial(5)).toBe(120);
});

test('6! is 720', () => {
  expect(factorial(6)).toBe(720);
});