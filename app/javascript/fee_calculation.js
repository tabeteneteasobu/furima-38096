function post (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const addTaxDom = document.getElementById("add-tax-price");
        addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
        const addPofitDom = document.getElementById("profit");
        addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
  });
 };
 
 window.addEventListener('load', post);