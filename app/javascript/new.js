function check(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (price.getAttribute("data-load") != null) {
    return null;
  }
  price.setAttribute("data-load", "true");
  price.addEventListener("input", (e) => {
    value = price.value;
    //value = price.innerHTML;
    tax.innerHTML = value * 0.1 
    profit.innerHTML = value - tax.innerHTML
    //console.log(value)
    e.preventDefault();
  });
}
setInterval(check, 1000);