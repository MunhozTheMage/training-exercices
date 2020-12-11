/*
  ~ Exercise Desciption ~

   "Todos os objetos em Ruby têm um método chamado `tap`,
    que passa o receiver (self) para o bloco associado e 
    depois retorna o próprio receiver (self). Note que o 
    bloco é mandatório neste método."

  - Versão Javascript.
*/

// Function
// Obs: Works only with Arrays...
Array.prototype.myTap = function (cb) {
    cb(this);
    return this;
};

// Tests
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].myTap(x => {console.log(`array:    ${x}`)}).
filter((x) => x % 2 === 0)     .myTap(x => {console.log(`evens:    ${x}`)}).
map((x) => x * x)              .myTap(x => {console.log(`squares:  ${x}`)});