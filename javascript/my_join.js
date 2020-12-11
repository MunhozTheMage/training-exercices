/*
  ~ Exercise Desciption ~

   "Implementar o método Array#my_join (lê-se "o método de 
    instância :my_join da classe Array") com o mesmo 
    comportamento do método :join."

  - Versão Javascript.
*/

// Function
Array.prototype.myJoin = function (delimiter = '') {
    return this.reduce((acc, i) => "" + acc + delimiter + i);
};

// Tests
console.log([1, 2, 3, 4, 5].myJoin(0));
//==> '102030405'
console.log([1, 2, 3, 4, 5].myJoin('||'));
//==> '1||2||3||4||5'
console.log(['a','b','c','d'].myJoin([0, 1]));
//==> 'a0,1b0,1c0,1d'
console.log([1, 2, 3, 4, 5, 6, 7, 8].myJoin());
//==> 12345678