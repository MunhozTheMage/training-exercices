/*
  ~ Exercise Desciption ~

   "Permitir ao método Array#qs implementado anteriormente 
    que receba um bloco opcional, o qual poderá ser usado 
    para alterar a forma como 2 elementos da coleção são 
    comparados, permitindo na prática que se faça qualquer 
    tipo de comparação, similar à forma como o método :sort 
    funciona."

  - Versão Javascript.
*/

// Functions
Array.prototype.myQs = function (evalFunction) {
    if (this.length <= 1) return this;

    const [pivot, ...rest] = this;
    let lowestOrEqual, highest;

    if (!!evalFunction) {
        lowestOrEqual = [];
        highest = [];

        rest.forEach(item => {
            const compare = evalFunction(item, pivot);
            if(compare <= 0) lowestOrEqual.push(item);
            if(compare > 0) highest.push(item);
        });

        return [...lowestOrEqual.myQs(evalFunction), pivot, ...highest.myQs(evalFunction)];
    }
    else {
        lowestOrEqual = rest.filter((item) => item <= pivot);
        highest = rest.filter((item) => item > pivot);
        return [...lowestOrEqual.myQs(), pivot, ...highest.myQs()];
    }
}

// Tests
// For tests purposes only.
function sumDigits(integer = 0) {
    return `${integer}`.split('').reduce((acc, digit) => (+acc) + (+digit));
}

console.log([3, 4532, 2, 123, 54, 93523].myQs());
//==> [ 2, 3, 54, 123, 4532, 93523 ]
console.log("=================================");

console.log([123, 55, 11111, 9].myQs((a, b) => sumDigits(a) - sumDigits(b)));
//==> [ 11111, 123, 9, 55 ]
console.log("=================================");

console.log([3, 2, 4, 5, 0, 1].myQs());
//==> [0, 1, 2, 3, 4, 5]
console.log("=================================");

console.log([3, 2, 4, 5, 0, 1].myQs((a, b) => b - a));
//==> [5, 4, 3, 2, 1, 0]