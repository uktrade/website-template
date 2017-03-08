var textProperty = ('innerText' in element) ? 'innerText' : 'textContent';
try {
element[textProperty] = text;
}
catch (anException) {
//IE<9 FIX
element.setAttribute('innerText', text);
}