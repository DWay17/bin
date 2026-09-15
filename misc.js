// misc.js
/* test */
var x = window.location.href.replace(/\w+:\/\//, "").replace(/\/.*/, "").replace(/www\w+\./, "") + "@thomas-richter.de";
if (bedingung) {
    anweisungen;
} else {
    anweisungen;
}
	
switch (variable) {
    case wert1 :
        anweisungen;
        break;
    case wert2 :
        anweisungen;
        break;
    default :
        anweisungen;
}
var temp = function () {
    var geheimnis = 42;
    return function () {
        return geheimnis;
    };
};
var geheimnisträger = temp(); //geheimnisträger ist die von temp() zurückgegebene Funktion
alert(typeof geheimnis ); // undefined
alert(geheimnisträger()); // 42

// 1: Funktionsdeklaration, a ist eine Funktion mit dem Namen a.
function a (Parameter1, Parameter2, Parameter3) {
    anweisungen;
    return ausdruck;
}

// 2: Funktionsausdruck ('function expression')
// 2.1: Normalfall, b ist eine anonyme Funktion
var b = function (...) {...};

// Anonyme Funktionen können auch direkt ausgeführt werden, ohne sie vorher einer Variable zuzuweisen 
// Dies wird häufig zur Kapselung des Gültigkeitsbereichs von Variablen verwendet
( function ( ... ) {
    anweisungen;
} )( ... );

// 2.2: benannter Funktionsausdruck ('named function expression')
// c ist hier eine Funktion mit dem Namen d. Außerhalb der
// Funktion ist sie mit c ansprechbar, innerhalb mit c und d.
var c = function d (...) {...};

// 3: Function-Konstruktor
var e = new Function('arg1', 'arg2', 'return arg1 + arg2');

// 4: 'expression closure' aus JavaScript 1.8, ähnlich dem Lambda-Kalkül
// kommt ohne geschweifte Klammern und return aus, gibt das Ergebnis von Ausdruck zurück
function f (...) ausdruck;

// 5: 'arrow functions' ab ECMAScript 2015. 
// Die Klammern sind optional, falls die Funktion genau ein Argument haben soll.
(...) => ausdruck
(...) => {...}
x => ausdruck
x => {...}

// mit Konstruktorfunktion
(new RegExp("a")).test("ab"); // true

// als Literal
/a/.test("ab"); // true

/* ######################## */

var erschaffeKatze = function () {
    var lebensZahl = 7;
    var maunz = function () {
        return (lebensZahl > 0) ? "miau" : "örks";
    };

    // gibt neues Objekt zurück
    return {
        toeten: function () {
            lebensZahl -= 1;
            alert(maunz());
        }
    };
};
var otto = erschaffeKatze();
otto.toeten(); // miau

/* ######################## */

var fisch = {
    augen: 2
};

var Mutantenfisch = function () {
    this.augen = 3;
};
Mutantenfisch.prototype = fisch;

var blinky = new Mutantenfisch();

alert(blinky.augen); // 3 - eigene Eigenschaft von blinky
delete blinky.augen; // blinkys eigene Eigenschaft wird gelöscht
alert(blinky.augen); // 2 - blinky hat die Eigenschaft selbst nicht mehr, es schimmert die Eigenschaft des Prototyps durch

/* ######################## */

document.querySelectorAll('th').forEach(th => {
  th.textContent = th.textContent.replace(/-/g, ' ');
});
document.querySelectorAll('th, td').forEach(cell => {
  cell.textContent = cell.textContent.replace(/-/g, ' ');
  cell.style.whiteSpace = 'normal';
});

document.querySelectorAll('th, td').forEach(cell => {
  cell.textContent = cell.textContent.replace(/-/g, ' ');
  cell.style.whiteSpace = 'normal';
  
  if (cell.tagName === 'TH' && cell.textContent.includes('UKSH')) {
    const row = cell.parentElement; // Get the parent row of the matching <th>
    row.querySelectorAll('th, td').forEach(siblingCell => {
      siblingCell.style.fontWeight = 'bold';
      siblingCell.style.textDecoration = 'underline';
    });
  }
});

