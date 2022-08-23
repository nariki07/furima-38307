function count (){  
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("keyup", () => {
    
    const price = item_price.value;

    const commission = document.getElementById("add-tax-price") 
    commission.innerHTML = Math.floor(`${price*0.1}`);

    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(`${price-price*0.1}`);
  });
};

window.addEventListener('load', count);