/*
  ~ Exercise Desciption ~

   "Tentem implementar sua própria versão do método `reduce`,
    chamado `my_reduce`, diretamente na classe Array:"

  - Versão Javascript.
*/

// Function
Array.prototype.myReduce = function (cb, initial) {
    let acc = initial || this[0];

    for(var i = initial === undefined ? 1 : 0; i < this.length; i++) {
        acc = cb(acc, this[i]);
    }

    return acc;
};

// Tests
console.log([ 1, 2, 3, 4 ].myReduce((acc, i) => i, 0));
//==> 4
console.log([ 1, 2, 3, 4 ].myReduce((acc, i) => i + acc, 5));
//==> 15
console.log([ 1, 2, 3, 4, 5 ].myReduce((acc, i) => acc * i, 1));
//==> 120
console.log([ 1, 2, 3, 4, 5 ].myReduce((acc, i) => acc * i));
//==> 120