function price(){
let itemPrice = document.getElementById("item-price");
   
 itemPrice.addEventListener('change', function(){
  const price = itemPrice.value;

  document.getElementById("add-tax-price").textContent = price * 0.1
  document.getElementById("profit").textContent = price - (price * 0.1)

})
}
window.addEventListener("load",price);

